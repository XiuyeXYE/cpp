#include"../common"

#define ZERO(T) static_cast<T>(0);

template<class K,class V>
struct node{
        K key;
        V val;
        node<K,V> *next;

        node(K key,V value,node<K,V>*next):key(key),val(val),next(next){}

            
};

template<class K,class V>
class sequential_search_ST{
        node<K,V> *first;
    public:
        V get(K key){
            for(node<K,V> *x=first;x != nullptr;x=x->next){
                if(key == x->key){
                    return x->val;
                }

            }
            return ZERO(V);
        }

        void put(K key,V val){
            for(node<K,V> *x = first;x != nullptr;x=x->next){
                if(key == x->key){
                    x->val = val;
                    return;
                }

            }
            //头部插入
            first = new node<K,V>(key,val,first);
        }


};


//哈希链表解决冲突!
template<class K,class V>
class separate_chaining_hash_ST{

    int n;
    int m;
    sequential_search_ST<K,V> **st;

    int hash(K key){
        //key native hash from memory address
        return (ssize_t(&key) & 0x7fffffff) % m;
    }

    

    public:
        // separate_chaining_hash_ST():separate_chaining_hash_ST(1997){
            
        // }
        separate_chaining_hash_ST(int m=1997){
            this->m = m;
            st = new sequential_search_ST<K,V>*[m];
            for(int i=0;i<m;i++){
                st[i] = new sequential_search_ST<K,V>();
             }
        }

        V get(K key){
            return st[hash(key)]->get();
        }

        void put(K key,V value){
            st[hash(key)]->put(key,value);
        }

        //iterator 迭代器 实现?

        virtual ~separate_chaining_hash_ST(){
            
            for(int i=0;i<m;i++){
                
                log("delete element():");
                delete st[i];
            }
            log("delete elements array[]:");
            delete []st;

        }

};


int main(){


    int **a = new int*[8];//指针数组 / No:数组指针
    
    for(int i=0;i<10;i++){
        int j=rand()%10;
        log(j);
        a[i] = new int[j];
        a[i] = new int(123);
    }

    separate_chaining_hash_ST<int,int> st;

    for(int i=0;i<100;i++){
        int j = rand()%10000;
        st.put(j,i);
    }




    return 0;
}