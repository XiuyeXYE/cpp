#include"../common"

/*https://github.com/XiuyeXYE/cpp*/

using namespace std;

vector<string> split(string& text){
    std::regex ws_re("\\s+"); // whitespace
    std::vector<std::string> v(std::sregex_token_iterator(text.begin(), text.end(), ws_re, -1), 
        std::sregex_token_iterator());
    return v;
}   

class graph{

    int v;
    int e;
    std::vector<int> **adj;//邻接表 数组 + 线性存储结构

    public:
        
        graph(int v):v(v),e(0){
            init();
        }

        void init(){
            // this->v = v;
            adj = new std::vector<int>*[v];
            for(int i=0;i<v;i++){
                adj[i] = new std::vector<int>();
            }
        }

        graph(std::istream &in):graph(0){
            // in.getline();
            string str_line;
            getline(in,str_line);
            // log(str_line);
            v = stoi(str_line);
            init();
            getline(in,str_line);
            // log(str_line);
            int e1 = stoi(str_line);
            
                       
            for(int i=0;i<e1;i++){
                getline(in,str_line);
                vector<string> vec = split(str_line);
                int v  = stoi(vec[0]);
                int w = stoi(vec[1]);
                add_edge(v,w);
            }

        }

        int get_v(){
            return v;
        }

        int get_e(){
            return e;
        }

        void add_edge(int i,int j){
            // log(i,j);
            //edge
            adj[i]->push_back(j);
            adj[j]->push_back(i);
            e++;
        }

        std::vector<int>* operator [](int idx){
            return adj[idx];
        }


        string to_stong(){
            //非string 的 类型 必须 to_sting, 否则,不显示!!!
            string s = std::to_string(v)+" vertices, "+std::to_string(e)+" edges\n";
            for(int i=0;i<v;i++){
                s += to_string(i) + ": ";
                for(auto &w:*(*this)[i]){
                    s += to_string(w) + " ";
                }
                s += "\n";
            }
            return s;
        }

        virtual ~graph(){
            //没有复制构造函数必须当心释放两次
            // log("free error");
            for(int i=0;i<v;i++){
                delete adj[i];
                adj[i] = nullptr;
            }
            delete []adj;
            adj = nullptr;
        }

};


int degree(graph& g,int v){
    int degree = 0;
    for(auto &w:*g[v]){
        degree++;
    }
    return degree++;
}

int max_degree(graph &g){
    int max = 0;
    for(int v=0;v<g.get_v();v++){
        if(degree(g,v)>max){
            max = degree(g,v);
        }
        return max;
    }
}

double avg_degree(graph& g){//必须用引用,否则函数结束就会释放一次!
    return 2.0 * g.get_e()/g.get_v();
}

//自环个数
int number_of_self_loops(graph &g){
    int count = 0;
    // log("loops");
    for(int v=0;v<g.get_v();v++){
        // log("v:",v);
        for(auto &w : *g[v]){
            // log(typeid(w).name(),typeid(v).name());
            // log(v,w);
            if(v == w)count++;
        }
    }
    return count/2;
}

 
class depth_first_search{

    bool *marked;
    int counter;

    void dfs(graph &g,int v){
        marked[v] = true;
        counter++;
        for(auto &w:*g[v]){
            // log(w);
            if(!marked[w])dfs(g,w);
        }
    }


    public:


        depth_first_search(graph &g,int s):counter(0){
            marked = new bool[g.get_v()]{};//{} => false list
            // for(auto i=0;i<g.get_v();i++){
            //     log(i,marked[i]);
            // }

            dfs(g,s);
        }

        bool mark(int w){//与s连通吗 记住是连通
            return marked[w];
        }

        int count(){//与s连通的个数 记住是连通
            return counter;//我觉得这个数据 有问题
        }

        virtual ~depth_first_search(){
            delete []marked;
            marked = nullptr;
        }



};

class depth_first_paths{//dfs 的路径是比较长的

    bool *marked ;//
    int *edge_to;// 树型结构 自底向上
    int s;//起点;

    void dfs(graph &g,int v){
        marked[v] = true;
        for(int &w:*g[v]){
            if(!marked[w]){
                edge_to[w] = v;
                dfs(g,w);
            }
        }
    }



    public:
        depth_first_paths(graph &g,int s){
            marked = new bool[g.get_v()]{};//分配内存的要注意初始化,否则报一些莫名其妙的错误!!!
            edge_to = new int[g.get_v()]{};
            this->s = s;
            dfs(g,s);
        }

        bool has_path_to(int v){
            return marked[v];
        }

        vector<int> path_to(int v){//从s -> v 的路径

            // log("");
            if(!has_path_to(v)){
                return vector<int>();
            }
            // log("");


            
            vector<int> path;
            // log("");
            for(int x=v;x!=s;x=edge_to[x]){
                // log(x);
                path.push_back(x);
            }
            // log("");
            path.push_back(s);
            // log("");
            return path;

        }

        virtual ~depth_first_paths(){
            // log("release:");path_to
            delete []marked;
            marked = nullptr;
            delete []edge_to;
            edge_to = nullptr;
        }

};



//广度优先搜索路径
class bread_first_paths{

    bool *marked;
    int * edge_to;//存储s -> v的路径中的顶点
    int s;//起点

    void bfs(graph &g,int s){
        queue<int> q;
        marked[s] = true;
        q.push(s);//尾部添加

        while(!q.empty()){
            int v = q.front();//不删除元素
            q.pop();//删除头部元素
            // log("v:",v);
            for(auto &w:*g[v]){
                if(!marked[w]){
                    edge_to[w] = v;
                    marked[w] = true;
                    q.push(w);
                }
            }

        }

    }

    public:
        bread_first_paths(graph &g/*rust borrow*/,int s){
            marked = new bool[g.get_v()]{};//alloc and initialize
            edge_to = new int[g.get_v()]{};//alloc and initialize
            this -> s = s;
            bfs(g,s);
        }

        bool has_path_to(int v){
            return marked[v];
        }

         vector<int> path_to(int v){//从s -> v 的路径

            if(!has_path_to(v)){
                return vector<int>();
            }
            vector<int> path;
            for(int x=v;x!=s;x=edge_to[x]){
                path.push_back(x);
            }
            path.push_back(s);
            return path;

        }

        virtual ~bread_first_paths(){
            // log("release:");path_to
            delete []marked;
            marked = nullptr;
            delete []edge_to;
            edge_to = nullptr;
        }

};


class cc{//连通分量 // 连通子图

    bool *marked;
    int *id;
    int count;

    void dfs(graph &g,int v){
        marked[v] = true;
        id[v] = count;//连通分量的id
        for(int &w:*g[v]){
            if(!marked[w]){
                dfs(g,w);
            }
        }
    }

    public:
        cc(graph &g):count(0){//别忘初始化成员变量,否则对结果有影响
            marked = new bool[g.get_v()]{};
            id = new int[g.get_v()]{};
            //利用深度优先去寻找连通子图
            for(int s=0;s<g.get_v();s++){
                if(!marked[s]){
                    dfs(g,s);
                    count ++;//用于连通分量的id
                }
            }

        }

        bool connected(int v,int w){
            return id[v] == id[w]; 
        }

        int identity(int v){
            return id[v];
        }

        int total(){
            return count;
        }

        virtual ~cc(){
            delete []marked;
            marked = nullptr;
            delete []id;
            id = nullptr;
        }



};


//graph 是无环图?
//深度优先处理
class cycle{
    bool *marked;
    bool has_cycled;
    void dfs(graph&g,int v,int u){
        marked[v] = true;
        for(int &w:*g[v]){
            // log(w,v,u);
            if(!marked[w]){
                dfs(g,w,v);
            }
            else if(w!=u){//为什么不等就为true呢?
                log(w,u);
                has_cycled = true;
            }
        }
    }
    public:
        cycle(graph &g):has_cycled(false){
            marked = new bool[g.get_v()]{};
            for(int s=0;s<g.get_v();s++){
                if(!marked[s]){
                    dfs(g,s,s);
                }
            }
        }

        bool has_cycle(){
            return has_cycled;
        }

        virtual ~cycle(){
            delete []marked;
            marked = nullptr;
        }
};

//二分图 双色 端点颜色不同
class two_color{

    bool *marked;
    bool *color;
    bool is_two_color;

    void dfs(graph &g,int v){
        marked[v] = true;
        for(int &w:*g[v]){
            if(!marked[w]){
                color[w] = !color[v];
                dfs(g,w);
            }
            else if(color[w] == color[v]){//边的两个端点颜色相等,则不是二分图?
                is_two_color = false;
            }
        }
    }

    public:

        two_color(graph &g){
            marked = new bool[g.get_v()]{};
            color = new bool[g.get_v()]{};
            for(int s=0;s<g.get_v();s++){
                if(!marked[s]){
                    dfs(g,s);
                }
            }

        }

        bool is_pipartite(){
            return is_two_color;
        }


        virtual ~two_color(){
            delete []marked;
            marked = nullptr;
            delete []color;
            color = nullptr;
        }

};

// #define fmt(arg...) print(123##arg)

// #define fk(...) lk(0,##__VA_ARGS__,65)

// #define lk(_1,_2,_3,n,...) n

// #define t(...) 0,##__VA_ARGS__,11,23


struct A{
    A(){
        log("constructor");
    }
    A(A&)
    {
        log("copy constructor");
    }

};


A &f(A &b){
    log("copy?");
    return b;
}



int main(){

    // #ifdef __VA_ARGS__
    //     log("has va args");
    // #endif  

    ifstream reader("graph.txt",ios::in);

    log(reader.is_open());
    if(reader.is_open()){
        log("begin:");
        int c = 0;
        // log(typeid(reader.get()).name();
        while(!reader.eof()&&reader.good()){
            // print((char)reader.get());
            // reader >> c ;
            string str;
            getline(reader,str);
            println(str);
        }
        log("end");
    }

    reader.close();

    // std::string text = "Quick brown fox.";
    // std::regex ws_re("\\s+"); // whitespace
    // std::vector<std::string> v(std::sregex_token_iterator(text.begin(), text.end(), ws_re, -1), 
    //     std::sregex_token_iterator());
    // for(auto& s: v)
    //     std::cout << s <<"\n";

    // A a1;
    // auto c = f(a1);
    // log(typeid(c).name());

    // test for reading 
    ifstream in("graph.txt");
    graph g(in);

    log(degree(g,4));
    log(max_degree(g));
    log(avg_degree(g));
    log(number_of_self_loops(g));

    log(g.to_stong());


    //深度有限搜索
    depth_first_search search(g,3);

    log(search.mark(0),search.mark(7),search.count());

    //深度优先的 s->v 的路径是长路径
    // log("");
    depth_first_paths path(g,0);
    // log("");
    log(path.has_path_to(3),path.path_to(3).size(),path.path_to(3).max_size());
    log("path 0->3:");
    for(auto &w:path.path_to(3)){
        print(w,' ');
    }
    println();

    // log("bread");
    //广度优先 是 短路径!
    bread_first_paths path2(g,0);
    // log("");
    log(path2.has_path_to(3),path2.path_to(3).size(),path2.path_to(3).max_size());
    log("path2 0->3:");
    for(auto &w:path2.path_to(3)){
        print(w,' ');
    }
    println();

    //使用深度优先搜索 寻找 连通分量

    cc dd(g);

    log("连通分量数 count:",dd.total());

    vector<int> ** coms = new vector<int>*[dd.total()];

    for(int i=0;i<dd.total();i++){
        coms[i] = new vector<int>();
    }

    for(int i=0;i<g.get_v();i++){
        coms[dd.identity(i)]->push_back(i);//把同一个连通分量的顶点放在一起
    }
    println("连通分量(子图):");
    for(int i=0;i<dd.total();i++){
        print("连通分量",i,":");
        for(auto &&w:*coms[i]){
            print(w,' ');
        }
        println();
    }


    //释放内存
    for(int i=0;i<dd.total();i++){
        delete coms[i];
        coms[i] = nullptr;
    }

    delete []coms;
    coms = nullptr;

    // log();

    // int ab = 10;
    // const int bc = ab;
    // int hh[bc];//OK
    // int kk[ab];//OK

    cycle cyc(g);
    log("有环:",cyc.has_cycle());

    two_color tc(g);

    log("二分图:",tc.is_pipartite());

    return 0;
}
