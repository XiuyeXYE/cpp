#include"../common"


void co_fp0(){

    int *iretp = (int*)aco_get_arg();
    aco_t* this_co = aco_get_co();
    int ct = 0;
    while(ct < 6){
        printf(
            "co:%p save_stack:%p share_stack:%p yield_ct:%d\n",
            this_co, this_co->save_stack.ptr,
            this_co->share_stack->ptr, ct
        );
        // Yield the execution of current co and resume the execution of
        // `co->main_co`. The caller of `aco_yield()` must be a non-main co.
        aco_yield();
        (*iretp)++;
        ct++;
    }
    printf(
        "co:%p save_stack:%p share_stack:%p co_exit()\n",
        this_co, this_co->save_stack.ptr,
        this_co->share_stack->ptr
    );
    // In addition do the same as `aco_yield()`, `aco_exit()` also set 
    // `co->is_end` to `1` thus to mark the `co` at the status of "END".
    aco_exit();

}

int main(){
#ifdef ACO_USE_VALGRIND
    if(0){
        printf("%s doesn't have valgrind test yet, "
            "so bypass this test right now.\n",__FILE__
        );
        exit(0);
    }
#endif
    // Initialize the aco environment in the current thread.
    aco_thread_init(NULL);

    // Create a main coroutine whose "share stack" is the default stack 
    // of the current thread. And it doesn't need any private save stack 
    // since it is definitely a standalone coroutine (which coroutine 
    // monopolizes it's share stack).
    aco_t* main_co = aco_create(NULL, NULL, 0, NULL, NULL);

    // Create a share stack with the default size of 2MB and also with a 
    // read-only guard page for the detection of stack overflow.
    aco_share_stack_t* sstk = aco_share_stack_new(0);

    int co_ct_arg_point_to_me = 0;
    // Create a non-main coroutine whose share stack is `sstk` and has a
    // default 64 bytes size private save stack. The entry function of the 
    // coroutine is `co_fp0`. Set `co->arg` to the address of the int 
    // variable `co_ct_arg_point_to_me`.
    aco_t* co = aco_create(main_co, sstk, 0, co_fp0, &co_ct_arg_point_to_me);

    int ct = 0;
    while(ct < 6){
        assert(co->is_end == 0);
        // Start or continue the execution of `co`. The caller of this function
        // must be main_co.
        aco_resume(co);
        // Check whether the co has completed the job it promised.
        assert(co_ct_arg_point_to_me == ct);
        printf("main_co:%p\n", main_co);
        ct++;
    }
    aco_resume(co);
    assert(co_ct_arg_point_to_me == ct);
    // The value of `co->is_end` must be `1` now since it just suspended 
    // itself by calling `aco_exit()`.
    assert(co->is_end);

    printf("main_co:%p\n", main_co);

    // Destroy co and its private save stack.
    aco_destroy(co);
    co = NULL;
    // Destroy the share stack sstk.
    aco_share_stack_destroy(sstk);
    sstk = NULL;
    // Destroy the main_co.
    aco_destroy(main_co);
    main_co = NULL;



    return 0;
}
