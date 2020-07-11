#include"iocommon"

int main(int argc,char *argv[]){

    struct stat sb;
    off_t length;
    char *p;
    int fd;

    if(argc < 2){
        fprintf(stderr,"usage:%s<file>\n",argv[0]);
        return 1;
    }

    fd = open(argv[1],O_RDONLY);
    if(fd == -1){
        log("open failed");
        return -1;
    }

    if(fstat(fd,&sb) == -1){
        log("fstat error");
        return -1;
    }
    log("st_mode:",sb.st_mode,S_ISREG(sb.st_mode));
    log("st_size:",sb.st_size);
    if(!S_ISREG(sb.st_mode)){
        log(argv[1],"is not a file");
        return -2;
    }


    p = static_cast<char*>(mmap(0,sb.st_size,PROT_READ,MAP_SHARED,fd,0));
    if(p==MAP_FAILED){
        log("mmap failed");
        return -3;
    }

    if(close(fd)==1){
        log("close failed");
        return -5;
    }

    for(length = 0;length<sb.st_size;length++){
        putchar(p[length]);
    }

    if(munmap(p,sb.st_size)==-1){
        log("munmap failed");
        return -7;
    }


    




    return 0;
}