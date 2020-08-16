#include"xylib/xiuye"
#include<sys/types.h>
#include<sys/socket.h>
#include <netinet/in.h>
#include <unistd.h>
#include <arpa/inet.h>
#include<string.h>

using namespace xiuye;


int main(){

    struct sockaddr_in server;
    int sock;
    char buf[32];
    int n;
    sock = socket(AF_INET,SOCK_STREAM,0);
    server.sin_family = AF_INET;
    server.sin_port = htons(12345);
    inet_pton(AF_INET,"127.0.0.1",&server.sin_addr.s_addr);

    connect(sock,(struct sockaddr*)&server,sizeof(server));

    memset(buf,0,sizeof(buf));

    n = read(sock,buf,sizeof(buf));

    println(n,buf);

    close(sock);


    return 0;
}