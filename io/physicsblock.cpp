#include"iocommon"

int get_block(int fd,int logical_block){
    int ret;
    errno = 0;
    ret = ioctl(fd,FIBMAP,&logical_block);
    // log("physics block",logical_block);
    int err = errno;
    if(ret < 0){
        log("ioctl failed",ret,err,gai_strerror(err),strerror(err));
        return -1;
    }
   
    return logical_block;
}

int get_nr_blocks(int fd){
    struct stat buf;
    int ret;
    ret = fstat(fd,&buf);

    if(ret < 0){
        log("fstat failed");
        return -1;
    }
    return buf.st_blocks;

}

void print_blocks(int fd){

    int nr_blocks,i;
    nr_blocks = get_nr_blocks(fd);
    if(nr_blocks < 0){
        log("get_nr_blocks failed");
        return;
    }
    if(nr_blocks==0){
        log("no allocated blocks");
        return;
    }
    else if(nr_blocks==1){
        log("1 blocks");

    }
    else{
        log(nr_blocks,"blocks");
    }

    for(i=0;i<nr_blocks;i++){
        int phys_block;
        phys_block = get_block(fd,i);
        if(phys_block<0){
            log("get_block failed");
            return;
        }
        // if(!phys_block){
        //     continue;
        // }
        log(i,phys_block);
    }
    log("\n");

}

int main(int argc, char *argv[]){

    // int uid = getuid();
    // log("uid:",uid);
    // setgid(0);
    // int u = setuid(0);
    
    // int err = errno;
    // log("u:",u,err,gai_strerror(err),strerror(err));


    int fd;
    if(argc<2){
        log("usage:",argv[0],"<file>");
        return -1;
    }

    fd = open(argv[1],O_RDONLY);
    if(fd<0){
        log("open failed");
        return -2;
    }
    print_blocks(fd);



    return 0;
}