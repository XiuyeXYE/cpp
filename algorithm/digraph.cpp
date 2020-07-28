#include"../common"

using namespace std;

class digraph{

    int v;//顶点数
    int e;//边数
    vector<int> *adj;//邻接表存储图的数据

    public:
        digraph(int v){
            this->v = v;
            this->e = 0;
            adj = new vector<int>[v];
            for(int i=0;i<v;i++){
                adj[i] = vector<int>();
            }
        }

        int get_v(){
            return v;
        }
        int get_e(){
            return e;
        }

        void add_edge(int v,int w){
            adj[v].push_back(w);
            e++;
        }

        vector<int> operator[](int idx){
            return adj[idx];
        }

        digraph reverse(){
            digraph r(v);
            for(int i=0;i<v;i++){
                for(auto &w:(*this)[v]){
                    r.add_edge(w,v);
                }
                
            }
            return r;
        }

        virtual ~digraph(){
            log("free digraph memory");
            delete []adj;
            adj = nullptr;
        }


};

//有向图可达性
class directed_dfs{

    bool *marked;

    void dfs(digraph& g,int v){
        marked[v] = true;
        for(int &w:g[v]){
            if(!marked[w])dfs(g,w);
        }

    }

    public:
        directed_dfs(digraph &g,int s){//一定要用引用,否则内部的指针内存会释放两次,程序崩溃
            marked = new bool[g.get_v()]{};
            dfs(g,s);
        }

        directed_dfs(digraph &g,vector<int> &src){
            marked = new bool[g.get_v()]{};
            for(int &s:src){
                if(!marked[s]){
                    dfs(g,s);
                }
            }
        }

        bool mark(int v){
            return marked[v];
        }

        virtual ~directed_dfs(){
            delete []marked;
            marked = nullptr;
        }

};

class directed_cycle{

    bool *marked;
    int *edge_to;
    stack<int> *cycle;//有向环中的所有顶点
    bool *on_stack;//递归调用的栈上的所有顶点;

    void dfs(digraph &g,int v){
        on_stack[v] = true;
        marked[v] = true;
        for(int &w:g[v]){
            if(has_cycle()){
                return;
            }
            else if(!marked[w]){
                edge_to[w] = v;
                dfs(g,w);
            }
            else if(on_stack[w]){
                cycle = new stack<int>();
                for(int x=v;x!=w;x=edge_to[x]){
                    cycle->push(x);
                }
                cycle->push(w);
                cycle->push(v);
            }
        }
        on_stack[v] = false;
    }

    public:

        directed_cycle(digraph &g){
            on_stack = new bool[g.get_v()]{};
            edge_to = new int[g.get_v()]{};
            marked = new bool[g.get_v()]{};
            cycle = nullptr;
            for(int i=0;i<g.get_v();i++){
                if(!marked[i]){
                    dfs(g,i);
                }
            }


        }

        bool has_cycle(){
            return cycle!=nullptr;
        }


        stack<int> cycle_path(){
            return *cycle;
        }

        virtual ~directed_cycle(){
            delete []on_stack;
            on_stack = nullptr;
            delete []edge_to;
            edge_to = nullptr;
            delete []marked;
            marked = nullptr;
            if(cycle != nullptr){
                delete cycle;
                cycle = nullptr;
            }
        }

};

//有向图深度优先 的 顶点排序
class depth_first_order{
    bool * marked;
    queue<int> pre;
    queue<int> post;
    stack<int> reverse_post;

    void dfs(digraph&g,int v){
        pre.push(v);
        marked[v] = true;
        for(auto &w:g[v]){
            // piling();//打桩 仅仅用于输出,发现问题
            if(!marked[w]){
                dfs(g,w);
            }

        }
        post.push(v);
        reverse_post.push(v);
    }

    public:

        depth_first_order(digraph &g){
            marked = new bool[g.get_v()]{};
            for(int v=0;v<g.get_v();v++){
                // piling();//打桩 仅仅用于输出,发现问题
                if(!marked[v]){
                    dfs(g,v);
                }
            }
        }

        queue<int> order_pre(){
            return pre;
        }

        queue<int> order_post(){
            return post;
        }

        stack<int> order_reverse_post(){
            return reverse_post;
        }

        virtual ~depth_first_order(){
            delete []marked;
            marked = nullptr;
        }
};

//有向图 拓扑排序
//无环图才能拓扑排序
class topological{

    stack<int> order;

    public:

        topological(digraph&g){
            directed_cycle cycle_finder(g);
            if(!cycle_finder.has_cycle()){
                depth_first_order dfo(g);
                order = dfo.order_reverse_post();
            }
        }

        stack<int> ord(){
            return order;
        }

        bool is_dag(){
            return !order.empty();
        }



};


int main(){

    digraph g(13);//定向图 顶点数
    //添加边
    g.add_edge(4,2);
    g.add_edge(2,3);
    g.add_edge(3,2);
    g.add_edge(6,0);
    g.add_edge(0,1);
    g.add_edge(2,0);
    g.add_edge(11,12);
    g.add_edge(12,9);
    g.add_edge(9,10);
    g.add_edge(9,11);
    g.add_edge(8,9);
    g.add_edge(10,12);
    g.add_edge(11,4);
    g.add_edge(4,3);
    g.add_edge(3,5);
    g.add_edge(7,8);
    g.add_edge(8,7);
    g.add_edge(5,4);
    g.add_edge(0,5);
    g.add_edge(6,4);
    g.add_edge(6,9);
    g.add_edge(7,6);


    vector<int> src;
    //源点
    src.push_back(1);
    src.push_back(2);
    src.push_back(6);

    directed_dfs reachable(g,src);

    println("可达性测试输出:");
    for(int i=0;i<g.get_v();i++){
        if(reachable.mark(i)){
            print(i,' ');
        }
    }
    println();

    

    directed_cycle cycle(g);
    println("有环?:",cycle.has_cycle());
    if(cycle.has_cycle()){
        auto stack = cycle.cycle_path();

        int size = stack.size();

        for(int i=0;i<size;i++){
            print(stack.top(),' ');
            stack.pop();
        }
        println();
    }


    println("有向图顶点排序:");

    depth_first_order dfo(g);

    queue<int> pre = dfo.order_pre();    
    for(int i=0;i<pre.size();i++){
        print(pre.front(),' ');
        pre.pop();
    }
    println();
    queue<int> post = dfo.order_post();
    for(int i=0;i<post.size();i++){
        print(post.front(),' ');
        post.pop();
    }
    println();
    stack<int> reverse_post = dfo.order_reverse_post();
    for(int i=0;i<reverse_post.size();i++){
        print(reverse_post.top(),' ');
        reverse_post.pop();
    }
    println();
    

    topological top(g);
    println("can 拓扑排序(有向无环图):",top.is_dag());





    return 0;
}