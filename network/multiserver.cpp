#include"../common"

/*https://github.com/XiuyeXYE/cpp*/

int main(){


    int server_sockfd,client_sockfd;
    socklen_t server_len,client_len;
    struct sockaddr_in server_addr;
    struct sockaddr_in clinet_addr;

    server_sockfd = socket(AF_INET,SOCK_STREAM,0);

    server_addr.sin_family = AF_INET;
    server_addr.sin_addr.s_addr = htonl(INADDR_ANY);
    log("INADDR_ANY:",INADDR_ANY);
    server_addr.sin_port = htons(9999);
    server_len = sizeof(server_addr);
    
    bind(server_sockfd,(struct sockaddr*)&server_addr,server_len);

    listen(server_sockfd,5);

    signal(SIGCHLD,SIG_IGN);

    while(true){
        char ch;
        log("server waiting");
        client_len = sizeof(clinet_addr);
        client_sockfd = accept(server_sockfd,(struct sockaddr*)&clinet_addr,&client_len);

        if(fork()==0){
            read(client_sockfd,&ch,1);
            log("server received:",ch);
            sleep(5);
            ch++;
            write(client_sockfd,&ch,1);
            close(client_sockfd);
            exit(EXIT_SUCCESS);
        }else{
            close(client_sockfd);//father close the socket connection duplicate
        }


    }




    return 0;
}