#include"../xylib/xiuye"
#include<cstdio>
#include<cstring>
#include<sys/types.h>
#include<sys/socket.h>
#include<netinet/in.h>
#include<unistd.h>
#include<arpa/inet.h>
#include<netdb.h>
#include <netinet/in.h>

using namespace xiuye;

int main(){

    const char * hostname = "localhost";
    
    
    struct addrinfo hints,*res;

    memset(&hints,0,sizeof(hints));
    hints.ai_socktype = SOCK_STREAM;
    hints.ai_family = AF_INET;
    int err;
    if((err = getaddrinfo(hostname,NULL,&hints,&res))!=0){
        log("error",err);
        return -1;
    }
    struct in_addr addr;
    addr.s_addr = ((struct sockaddr_in*)(res->ai_addr))->sin_addr.s_addr;
    char buf[16];
    inet_ntop(AF_INET,&addr,buf,sizeof(buf));
    log("ip address:",buf);

    freeaddrinfo(res);


   

    return 0;
}