// #include"xylib/xiuye"
// using namespace xiuye;

#include"../common"


unsigned int RSHash(const char *str,unsigned int len){
    unsigned int b = 378551;
    unsigned int a = 63689;
    unsigned int hash = 0;
    unsigned int i = 0;
    for(i=0;i<len;str++,i++){
        hash = hash*a + (*str);
        a = a*b;
    }
    return hash;

}

unsigned int JSHash(const char* str,unsigned int len){
    unsigned int hash = 1315423911;
    unsigned int i = 0;
    for(i=0;i<len;str++,i++){
        hash ^= ((hash<<5)+(*str)+(hash>>2));

    }
    return hash;
}


unsigned int ELFHash(const char* str, unsigned int len)
{
    unsigned int hash = 0;
    unsigned int x	 = 0;
    unsigned int i	 = 0;

    for(i = 0; i < len; str++, i++)
    {
        hash = (hash << 4) + (*str);
        if((x = hash & 0xF0000000L) != 0)
        {
            hash ^= (x >> 24);
        }
        hash &= ~x;
    }

    return hash;
}

unsigned int DJBHash(const char* str, unsigned int len)
{
    unsigned int hash = 5381;
    unsigned int i	 = 0;

    for(i = 0; i < len; str++, i++)
    {
        hash = ((hash << 5) + hash) + (*str);
    }

    return hash;
}


int main(){

    println("HelloWorld!TEST!!!");

    const char *str = "HelloWorld!123";

    println("string length=",len(str));
    println("string length=",len(""));

    println("RSHash=",RSHash(str,len(str)));
    println("RSHash=",JSHash(str,len(str)));
    println("RSHash=",ELFHash(str,len(str)));
    println("RSHash=",DJBHash(str,len(str)));

    return 0;
}