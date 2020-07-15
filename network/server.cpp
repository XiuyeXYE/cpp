#include"../common"

/*https://github.com/XiuyeXYE/cpp*/

/*g++ filename.cpp -lpthread*/

int main(){

    int server_sockfd,client_sockfd;
    socklen_t server_len,client_len;

    struct sockaddr_un server_addr;
    struct sockaddr_un client_addr;

    unlink("server_socket");
    server_sockfd = socket(AF_UNIX,SOCK_STREAM,0);

    server_addr.sun_family = AF_UNIX;
    strcpy(server_addr.sun_path,"server_socket");
    server_len = sizeof(server_addr);
    bind(server_sockfd,(struct sockaddr*)&server_addr,server_len);

    listen(server_sockfd,5);
    while(true){
        char ch;
        log("server waiting");
        client_len = sizeof(client_addr);
        client_sockfd = accept(server_sockfd,(struct sockaddr*)&client_addr,&client_len);
        read(client_sockfd,&ch,1);
        ch++;
        write(client_sockfd,&ch,1);
        close(client_sockfd);

    }




    return 0;
}