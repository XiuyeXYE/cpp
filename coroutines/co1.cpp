#include"../common"

#define comac_get_args_cnt( ... ) comac_arg_n( __VA_ARGS__ )
#define comac_arg_n( _0,_1,_2,_3,_4,_5,_6,_7,N,...) N

#define comac_join_1( x,y ) x##y
#define comac_join_2(x) #x
// #define comac_join_3(x) x# //error
#define comac_join_5(x) 1##x



int main(){


    log(comac_join_1(1,2),comac_join_2(a),comac_join_5(1));

    typeof(1) a=1;
    decltype(1) b = 1;

    log(a,b);

    size_t ptr = 0;

    // asm volatile("movq %%rip,%0":"=a"(ptr));

    // log("EIP:",ptr);

    ucontext_t context;
    getcontext(&context);

    ::puts("Hello World");
    sleep(1);
    setcontext(&context);

    return 0;
}