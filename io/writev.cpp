#include"iocommon"

/*
    file permission up to root! ???
*/

int main(){

    struct iovec iov[3];
    ssize_t nr;
    int fd,i;
    const char *buf[] = {
                "The term buccaneer comes from the word boucan.\n",
                "A boucan is a wooden frame used for cooking meat.\n",
                "Buccaneer is the West Indies name for a pirate.\n" };

    fd = open("buccaneer.txt",O_WRONLY|O_CREAT|O_TRUNC);
    if(fd == -1){
        log("open failed");
        return -1;
    }
    for(i=0;i<3;i++){
        //1.直接(void*) OK
        //2.默认是 const char * => const void * , 
        //所以 必须在次 const void* => void* ;
        //分了两步走!
        iov[i].iov_base = const_cast<void*>(static_cast<const void*>(buf[i]));
        iov[i].iov_len = slen(buf[i]);
    }

    nr = writev(fd,iov,3);
    if(nr == -1){
        log("writev failed");
        return -2;
    }
    log("wrote",nr,"bytes");
    if(close(fd)){
        log("close error");
        return -3;
    }



    return 0;
}
