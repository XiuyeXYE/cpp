
#include"../common"



int main(){


    __asm__ __volatile__(
        "cld;"
        "cld"
    );

    int data;
    int port=80;

    asm volatile(
        "add %1,%0;"
        :"=a"(data)
        :"d"(port)
        :"memory"
    );

    log(data,port);

    log("asm success");
    return 0;
}

