#define _BSD_SOURCE
#include"../common"


#define LEN (1024 * 1024)
#define SHELL_FMT "cat /proc/%ld/maps | grep zero"
#define CMD_SIZE (sizeof(SHELL_FMT)+20)



int main(int argc,char*argv[]){

    char cmd[CMD_SIZE];
    char *addr;
    addr = (char*)mmap(NULL,LEN,PROT_NONE,MAP_SHARED|MAP_ANONYMOUS,-1,0);
    if(addr == MAP_FAILED){
        // errExit("mmap");
        return -1;
    }

    println("before mprotect");
    snprintf(cmd,CMD_SIZE,SHELL_FMT,(long)getpid());
    system(cmd);

    if(mprotect(addr,LEN,PROT_READ|PROT_WRITE) == -1){
        // errExit("mprotect");
        return -2;
    }

    println("after mprotect()");
    system(cmd);


    return 0;

};