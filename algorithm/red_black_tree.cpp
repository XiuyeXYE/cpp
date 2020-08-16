#include"../common"

#define RED true
#define BLACK false


template<class K,class V>
struct node{

    K key;
    V value;
    node<K,V> *left,*right;
    int n;
    bool color;

    node(K k,V v,int n,bool c):key(k),value(v),n(n),color(c){}

};


template<class K,class V>
class RB_BST{

        node<K,V> root;

        bool is_red(node<K,V> *x){
            if(x == nullptr)return false;
            return x->color == RED;
        }

        int size(node<K,V>*x){
            if(x==nullptr){
                return 0;
            }
            return x->n;
        }


        //左旋转
        node<K,V> *rotate_left(node<K,V>*h){
            node<K,V> *x = h->right;
            h->right = x->left;
            x->left = h;
            x->color = h->color;
            h->color = RED;
            x->n = h->n;
            h->n = size(h->left)+size(h->right)+1;
            return x;
        }


        //右旋转
        node<K,V> *ratate_right(node<K,V>*h){
            
            node<K,V> *x = h->left;
            h->left = x->right;
            x->right = h;
            x->color = h->color;
            x->color = RED;
            x->n = h->n;//旋转的时候总个数并未改变
            h->n = 1+size(h->left)+size(h->right);


        }


        void flip_color(node<K,V> *x){
            x->color = RED;
            x->left->color = BLACK;
            x->right->color = BLACK;
        }

        void put(K key,V val){
            root = put(root,key,val);
            root->color = BLACK;
        }

    public:

        node<K,V> put(node<K,V> *h,K key,V val){
            if(h == nullptr){
                return new node<K,V>(key,val,1,RED);
            }
            if(h->key > key){
                h->left = put(h->left,key,val);
            }
            else if(h->key<key){
                h->right = put(h->right,key,val);
            }
            else{
                h->val = val;
            }

            //左子树 红 , 右子树 黑
            if(is_red(h->right)&&!is_red(h->left)){
                h = rotate_left(h);
            }
            //左子树 红 , 左子树 子树 红
            if(is_red(h->left)&&is_red(h->left->left)){
                h = rotate_right(h);
            }
            //左子树 红 , 右子树 红
            if(is_red(h->left)&&is_red(h->right)){
                flip_color(h);
            }

            h->n = size(h->left)+size(h->right)+1;

            return h;

        }

};


int main(){



    return 0;
}