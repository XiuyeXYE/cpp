#include"../common"

#define ZERO(T) static_cast<T>(NULL)

template<class K,class V>
class node{
        K key;
        V value;
        node<K,V> *left,*right;//左右子树
        int n;//子节点数 包括自身
    public:

        node(K key,V value,int n):key(key),value(value),n(n),left(nullptr),right(nullptr){}
        K get_key() const{
            return key;
        }
        V get_value() const{
            return value;
        }
        void set_key(K key){
            this->key = key;
        }
        void set_value(V value){
            this->value = value;
        }
        void set_left(node<K,V> *left){
            this->left = left;
        }
        void set_right(node<K,V> *right){
            this->right = right;
        }
        node<K,V> *get_left(){
            return this->left;
        }
        node<K,V> *get_right(){
            return this->right;
        }

        int get_n(){
            return n;
        }

        void set_n(int n){
            this->n = n;
        }

};

template<class K,class V>
class BST{
        node<K,V> *root;//必须在构造函数中初始化,否则不知道指向哪里的野指针,
        //编译器是不会初始化为 nullptr(0) 的
        //一定要初始化,否则报错!!!
        
        int size(node<K,V> *x){
            if(x == nullptr){
                return 0;
            }
            else{
                return x->get_n();
            }
        }
        V get(node<K,V> *x,K key){
            if(x == nullptr){//递归终止!
                return ZERO(V);
            }
            if(x->get_key()<key){  
                return get(x->get_right(),key);
            }else if(x->get_key()>key){
                return get(x->get_left(),key);
            }else{
                return x->get_value();
            }

        }
        /*
            key 大于 往右子树放,小于 往左子树放,
            等于就替换
        */
        node<K,V>* put(node<K,V> *x,K key,V value){
            if(x == nullptr){
                return new node<K,V>(key,value,1);
            }
            if(x->get_key()>key){
                x->set_left(put(x->get_left(),key,value));
            }
            else if(x->get_key() < key){
                x->set_right(put(x->get_right(),key,value));
            }
            else{
                //相等就替换,是不是有点像 hashmap.put(k,v)
                x->set_value(value);
            }
            //子节点数 包含自身
            x->set_n(size(x->get_left())+size(x->get_right())+1);
            return x;
        }
        //先序遍历
        void travel_preorder(node<K,V> *x){
            if(x == nullptr){
                return;
            }
            print(x->get_key()," ");
            travel_preorder(x->get_left());
            travel_preorder(x->get_right());
        }
        //中序遍历
        void trave_inorder(node<K,V> *x){
             if(x == nullptr){
                return;
            }
            trave_inorder(x->get_left());
            print(x->get_key()," ");
            trave_inorder(x->get_right());
        }
        //后序遍历
        void trave_postorder(node<K,V> *x){
             if(x == nullptr){
                return;
            }
            trave_postorder(x->get_left());
            trave_postorder(x->get_right());
            print(x->get_key()," ");
        }

        //this is correct to release tree nodes
        //后续遍历清理 方法1 ;core invariant
        void release_nodes_from(node<K,V> *x/*current node*/){
            if(x == nullptr){
                return;
            }
            release_nodes_from(x->get_left());
            if(x->get_left() != nullptr){//this is next assigned to null
                x->set_left(nullptr);
            }
            release_nodes_from(x->get_right());
            if(x->get_right() != nullptr){//this is next assigned to null
                x->set_right(nullptr);
            }
            print(x->get_key()," ");
            delete x;//this is previous
        }

        //后续遍历清理 方法2 ; core invariant
        void release_nodes_from2(node<K,V> **x){
            
            if(*x == nullptr){
                return;
            }
            
            //1.-> 优先级 大于 * & 
            //2.单目‘&’的操作数必须是左值 !!!
            //就是说函数 返回值 是 右值 !?

            // release_nodes_from2(&((*x)->get_left()));//error
            
            node<K,V> *left = (*x)->get_left();
            release_nodes_from2(&left);

            // release_nodes_from2(&((*x)->get_right()));//error
            
            node<K,V> *right = (*x)->get_right();
            release_nodes_from2(&right);

            print((*x)->get_key()," ");

            // 有了 node ** 就可以将
            // delete 和 =null 放在一块了!
            delete *x;//this is first step to delete
            *x = nullptr;//this is nextly assigned to null


        }

        void release_all_nodes(){
            print("delete order:");
            // release_nodes_from(root);
            release_nodes_from2(&root);
            println();
        }
        //二叉搜索树最小节点在最左边
        node<K,V>* min(node<K,V> *x){
            if(x->get_left()==nullptr){
                return x;
            }
            return min(x->get_left());
        }
        //二叉搜索树最大节点在最右边
        node<K,V>* max(node<K,V> *x){

            if(x->get_right() == nullptr){
                return x;
            }
            return max(x->get_right());

        }

        K floor(node<K,V>*x,K key){
            if(x == nullptr){
                return ZERO(K);
            }
            if(x->get_key() == key){
                return key;
            }
            if(x->get_key()>key){
                return floor(x->get_left(),key);
            }
            K t = floor(x->get_right(),key);
            if(t != ZERO(K)){
                return t;
            }
            else{
                return x->get_key();
            }

        }

        //返回排名为k的节点的key
        K select(node<K,V> *x,int k){
            if(x == nullptr){
                return ZERO(K);
            }
            int t = size(x.left);
            if(t>k){
                return select(x->get_left(),k);
            }else if(t<k){
                return select(x->get_right(),k-t-1);
            }else{
                return x->get_key();
            }
        }

        int rank(node<K,V> *x,K key){
            if(x == nullptr){
                return 0;
            }
            if(x->get_key()>key){
                return rank(x->get_left(),key);
            }
            else if(x->get_key()<key){
                return 1 + size(x->get_left())+rank(x->get_right(),key);
            }else{
                return size(x->get_left());
            }
        }

        //删除最小节点
        node<K,V> *delete_min(node<K,V>* x){
            //recursive ending condition
            if(x->get_left()==nullptr){
                return x->get_right();
            }
            //recursive core
            x->set_left(delete_min(x->get_left()));
            x->set_n(size(x->get_left())+size(x->get_right())+1);
            return x;

        }

        //删除节点为key的节点
        //删除节点,并把右子树最小节点填到该节点原来的位置!
        //这就是二叉搜索树 删除 节点的方法
        node<K,V> * remove(node<K,V> *x,K key){
            
            if(x==nullptr){
                return nullptr;
            }


            if(x->get_key()>key){
                //重新设置 left
                x->set_left(remove(x->get_left(),key));
            }
            else if(x->get_key()<key){
                // 重新设置right
                x->set_right(remove(x->get_right(),key));
            }
            else{
                if(x->get_right()==nullptr){
                    return x->get_left();
                }
                if(x->get_left()==nullptr){
                    return x->get_right();
                }
                //删除操作
                node<K,V> *t = x;
                x = min(t->get_right());
                x->set_right(delete_min(t->get_right()));
                x->set_left(t->get_left());
            }


            x->set_n(size(x->get_left())+size(x->get_right())+1);
            //为啥返回 x ,就是给上层赋值
            //删除(1)赋值(2),分了两步走,递归顺序(2)(1)
            return x;

        }


    public:
        BST():root(nullptr){}
        int size(){
            return size(root);
        }
        V get(K key){
            return get(root,key);
        }
        //存放新的节点
        void put(K key,V value){
            root = put(root,key,value);
        }
        //先序遍历
        void travel_preorder(){
            travel_preorder(root);
            println();
        }
        //中序遍历
        void trave_inorder(){
            trave_inorder(root);
            println();
        }
        
        //后序遍历
        void trave_postorder(){
            trave_postorder(root);
            println();
        }

        //手动清空
        void clear(){
            release_all_nodes();
        }

        //最小值key
        K min(){
            return min(root)->get_key();
        }

        //最大值key
        K max(){
            return max(root)->get_key();
        }

        K floor(K key){
            return floor(root,key);
        }

        K select(int k){
            return select(root,k);
        }

        int rank(K key){
            return rank(root,key);
        }

        void delete_min(){
            root = delete_min(root);
        }

        void remove(K key){
            root = remove(root,key);
        }

        


    public:
        //清理node
        virtual ~BST(){
            
            //使用后序遍历 清理节点!!!
            //清理的时候要注意顺序
            release_all_nodes();
           

        }

};

int main(){


    log(0==nullptr);
    int i = 0;
    // log(nullptr==i);
    log("0",sizeof(0),typeid(0).name());
    log("NULL",sizeof(NULL),typeid(NULL).name());
    log("nullptr",sizeof(nullptr),typeid(nullptr).name());

    size_t j = (size_t)nullptr;//ok coverted to!
    log(j);

    BST<int,int> binarytree; 
    binarytree.put(1,1);
    binarytree.put(2,2);
    binarytree.put(3,3);
    binarytree.put(4,4);
    binarytree.put(5,5);

    //test :通过遍历测试 put数据是不是正确的
    binarytree.travel_preorder();
    binarytree.trave_inorder();
    binarytree.trave_postorder();

    log(binarytree.get(3));

    log("max",binarytree.max());
    log("min",binarytree.min());

    log("floor",binarytree.floor(1.5));
    log("floor",binarytree.floor(2.5));

    log("select",binarytree.floor(3));
    log("select",binarytree.floor(2.5));

    log("rank",binarytree.rank(3));
    log("rank",binarytree.rank(2.5));
    log("rank",binarytree.rank(1));

    //delete key 2
    binarytree.remove(2);

   


    binarytree.clear();


    //test many data
    srand(time(0));
    for(int i=0;i<100;i++){
        int r = rand()%10000;
        log("rand:",r);
        binarytree.put(r,i);
    }
    log("preorder:");
    binarytree.travel_preorder();
    log("inorder:");
    binarytree.trave_inorder();
    log("postorder:");
    binarytree.trave_postorder();

    // if((bool)nullptr){
    //     log("nullptr");
    // }
    // else{
    //     log("no nullptr");
    // }


    return 0;
}