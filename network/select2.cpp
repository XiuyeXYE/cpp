#include"../common"

/*https://github.com/XiuyeXYE/cpp*/

int main(){ 

    int server_sockfd,client_sockfd;
    socklen_t server_len,client_len;
    struct sockaddr_in server_addr,client_addr;
    int result;
    fd_set readfds,testfds;

    server_sockfd = socket(AF_INET,SOCK_STREAM,0);
    server_addr.sin_family = AF_INET;
    server_addr.sin_addr.s_addr = htonl(INADDR_ANY);
    server_addr.sin_port= htons(9999);
    server_len = sizeof(server_addr);

    bind(server_sockfd,(struct sockaddr*)&server_addr,server_len);

    listen(server_sockfd,5);

    FD_ZERO(&readfds);
    FD_SET(server_sockfd,&readfds);

    log("FD_SETSIZE:",FD_SETSIZE);

    while(true){


        char ch;

        int fd;
        int nread;

        testfds = readfds;

        log("server waiting");
        
        result = select(FD_SETSIZE,&testfds,nullptr,nullptr,nullptr);

        if(result<0){
            log("server failed");
            exit(-1);
        }

        for(fd=0;fd<FD_SETSIZE;fd++){
            if(FD_ISSET(fd,&testfds)){
                if(fd == server_sockfd){
                    client_len = sizeof(client_addr);
                    client_sockfd = accept(server_sockfd,(struct sockaddr*)&client_sockfd,&client_len);
                    FD_SET(client_sockfd,&readfds);
                    log("adding client on fd",client_sockfd);


                }else{
                    ioctl(fd,FIONREAD,&nread);
                    if(nread == 0){
                        close(fd);
                        FD_CLR(fd,&readfds);
                        log("removing client on fd",fd);
                    }
                    else{
                        read(fd,&ch,1);
                        sleep(5);
                        log("serving client on fd",fd);
                        ch++;
                        write(fd,&ch,1);

                        
                    }
                }
            }
        }

    }

    return 0;
}