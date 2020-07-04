#include"../xylib/xiuye"
#include<sys/types.h>
#include<sys/socket.h>
#include <netinet/in.h>
#include <unistd.h>
#include <arpa/inet.h>

using namespace xiuye;

int main(){

    int sock = socket(3000, 4000, 5000);

    if(sock<0){
        close(fileno(stdout));//output close
        log("socket failed");
        return -1;
    }

    return 0;
}