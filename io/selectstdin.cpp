#include"iocommon"
#define TIMEOUT 5
#define BUF_LEN 1024

/*
    multiplexed IO: select
*/
int main(){

    //test len(str)

    // const char *s = "Hello";
    // log(s,slen(s));
    // // char *s1 = const_cast<char*>(s);
    // char *s1 = new char[slen(s)+1];
    // for(int i=0;i<slen(s)+1;i++){
    //     s1[i] = s[i];
    // }
    
    // log(s1,slen(s1));
    // // delete []s1;

    // char b[10]{'!','!','Q','\0'};
    // log(b,slen(b));
    

    struct timeval tv;
    fd_set readfds;
    int ret;

    FD_ZERO(&readfds);
    FD_SET(STDIN_FILENO,&readfds);

    tv.tv_sec = TIMEOUT;
    tv.tv_usec = 0;

    ret = select(STDIN_FILENO+1,&readfds,NULL,NULL,&tv);

    if(ret ==-1){
        perror("select error");
        return -1;
    }else if(!ret){
        println(TIMEOUT,"seconds elapsed.");
        return -2;
    }

    if(FD_ISSET(STDIN_FILENO,&readfds)){
        char buf[BUF_LEN+1];
        int length;
        length = read(STDIN_FILENO,buf,BUF_LEN);
        if(length == -1){
            println("read failed");
            return -3;
        }
        if(length){
            buf[length]='\0';
            log("read:",buf,slen(buf),length,(int)buf[length],len(buf));

        }
        return 0;
    }
    fprintf(stderr,"This should not happen!\n");
    return 1;



}