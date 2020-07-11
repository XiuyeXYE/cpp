#include"iocommon"

#define TIMEOUT 5



int main(){

    struct pollfd fds[2];
    int ret;

    fds[0].fd = STDIN_FILENO;
    fds[0].events = POLLIN;

    fds[1].fd = STDOUT_FILENO;
    fds[1].events = POLLOUT;

    ret = poll(fds,2,TIMEOUT*1000);

    if(ret == -1){
        perror("poll failed");
        return -1;
    }
    if(!ret){
        log(TIMEOUT,"seconds elapsed.");
        return 0;
    }
    if(fds[0].revents&POLLIN){
        log("stdin is readable");
    }
    if(fds[1].revents & POLLOUT){
        log("stdout is writable");
    }
    return 0;


}