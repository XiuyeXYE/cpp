#include"../common"

#define ZERO(T) static_cast<T>(0)

template<class K,class V>
class linear_probling_hash_ST{

    int n;//how many elements saved
    int m;
    K *keys;//数组 保存key 和 value 保持一致位置
    V *vals;//数组保存value  和 value 保持一致位置

    int hash(K key){
        return (size_t(&key)&0x7fffffff)%m;
    }

    void resize(int cap){
        linear_probling_hash_ST<K,V> *t;
        t = new linear_probling_hash_ST<K,V>(cap);
        for(int i=0;i<m;i++){
            if(keys[i] != ZERO(K)){
                t->put(keys[i],vals[i]);
            }
        }
        // keys = t->keys;//error delete double
        // vals = t->vals;//error delete double
        
        //good solution:swap
        auto tmp = t->keys;
        t->keys = keys;
        keys = tmp;
        auto tmp2 = t->vals;
        t->vals = vals;
        vals = tmp2;


        m = t->m;

        //don't forget delete
        delete t;
        t = nullptr;
    }



    public:
        linear_probling_hash_ST(int m=16):m(m){
            keys = new K[m];
            vals = new V[m];
        }

        void put(K key,V val){
            if(n >= m/2){
                resize(2*m);//double !!!
            }

            int i;

            //解决哈希冲突,线性探针法
            for(i=hash(key);keys[i]!=ZERO(K)/*exclusive 0*/;i=(i+1)%m){
                if(keys[i]==key){
                    vals[i] = val;
                    return;
                }
            }
            keys[i] = key;
            vals[i] = val;
            n++;


        }

        V get(K key){

            for(int i=hash(key);keys[i]!=ZERO(K);i=(i+1)%m){
                if(keys[i] == key){
                    return vals[i];
                }

            }

            return ZERO(V);

        }

        //线性探测表删除
        //用数组保存的值!
        void remove(K key){
            if(!contains(key)){
                return;
            }
            int i = hash(key);
            while(key!=keys[i]){
                i = (i+1)%m;
            }
            keys[i] = ZERO(K);
            vals[i] = ZERO(V);

            i = (i+1)%m;

            //重新计算元素的hash和位置
            while(keys[i] != ZERO(K)){
                K keyToRedo = keys[i];
                V valToRedo = vals[i];
                keys[i] = ZERO(K);
                vals[i] = ZERO(V);
                n--;
                
                put(keyToRedo,valToRedo);
                i = (i+1)%m;
            }
            n--;
            if(n>0&&n==m/8){
                resize(m/2);
            }
        }


        virtual ~linear_probling_hash_ST(){
            delete []keys;
            delete []vals;
        }


};

int main(){

    linear_probling_hash_ST<int,int> t;

    t.put(3,3);
    t.put(67,67);
    t.put(88,99);

    log(t.get(88),t.get(67));
    log(t.get(88));
    log(t.get(3));
    log(t.get(99));

    log(t.get(67),t.get(88));

    log(t.get(88),t.get(67));


    // int **b = new int[3][5];//错误：cannot convert ‘int (*)[5]’ to ‘int**’ 


    return 0;
}