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


using namespace xiuye;


int main(){

    struct addrinfo hints,*res;
    memset(&hints,0,sizeof(hints));
    hints.ai_family = AF_INET;
    hints.ai_flags = AI_PASSIVE;
    hints.ai_socktype = SOCK_STREAM;

    int err = getaddrinfo(NULL,"12345",&hints,&res);
    if(err != 0){
        log("getaddrinfo:",gai_strerror(err));
        return -1;
    }

    int sock0 = socket(res->ai_family,res->ai_socktype,0);

    if(sock0 <0){
        log("socket failed");
        return -2;
    }

    if(bind(sock0,res->ai_addr,res->ai_addrlen)!=0){
        log("bind failed");
        return -2;
    }

    freeaddrinfo(res);

    listen(sock0,5);


    struct sockaddr_in client;
    socklen_t length = sizeof(client);
    int sock = accept(sock0, (struct sockaddr*)&client, &length);

    char str[] = "HELLO";

    write(sock,str,len(str));

    close(sock);
    close(sock0);

    return 0;
}



