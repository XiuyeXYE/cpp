#include"../common"

/*https://github.com/XiuyeXYE/cpp*/

int main(int argc,char *argv[]){

    const char *host;
    int sockfd;

    socklen_t length,result;
    struct sockaddr_in address;
    struct hostent *hostinfo;
    struct servent *servinfo;
    char buffer[128];

    if(argc == 1){
        host = "localhost";
    }
    else{
        host = argv[1];
    }

    hostinfo = gethostbyname(host);

    if(!hostinfo){
        log("no host:",host,strerror(errno));
        return -1;
    }
    
    servinfo = getservbyname("daytime","udp");
    if(!servinfo){
        log("no daytime service");
        return -2;
    }

    log("daytime port is",ntohs(servinfo->s_port));

    sockfd = socket(AF_INET,SOCK_DGRAM,0);

    address.sin_family = AF_INET;
    address.sin_port = servinfo->s_port;
    address.sin_addr = *(struct in_addr*)*hostinfo->h_addr_list;
    length = sizeof(address);

    result = sendto(sockfd,buffer,1,0,(struct sockaddr*)&address,length);
    result = recvfrom(sockfd,buffer,sizeof(buffer),0,(struct sockaddr*)&address,&length);

    buffer[result] = '\0';

    log("read",result,"bytes:",buffer);

    close(sockfd);




    return 0;
}