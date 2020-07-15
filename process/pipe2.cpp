#include"../common"

/*https://github.com/XiuyeXYE/cpp*/

/*g++ filename.cpp -lpthread*/

int main(){

    FILE *write_fp;
    char buffer[BUFSIZ+1];

    sprintf(buffer,"Once upon a time,there was...\n");
    write_fp = popen("od -c","w");
    if(write_fp!=NULL){
        fwrite(buffer,sizeof(char),slen(buffer),write_fp);
        pclose(write_fp);
        exit(EXIT_SUCCESS);
    }
    exit(EXIT_FAILURE);
    
    

    return 0;
}