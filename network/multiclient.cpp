#include"../common"

/*https://github.com/XiuyeXYE/cpp*/


int main(){

    int sockfd;
    int length;
    struct sockaddr_in addr;
    int result;

    char ch = 'A';

    sockfd = socket(AF_INET,SOCK_STREAM,0);

    addr.sin_family = AF_INET;
    addr.sin_addr.s_addr = htonl(INADDR_ANY);
    log("INADDR_ANY:",INADDR_ANY);
    addr.sin_port = htons(9999);
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