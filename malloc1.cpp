#include"xylib/xiuye"
#include<sys/types.h>
#include<unistd.h>
#include<cstdio>

using namespace xiuye;

#define align4(x) (((((x)-1)>>2)<<2)+4)
#define align8(x) (((((x)-1)>>3)<<3)+8)

typedef unsigned char byte;

typedef struct s_block *t_block;

struct s_block{

    size_t size;
    t_block next;
    int free;
    // byte data[1];
};

#define BLOCK_SIZE sizeof(struct s_block)

/* Of course , update the BLOCK_SIZE macro */
// # define BLOCK_SIZE 12 /* 3*4 ... */

void *base = NULL;

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
    new_block->free = 1;
    b->size = s;
    b->next = new_block;
}

void *malloc(size_t size){


    t_block b,last;
    size_t s;
    s = align8(size);
    if(base){
        last = (t_block)base;
        b = find_block(&last,s);
        if(b){
            if((b->size-s) >= (BLOCK_SIZE+8)){
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
    size_t s8,i;
    new_ptr = malloc(number*size);
    if(new_ptr){
        s8 = align8(number*size)<<3;
        for(i=0;i<s8;i++){
            new_ptr[i] = 0;
        }
    }
    return new_ptr;

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
    
    int *p = (int*)malloc(sizeof(int));

    println(p,*p);
    *p = 100;
    println(p,*p);



    return 0;
}
