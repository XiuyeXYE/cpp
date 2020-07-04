#include"../xylib/xiuye"
#include<sys/types.h>
#include<sys/socket.h>
#include <netinet/in.h>
#include <unistd.h>
#include <arpa/inet.h>
// #include<errno.h>

using namespace xiuye;

int main(){

    int sock = socket(AF_INET,4000,5000);
    write(-1,"hoge",4);

    if(sock<0){
        log("socket failed");
        return -1;
    }

    return 0;
}