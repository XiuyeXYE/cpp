#include"iocommon"

int main(){ 

    int status;
    pid_t pid;
    if(!fork()){
        abort();
        return -1;
    }

    pid = wait(&status);
    if(pid == -1){
        log("wait");
    }
    log("pid=",pid);

    if(WIFEXITED(status)){
        log("Normal termination with exit status=",WEXITSTATUS (status));
    }

    if(WIFSIGNALED (status)){
        log("Killed by signal=",WTERMSIG (status),WCOREDUMP (status) ? " (dumped core)" : "");
    }

    if(WIFSTOPPED (status)){
        log("Stopped by signal=",WSTOPSIG (status));
    }

    if(WIFCONTINUED (status)){
        log("Continued");
    }
    
    return 0;
}

