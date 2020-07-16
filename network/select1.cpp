#include"../common"

/*https://github.com/XiuyeXYE/cpp*/

int main(){

    char buffer[128];

    int result,nread;

    fd_set inputs,testfds;
    struct timeval timeout;

    FD_ZERO(&inputs);
    // FD_SET(0,&inputs);//stdin
    FD_SET(fileno(stdin),&inputs);
    log("FD_SETSIZE:",FD_SETSIZE);
    while(true){
        testfds = inputs;
        timeout.tv_sec = 2;
        timeout.tv_usec = 500000;

        // result = select(FD_SETSIZE,&testfds,        
        // (fd_set*)nullptr,(fd_set*)nullptr,
        // &timeout
        // );
        result = select(FD_SETSIZE,&testfds, nullptr,nullptr, &timeout);


        switch(result){
            case 0:
                log("timeout");
                break;
            case -1:
                log("select failed");
                break;
            default:
                if(FD_ISSET(fileno(stdin),&testfds)){
                    //得到缓冲区里有多少字节要被读取，然后将字节数放入nread里面
                    ioctl(fileno(stdin),FIONREAD,&nread);
                    if(nread==0){
                        log("keyboard done");
                        exit(0);
                    }
                    nread = read(0,buffer,nread);
                    buffer[nread] = 0;
                    log("read",nread,"from keyboard:",buffer);
                }
        }

    }



    return 0;
}