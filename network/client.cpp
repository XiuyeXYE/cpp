#include"../common"

/*https://github.com/XiuyeXYE/cpp*/

/*g++ filename.cpp -lpthread*/

int main(){

    int sockfd;
    int length;
    struct sockaddr_un addr;
    int result;

    char ch = 'A';

    sockfd = socket(AF_UNIX,SOCK_STREAM,0);

    addr.sun_family = AF_UNIX;
    strcpy(addr.sun_path,"server_socket");
    length = sizeof(addr);

    result = connect(sockfd,(struct sockaddr*)&addr,length);

    if(result==-1){
        log("oops:client1");
        return -1;
    }
    write(sockfd,&ch,1);
    read(sockfd,&ch,1);
    log("char from server =",ch);
    close(sockfd);



    return 0;
}