#include"../common"


//CAS for thread lock!
ssize_t cmp_and_swap_q(volatile ssize_t old/*for rax*/,volatile ssize_t *n_ptr/*for memory*/,volatile ssize_t expect/*dest[new value]*/){
    
    //in the end: *n_ptr <= expect 

    //check value in memory correct?
    ssize_t rax=0;
    ssize_t rbx=0;

    asm volatile(
        "movq %%rax,%0;"//for chekc
        "movq %%rbx,%1;"//for chekc
        "lock cmpxchgq %%rbx,(%4)"//lock for atomic : read,modify,write
        :"=m"(rax),"=m"(rbx)//for chekc
        :"a"(old),"b"(expect),"r"(n_ptr)
        :"memory"

    );
    // log("rax=",rax,"rbx=",rbx,"*n_ptr",*n_ptr);//for chekc
    return *n_ptr;
}

struct x_mutex{

    // x_mutex():counter(1){

    // }

    x_mutex(int i=1/*default value*/):counter(i),total(i){}


    ssize_t lock(){ // wait | p()
        // ssize_t old = counter;
        // ssize_t expect = ;

        // while(counter == 0){
        //     cmp_and_swap_q(counter,&counter,counter-1);
        // }

        //没有资源就等待吧! wait() | p()
        //atomic

        assert(counter<=total && counter >=0);

        volatile ssize_t old = 0;
        do{
            old = counter;
            log("spin...lock");
        }while(old <=0 || cmp_and_swap_q(counter,&counter,counter-1)==old);
        
        assert(counter > -1);

        log("lock:",counter);
        return counter;
    }

    
    /*
        进入lock通过后,unlock 只需要释放一次就OK了!
    */
    ssize_t unlock(){//signal | V()
        // while(counter == 0){
        //     // cmp_and_swap(&counter,1);
        // }


        assert(counter > -1);

        //释放资源必须比原来的大,就是释放= 资源+1
        //如果一直小于和等于原来的资源 ,就一直自旋到 +1 为止
        volatile ssize_t old = 0;
        do{
            old = counter;
            log("spin...unlock");
        }while(cmp_and_swap_q(counter,&counter,counter+1)<old);

        assert(counter<=total && counter >=0);

        log("unlcok:",counter);

        return counter;
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

    //thread not safe

    x_mutex mtx;

    log("open lock:",mtx.lock());
    log("close clock:",mtx.unlock());
    log("open lock:",mtx.lock());
    log("close clock:",mtx.unlock());
    log("open lock:",mtx.lock());
    log("close clock:",mtx.unlock());

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

