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

int main(int argc, char* argv[]){

    if(argc != 2){
        log("Usage:",argv[0],"dest");
        return -1;
    }

    char *deststr = argv[1];

    struct addrinfo hints,*res0,*res;
    memset(&hints,0,sizeof(hints));
    hints.ai_socktype = SOCK_STREAM;
    hints.ai_family = PF_UNSPEC;

    int err;
    if((err=getaddrinfo(deststr,"http",&hints,&res0))!=0){
        log("ERROR:",gai_strerror(errno));
        return -2;
    }
    int sock;
    for(res = res0;res != NULL;res=res->ai_next){
        log(res->ai_family);
        sock = socket(res->ai_family,res->ai_socktype,res->ai_protocol);
        if(sock<0){
            continue;
        }

        if(connect(sock,res->ai_addr,res->ai_addrlen)!=0){
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


    char buf[32];

    snprintf(buf,sizeof(buf),"GET / HTTP/1.0\r\n\r\n");

    int n = write(sock,buf,(int)strlen(buf));

    if(n < 0){
        log("write failed");
        return -5;
    }

     while (n > 0) {
        n = read(sock, buf, sizeof(buf));

        if (n < 0) {
            perror("read");
            return 1;
        }

        write(fileno(stdout), buf, n);
    }

    close(sock);



    return 0;
}


