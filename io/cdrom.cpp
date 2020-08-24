#include"../common"

int main(int argc,char *argv[]){

    int fd,ret;
    if(argc<2){
        log("usage:",argv[0],"<device to eject>");
        return -1;
    }

    fd = open(argv[1],O_RDONLY|O_NONBLOCK);
    if(fd<0){
        log("open failed");
        return -2;
    }

    ret = ioctl(fd,CDROMEJECT,0);
    if(ret){
        log("ioctl failed",errno,strerror(errno));
        return -3;
    }

    ret = close(fd);
    if(ret){
        log("close failed");
        return -5;
    }

    return 0;
}