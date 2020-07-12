/*
https://github.com/XiuyeXYE/cpp
*/
#include"iocommon"
#define NR_OPEN 1024
/*
linux includes:

#include <unistd.h>
int daemon (int nochdir, int noclose);
如果 nochdir 非 0,daemon 将不改变工作目录为 root 目录;如果 noclose 非 0,daemon
将不关闭所有已打开文件描述符。如果父进程已经设置 daemon 过程,这些选项就非常有用。
不过通常都给这两个参数传递 0。
成功时调用返回 0;失败时返回-1,并设置 errno 为 fork()或者 setsid()的错误代码。


*/
int main(){

    pid_t pid;
    int i;
    pid = fork();

    if(pid == -1){
        return -1;
    }
    else if(pid){
        exit(EXIT_SUCCESS);
    }
    if(setsid()==-1){
        return -1;
    }
    if(chdir("/")==-1){
        return -1;
    }
    log("NR_OPEN:",NR_OPEN);
    for(i=0;i<NR_OPEN;i++){
        close(i);
    }
    open("/dev/null",O_RDWR);/* stdin */
    dup(0);/* stdout */
    dup(0);/* stderror */

    // for(;;){
    //     log("ready");
    // }


    return 0;
}