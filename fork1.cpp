#include"xylib/xiuye"
#include<unistd.h>
#include <signal.h>
// #include <sys/types.h>
#include <wait.h>

using namespace xiuye;

//println_sepetator = ';';//在外面无法使用命名空间内的全局变量!
namespace test{
    int a = 100;
}

void func(int s){
        
    println("child died",s);
    // exit(0);
}

int main(){

    signal(SIGCHLD,func);

    // println_sepetator = ';';//OK,function inner!

    if(fork()){
        println("id:",wait(nullptr));
        println("father",getpid());
    }  
    else{
        println("son",getpid(),getppid());
    }
    println("test::a=",test::a);

    println("println_sepetator=",println_sepetator);

    return 0;
}