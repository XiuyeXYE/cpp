#include"../xylib/xiuye"
#include<sys/types.h>
#include<sys/socket.h>
#include <netinet/in.h>
#include <unistd.h>
#include <arpa/inet.h>

using namespace xiuye;

void print_my_port_num(int sock){
    char buf[48];
    struct sockaddr_in s;
    socklen_t sz;
    sz = sizeof(s);
    if(getsockname(sock,(struct sockaddr*)&s,&sz)!=0){
        println("getsockname failed");
        return;
    }
    inet_ntop(AF_INET,&s.sin_addr,buf,sizeof(buf));
    println(buf,":",ntohs(s.sin_port),s.sin_port);


}

int main(){

    //tcp
    int s0 = socket(AF_INET,SOCK_STREAM,0);
    struct sockaddr_in peer;
    socklen_t peerlen;

    if(listen(s0,5)!=0){
        log("listen");
        return -1;
    }

    print_my_port_num(s0);

    peerlen = sizeof(peer);
    int sock = accept(s0,(struct sockaddr*)&peer,&peerlen);

    if(sock<0){
        log("accept failed");
        return -2;
    }

    const char*s = "HOGE\n";

    write(sock,s,len(s));

    close(sock);
    close(s0);

    return 0;
}