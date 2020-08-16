#include"../common"


/*https://github.com/XiuyeXYE/cpp*/
/*g++ filename.cpp -lpthread*/

void *thread_func(void *arg);

char message[] = "Hello World";



int main(){

    int res;
    pthread_t a_thread;
    void *thread_res;

    res = pthread_create(&a_thread,NULL,thread_func,(void*)message);

    if(res!=0){
        log("Thread creating failed");
        exit(EXIT_FAILURE);
    }

    log("Waiting for thread to finish...");
    res = pthread_join(a_thread,&thread_res);

    if(res != 0){
        log("thread join failed");
        exit(EXIT_FAILURE);
    }

    log("Thread joined,it returned ",(char*)thread_res);
    log("Message is now",message);
    exit(EXIT_SUCCESS);


    return 0;
}

void *thread_func(void*arg){
    log("thread_function is running,Argument was",(char*)arg);
    sleep(3);
    strcpy(message,"Bye!");
    pthread_exit((void*)"Thank you for the CPU time");
}