#include"xylib/xiuye"
#include<sys/types.h>
#include<unistd.h>
#include<cstdio>

using namespace xiuye;

#define align4(x) (((((x)-1)>>2)<<2)+4)
#define align8(x) (((((x)-1)>>3)<<3)+8)

#define ptr_size sizeof(size_t)
#define align(x) (((((x)-1)/ptr_size)*ptr_size)+ptr_size)

typedef unsigned char byte;

typedef struct s_block *t_block;

struct s_block{

    size_t size;
    t_block prev;
    t_block next;
    int free;

    void *ptr;

    // byte data[1];


};

#define BLOCK_SIZE sizeof(struct s_block)

/* Of course , update the BLOCK_SIZE macro */
// # define BLOCK_SIZE 12 /* 3*4 ... */

void *base = NULL;

t_block get_block(void*p){
    // byte *tmp = (byte)p;
    // return (p = tmp -= BLOCK_SIZE);

    return (t_block)p - 1;

}

int valid_addr(void *p){
    if(base){
        if(p>base && p<sbrk(0)/*last break ptr*/){
            return p == get_block(p)->ptr;
        }
    }
    return 0;
}

t_block find_block(t_block *last,size_t size){
    t_block b = (t_block)base;
    while(b&&!(b->free&&b->size>=size)){
        *last = b;
        b = b->next;
    }
    return b;
}

t_block extend_heap(t_block last,size_t s){

    t_block b = (t_block)sbrk(0);

    if(sbrk(BLOCK_SIZE+s) == (void*)-1){
        return NULL;
    }

    b->size = s;
    b->next = NULL;
    b->prev = last;
    b->ptr = b+1;//block + data,so +1
    

    if(last){
        last->next = b;
    }

    b->free = 0;

    return b;


}

void split_block(t_block b,size_t s){
    // n = (t_block)(b->data+s);
    t_block new_block = (t_block)(b+1+s);
    new_block->size = b->size-s-BLOCK_SIZE;
    new_block->next = b->next;
    new_block->prev = b;
    new_block->free = 1;
    new_block->ptr = new_block+1;
    b->size = s;
    b->next = new_block;
    if(new_block->next){
        new_block->next->prev = new_block;
    }

}

void *malloc(size_t size){


    t_block b,last;
    size_t s;
    s = align(size);
    if(base){
        last = (t_block)base;
        b = find_block(&last,s);
        if(b){
            if((b->size-s) >= (BLOCK_SIZE+ptr_size)){
                split_block(b,s);
            }
            b->free = 0;
        }
        else{
            b = extend_heap(last,s);
            if(!b){
                return NULL;
            }
        }
    }else{
        b = extend_heap(NULL,s);
        if(!b){
            return NULL;
        }
        base = b;
    }
    return b+1;

    // void *p;
    // p = sbrk(0);

    // if(sbrk(size) == (void*)-1){
    //     return NULL;
    // }

    // return p;


}

void *calloc(size_t number,size_t size){

    size_t *new_ptr;
    size_t s,i;
    new_ptr = (size_t*)malloc(number*size);
    if(new_ptr){
        s = align(number*size)/ptr_size;
        for(i=0;i<s;i++){
            new_ptr[i] = 0;
        }
    }
    return new_ptr;

}


t_block fushion(t_block b){
    if(b->next && b->next->free){
        b->size += BLOCK_SIZE+b->next->size;
        b->next = b->next->next;
        if(b->next){
            b->next->prev = b;
        }
    }
    return b;
}

void free(void *p){
    t_block b;
    if(valid_addr(p)){
        b = get_block(p);
        b->free = 1;
        if(b->prev && b->prev->free){
            b = fushion(b->prev);
        }
        if(b->next){
            fushion(b);
        }
        else{
            if(b->prev){
                b->prev->next = NULL;
            }
            else{
                base = NULL;
            }
            brk(b);


        }
    }
}

void copy_block(t_block src,t_block dst){
    size_t *sdata,*ddata;
    size_t i;
    sdata = (size_t*)src->ptr;
    ddata = (size_t*)dst->ptr;
    for(i=0;i*ptr_size<src->size && i*ptr_size<dst->size;i++){
        ddata[i] = sdata[i];
    }



}

void out_ptr_block(void *p){
    t_block q = get_block(p);

    println("block:",q,"size:",q->size,"prev:",q->prev,"next:",q->next,"free",q->free,"ptr:",q->ptr);
    
}



int main(){
    //估计和 标准库 malloc filename 冲突了等原因!
    //不能用
    // line(111111);

    printf("%d\n",BLOCK_SIZE);
    printf("int:%d\n",sizeof(int));
    printf("t_block:%d\n",sizeof(t_block));
    printf("s_block:%d\n",sizeof(struct s_block));
    char s[1];
    printf("char s[1] s:%d\n",sizeof(s));
    printf("long:%d\n",sizeof(long));

    println(align4(1),align4(2),align4(3),align4(4),align4(5));
    println(sizeof(size_t));
    s_block b;
    println(sizeof(b.size),sizeof(b.next),sizeof(b.free));
    
    
    println(align(1),align(2),align(3),align(4),align(5)/8);

    int *p1;
    println(p1,p1+1,p1+2);

    

    char s1[1];
    char s2[10];
    println(sizeof(s1),sizeof(s2));

    int *p = (int*)malloc(sizeof(int));
    out_ptr_block(p);
    println(p,*p);
    *p = 100;
    println(p,*p);
    free(p);
    out_ptr_block(p);

    int *pa = (int*)calloc(10,sizeof(int));
    out_ptr_block(pa);
    // for(int i=0;i<10;i++){
    //     println(i,pa[i],sizeof(pa[i]),sizeof(pa));
    // }

    println(pa);

    free(pa);
    out_ptr_block(pa);




    return 0;
}
