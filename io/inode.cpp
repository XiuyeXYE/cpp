#include"iocommon"

int get_inode(int fd){
    struct stat buf;
    int ret;

    ret = fstat(fd,&buf);

    if(ret < 0){
        log("fstat failed");
        return -1;
    }
    return buf.st_ino;
}



int main(int argc,char*argv[]){

    int fd,inode;
    if(argc<2){
        fprintf(stderr,"usage:%s<file>\n",argv[0]);
        return 1;
    }

    fd = open(argv[1],O_RDONLY);

    if(fd<0){
        log("open failed");
        return -3;
    }
    inode = get_inode(fd);
    log(inode);


    return 0;
}