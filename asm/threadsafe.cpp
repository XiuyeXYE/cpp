#include"../common"


//CAS for thread lock!
//总之就是 原子 改变 内存的值 也就是 n_ptr 指向的值
ssize_t cmp_and_swap_q(volatile ssize_t old/*for rax*/,volatile ssize_t *n_ptr/*for memory*/,volatile ssize_t expect/*for dest[new value]*/){
    
    //in the end: *n_ptr <= expect 

    //check value in memory correct?
    ssize_t rax=0;
    ssize_t rbx=0;

    asm volatile(
        // "movq %%rax,%0;"//for chekc
        // "movq %%rbx,%1;"//for chekc
        "lock cmpxchgq %%rbx,%4;"//lock for atomic : read,modify,write
        "movq %%rax,%0;"
        "movq %%rbx,%1;"
        "rep nop;"
        :"=m"(rax),"=m"(rbx)//for chekc
        :"a"(old),"b"(expect),"m"(*n_ptr)
        :"memory"

    );
    // log("rax=",rax,"rbx=",rbx,"*n_ptr",*n_ptr);//for chekc
    return rax/*old rax ->  new rax*/;
}


bool cmp_and_swap_q(volatile ssize_t *n_ptr/*for memory*/,volatile ssize_t expect/*for dest[new value]*/){
    
    ssize_t old = *n_ptr;

    if(cmp_and_swap_q(old,n_ptr,expect)==old){
        return true;
    }
    
    return false;
}

struct x_mutex{



    x_mutex(int i=1/*default value*/):counter(i),total(i){
        
    }


    ssize_t lock(){ // wait | p()

        //没有资源就等待吧! wait() | p()
        //atomic

        assert(counter<=total && counter >=0);


        //atomic : read -> modify -> write and consistency
        L1:
        while(counter==0){
            asm volatile("rep nop;");
            // std::this_thread::sleep_for(std::chrono::milliseconds(100));
        }

        if(!cmp_and_swap_q(&counter,0)){
            goto L1;
        }



        

        assert(counter > -1);

        // log("lock:",counter);
        return counter;
    }

    
    /*
        进入lock通过后,unlock 只需要释放一次就OK了!
    */
    ssize_t unlock(){//signal | V()


        assert(counter > -1);


      
        cmp_and_swap_q(&counter,1);
        

        assert(counter<=total && counter >=0);

        // log("unlcok:",counter);

        return counter;
    }

    ssize_t getCnt(){
        return counter;
    }

    ssize_t getTotal(){
        return total;
    }

    private:
        volatile ssize_t counter;
        volatile ssize_t total;
        

};


struct Counter{
    ssize_t cnt=0;
    ssize_t st = 0;
};


int main(){

    ssize_t a = 100;
    ssize_t b = 101;

    ssize_t c = a-b;
    log(a-b,"=?=",c,"c<0:",c<0);


    ssize_t num = 100;

    int ret = cmp_and_swap_q(num,&num,num-1);

    log("now num=",num,"ret=",ret);

    log(cmp_and_swap_q(&num,num-1));

    //thread not safe

    x_mutex mtx;

    log("open lock:",mtx.lock(),mtx.getCnt(),mtx.getTotal());
    log("close clock:",mtx.unlock(),mtx.getCnt(),mtx.getTotal());
    log("open lock:",mtx.lock(),mtx.getCnt(),mtx.getTotal());
    log("close clock:",mtx.unlock(),mtx.getCnt(),mtx.getTotal());
    log("open lock:",mtx.lock(),mtx.getCnt(),mtx.getTotal());
    log("close clock:",mtx.unlock(),mtx.getCnt(),mtx.getTotal());

    Counter counter;
    std::mutex std_mtx;
    auto f =[&](){
        mtx.lock();
        // std_mtx.lock();
        counter.cnt++;
        counter.cnt++;
        counter.st ++;
        counter.st ++;
        log(std::this_thread::get_id(),"counter.cnt=",counter.cnt);
        log(std::this_thread::get_id(),"counter.st=",counter.st);
        // std_mtx.unlock();
        mtx.unlock();
    };
    TimeSpec::begin();
    for(int i=0;i<10000;i++){
        auto t = std::thread(f);
        t.detach();
    }

    while(std::cin.get()!='q');
    TimeSpec::print_cost_ticks(); 
    
    log(std::this_thread::get_id(),"in the end counter=",counter.cnt,counter.st);

    

    return 0;
}

