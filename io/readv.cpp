#include"iocommon"

/*
    file permission up to root! ???
*/

int main(){

    errno = 0;

    int currUid = getuid();
    log("current use id:",currUid);

    //root
    int err = setuid(0);

    if(err == -1){
        log(err,errno,strerror(errno));
    }

    char foo[48],bar[51],baz[49];

    struct iovec iov[3];
    ssize_t nr;

    int fd,i;
    fd = open("buccaneer.txt",O_RDONLY);

    if(fd == -1){
        log("open failed");
        return -1;
    }

    iov[0].iov_base = foo;
    iov[0].iov_len = sizeof (foo);
    iov[1].iov_base = bar;
    iov[1].iov_len = sizeof (bar);
    iov[2].iov_base = baz;
    iov[2].iov_len = sizeof (baz);


    nr = readv(fd,iov,3);

    if(nr == -1){
        log("readv failed");
        return -2;
    }

    for(i=0;i<3;i++){
        log(i,(char*)iov[i].iov_base);
        
    }
    if(close(fd)){
        log("close failed");
        return -3;
    }


    return 0;
}