
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

    size_t rax=0;
    size_t rbx = 0;

    log("size_t=",sizeof(size_t));

    asm volatile(
        "xorq %%rax,%%rax;"
        "btsq $7,%%rax;"
        "pushfq;"
        "movq (%%rsp),%%rbx;"
        "popfq;"//indeed need !!! Or segment fault!
        :"=a"(rax),"=b"(rbx));
    log("rax=",rax,std::bitset<sizeof(rax)>(rax),"rbx=",rbx,std::bitset<sizeof(rbx)>(rbx));

    


    return 0;
}

