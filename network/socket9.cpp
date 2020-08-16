#include"../xylib/xiuye"
#include<cstdio>
#include<cstring>
#include<sys/types.h>
#include<sys/socket.h>
#include<netinet/in.h>
#include<unistd.h>
#include<arpa/inet.h>
#include<netdb.h>
#include<netinet/in.h>
#include<fcntl.h>


using namespace xiuye;


int main(int argc,char *argv[]){

    const char * service = "12345";
    struct addrinfo hints,*res0,*res;

    if(argc != 3){
        log(stderr,"Usage:",argv[0],"hostname filename");
        return -1;
    }


    int fd = open(argv[2],O_RDONLY);

    if(fd < 0){
        log("open",fd);
        return -2;
    }

    memset(&hints,0,sizeof(hints));

    hints.ai_socktype = SOCK_STREAM;
    hints.ai_family = PF_UNSPEC;

    int err;
    if((err = getaddrinfo(argv[1],service,&hints,&res0))!=0){
        log("error:",err,":",gai_strerror(err));
        return -3;
    }

    int sock;
    for(res = res0;res!=NULL;res=res->ai_next){
        sock = socket(res->ai_family,res->ai_socktype,res->ai_protocol);
        if(sock < 0){
            continue;
        }
        if(connect(sock,res->ai_addr,res->ai_addrlen)!=0){
            log(sock,"OK");
            close(sock);
            continue;
        }
        break;
    }

    freeaddrinfo(res0);

    if(res == NULL){
        log("failed");
        return -3;
    }

    int n;
    char buf[65536];
    while((n=read(fd,buf,sizeof(buf)))>0){
        int ret = write(sock,buf,n);
        if(ret<1){
            log("write");
            break;
        }
    }

    close(sock);
    

    return 0;
}