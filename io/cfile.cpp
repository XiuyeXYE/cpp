#include"iocommon"


int main(){

    FILE *in,*out;
    struct pirate{
        char name[100];
        unsigned long booty;
        unsigned int beard_len;
    }p,blackbeard={"Edward Teach",950,48};
    out = fopen("data","w");
    if(!out){
        log("fopen error");
        return 1;
    }
    if(!fwrite(&blackbeard,sizeof(struct pirate),1,out)){
        log("fwrite error");
        return -2;
    }
    if(fclose(out)){
        log("fclose error");
        return -3;
    }

    in = fopen("data","r");
    if(!in){
        log("fopen failed");
        return -1;
    }
    if(!fread(&p,sizeof(struct pirate),1,in)){
        log("fread failed");
        return -2;
    }
    if(fclose(in)){
        log("fclose failed");
        return -7;
    }
    log(p.name,p.booty,p.beard_len);


    log(BUFSIZ,BUFSIZ/1024);

    return 0;
}