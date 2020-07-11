#include"iocommon"

int main(){

    long page_size = sysconf (_SC_PAGESIZE);
    log(_SC_PAGESIZE,page_size);

    long page_size2 = sysconf (_SC_PAGE_SIZE);
    log(_SC_PAGE_SIZE,page_size2);


    return 0;
}