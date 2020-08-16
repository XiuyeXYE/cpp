#include"../common"

/*https://github.com/XiuyeXYE/cpp*/

/*g++ filename.cpp -lpthread*/

int main(){

    FILE *read_fp;

    char buf[BUFSIZ+1];

    int chars_read;

    memset(buf,'\0',sizeof(buf));

    read_fp = popen("uname -a","r");
    if(read_fp!=NULL){
        chars_read = fread(buf,sizeof(char),BUFSIZ,read_fp);
        if(chars_read>0){
            log("Output was:-\n",buf,BUFSIZ,chars_read);

        }
        pclose(read_fp);
        exit(EXIT_SUCCESS);
    }
    exit(EXIT_FAILURE);
    return 0;
}