#include"iocommon"

int main(){

    int fd;
    fd = open (file, O_WRONLY | O_SYNC);
    if (fd == -1) {
    perror ("open");
        return -1;
    }

    ssize_t ret;
    int length=20;
    unsigned char buf[20];
    while(length!=0&&(ret=read(fd,buf,length))!=0){
        if(ret == -1){
            if(errno == EINTR){
                continue;
            }
            println("read failed");
            break;
        }
        len -= ret;
        buf += ret;
    }

    return 0;
}
