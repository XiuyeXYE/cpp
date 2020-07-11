
#include"iocommon"

int main(){

    struct timeval tv;
    tv.tv_sec = 0;
    tv.tv_usec = 1000000;//1s = 1000ms; 1ms = 1000us;
    /* sleep for 500 microseconds */
    select (0, NULL, NULL, NULL, &tv);

    return 0;
}
