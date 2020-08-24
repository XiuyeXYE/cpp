#include"../common"

//.intel_syntax noprefix

#define as(...) asm volatile(__VA_ARGS__)

/*
    函数的内存布局
    (rsp -> stack top ; rbp -> stack bottom ; )
    栈底是高地址,栈顶是低地址,增长方向由高到低!
    eg. 
        1:
        //call test_ret; 
        push rip+1  //下一个指令的位置,并不是 call之前的原地址!!!记住重点,要加1
        jmp test_ret
        
        2
        //每次call test_ret 都有
        //push prev_rip+1 
        test_ret:
            push rbp;//保存前一个函数栈帧(底)地址
            mov rbp,rsp;//设置当前的栈底,并且也保存了rsp
            ...中间代码...
            ...
            ...

            //leave 合并
            mov rsp,rbp
            pop rbp
            
            //ret 合并
            pop rip
            jmp rip 
        
        3.栈内数据(X64:8bytes 地址数据)
        H   prev_rip+1
            prv_rbp
            ...   <- new_rbp = rsp
            ...
        L

        5.读数据 从低地址往高地址 读,读数据顺序 和 栈增长数据方向 高->低,key for acknowledge process

*/

void test_ret(){
    

    size_t curr_rip = 0;
    #ifdef __x86_64__
    //test
    as(
        "movq 8(%%rsp),%0;"
        // "movq %%rax,%0;"
        :"=a"(curr_rip)
    );
    //rbp 和 rsp在中间代码中 并不相等!!!这句输出地址有可能是错误的
    log("prev rip=0x",std::hex,curr_rip,(size_t)test_ret);//test

    as(
        "movq 8(%%rbp),%0;"
        // "movq %%rax,%0;"
        :"=a"(curr_rip)
    );
    //rbp 和 rsp在中间代码中 并不相等!!!
    //只有和main 地址相差不大,才可能正确的指令地址
    log("prev rip=0x",std::hex,curr_rip,(size_t)test_ret);//test

    as("movq (%%rbp),%0;":"=a"(curr_rip));//test
    log("prev ebp=",std::hex,curr_rip);//test

    as("movq 8(%%rbp),%0;":"=a"(curr_rip));//test

    log("rip =",std::hex,curr_rip);//test_ret 之后的指令地址!!!

    // as("jmpq *%0;"::"m"(curr_rip));

    // as("leave;retq;");//OK
    //leave -> 恢复前一个函数的栈帧(栈底)地址,恢复rsp的指向
    as("movq %rbp,%rsp;popq %rbp;");
    //ret
    as("popq %rax;jmpq *%rax;"); //perfect to 退出本函数
    //这个内嵌汇编 jmp后是指针地址 ,不能忽视 * 号
    //要indirect , 不能 direct!!!(就是直译的意思:间接)
    // as("movq 8(%rbp),%rax;jmp *%rax;"); 

    //这句是不会执行的!嘿嘿...
    log("最后说一句,最后走没有走这里!");


    #endif
}


int main(){

    log("main address:",std::hex,(size_t)main);
    log("test start...");
    //<=> call test_ret
    test_ret();//test_ret 栈帧中存储的指令地址,是test_ret 之后的 首地址;也就是下一句开头指令地址;
    log("test end...");

    //指令的地址 和 数据的地址 是不一样的!!!不一定是线性连在一起的!!!


    return 0;
}