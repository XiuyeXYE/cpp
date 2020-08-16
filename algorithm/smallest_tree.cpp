#include"../common"

using namespace std;

class edge{

    int v;
    int w;
    double weight;

    public:

        edge() = default;

        edge(int v,int w,double weight){
            this->v = v;
            this->w = w;
            this->weight = weight;

        }
        double wht() const{
            return weight;
        }
        int either()const{
            return v;
        }
        int other(int vertex) const{
            if(vertex == v){
                return w;
            }
            else if(vertex == w){
                return v;
            }
            else{
                throw -1;
            }
        }

        //在调用 compare_to 时候,return type 不能为 bool ,应该是int,和 
        //operator > 结合使用,一定要是int用 bool 可能会类型转换和截断 -1 等
        int compare_to(const edge &that) const{
            if(wht() < that.wht()){
                return -1;
            }
            else if(wht()>that.wht()){
                return +1;
            }
            else{
                return 0;
            }
        }

        bool operator== (const edge &e2){//必须是const !否则有错误
            
            if((v == e2.v && w == e2.w &&weight==e2.weight)||(v == e2.w && w == e2.v&&weight==e2.weight)){
                return true;
            }
            
            return false;
        }

        bool operator > (const edge& e2) const{
            return compare_to(e2)>=0;
        }
        

        string to_string() const{
            return std::to_string(v)+','+std::to_string(w)+','+std::to_string(weight);
        }
};

class edge_weighted_graph{

    int v;//定点数
    int e;//边数
    vector<edge> *adj;//与该顶点连通的边

    public:
        edge_weighted_graph(int v):e(0){
            this->v = v;
            adj = new vector<edge>[v];
            for(int i=0;i<v;i++){
                adj[i] = vector<edge>();
            }

        }

        int get_v(){
            return v;
        }


        void add_edge(const edge &e0){
            int v = e0.either();
            int w = e0.other(v);
            adj[v].push_back(e0);
            adj[w].push_back(e0);
            e++;
        }

        vector<edge> get_all_edges(){
            vector<edge>  edges; 
            for(int i=0;i<v;i++){
                vector<edge> edges0 = (*this)[i];
                for(int j=0;j<edges0.size();j++){
                    auto it = find(begin(edges),end(edges),edges0[j]);
                    if(it == end(edges)){
                        edges.push_back(*it);
                    }
                }
            }

            return edges;
        }

        vector<edge> operator[] (int idx){
            return adj[idx];
        }


        virtual ~edge_weighted_graph(){
            delete []adj;
            adj = nullptr;
        }



};

//最小生成树,prim算法 延时实现
class lazy_prim_MST{
    
    bool *marked;
    queue<edge> mst;
    //  priority_queue<edge> pq;//优先级 大 -> 小 ,堆排序,默认大顶堆,默认倒序
    priority_queue<edge,vector<edge>,greater<edge>> pq;//小顶堆,正序
     
    //prim 核心算法2
    void visit(edge_weighted_graph &g,int v){
        marked[v] = true;
        for(auto &e:g[v]){
            if(!marked[e.other(v)])pq.push(e);
        }


    }

    public:

        lazy_prim_MST(edge_weighted_graph &g){
            marked = new bool[g.get_v()]{};
            //prim算法核心 1
            // piling();
            visit(g,0);
            // piling();
            while(!pq.empty()){
                
                auto e = pq.top();//最小边 (权重)
                pq.pop();//c++ 返回顶元素和弹出是分开的
                int v = e.either(),w = e.other(v);
                if(marked[v] && marked[w]){
                    continue;
                }
                // piling();
                // piling();
                mst.push(e);
                // piling();
                if(!marked[v])visit(g,v);
                // piling();
                if(!marked[w])visit(g,w);
                // piling();

            }

        }
        
        decltype(mst) edges(){
            return mst;
        }

        virtual ~lazy_prim_MST(){
            delete []marked;
            marked = nullptr;
        }


 };

template<class K>
class index_min_mq{

    
    public:
        index_min_mq(int v){

        }
    

};

class prim_MST{
    edge *edge_to;
    double *dist_to;
    bool *marked;
    index_min_mq<double> pq;

    void visit(edge_weighted_graph &g,int v){
        marked[v] = true;

        for(edge &e:g[v]){
            auto w = e.other(v);
            if(marked[w])continue;
            if(e.weight() < dist_to[w]){
                edge_to[w] = e;
                dist_to[w] = e.wht();
                if(pq.contains(w)){
                    pq.change(w,dist_to[w]);
                }
                else{
                    pq.push(w,dist_to[w]);
                }
            }
        }


    }
    
    public:
        prim_MST(edge_weighted_graph &g):pq(g.get_v()){
            edge_to = new edge[g.get_v()];
            dist_to = new double[g.get_v()]{};
            marked = new bool[g.get_v()]{};
            for(int i=0;i<g.get_v();i++){
                dist_to[i] = numeric_limits<double>::max();//double最大值
            }
            dist_to[0] = 0.0;
            pq.push(0,0.0);
            while(!pq.empty()){
                visit(g,pq.del_min());
            }



        }


};




template<class K>
class max_pq{

    K *pq;
    int n{0};

    bool less(int i,int j){
        return pq[i] < pq[j];
    }

    void exch(int i,int j){
        K t = pq[i];
        pq[i] = pq[j];
        pq[j] = t;
    }

    void swim(int k){
        while(k>1&&less(k/2,k)){
            exch(k/2,k);
            k = k/2;
        }
    }

    void sink(int k){
        while(2*k <=n){
            int j=2*k;
            if(j<n && less(j,j+1))j++;
            if(less(k,j))break;
            exch(k,j);
            k = j;
        }
    }

    public:
        max_pq(int max_n){
            pq = new K[max_n];
        }
        bool empty(){
            return n==0;
        }
        int size(){
            return n;
        }
        void insert(K v){
            pq[++n] = v;
            swim(n);
        }
        K del_max(){
            K max = pq[1];
            exch(1,n--);
            pq[n+1] = ZERO(K);
            sink(1);
            return max;
            
        }


};





int main(){
    //c++ 隐式类型转换类型转换,也容易出bug
    //比如上面的 bool 和 int 稍有不好就会在compare的时候处错误!
    //使得到的优先级队列数据错误!!!输出错误!!!

    priority_queue<int> pq;
    pq.push(22);
    pq.push(565);
    pq.push(11);
    pq.push(1);
    pq.push(12);
    pq.push(13);
    pq.push(2);
    pq.push(3);
    pq.push(33);
    println("pq size:",pq.size());
    int size = pq.size();
    for(int i=0;i<size;i++){
        print(pq.top(),' ');
        pq.pop();
    }
    println();

    edge d1(1,2,1);
    edge d2(2,1,1);

    println(d1 == d2);

    priority_queue<edge,vector<edge>,greater<edge>> pq2;
    
    pq2.push(edge(1,2,1));
    pq2.push(edge(2,1,2));
    pq2.push(edge(1,3,3));
    pq2.push(edge(1,4,6));
    pq2.push(edge(1,5,2.6));
    pq2.push(edge(3,2,3.9));
    pq2.push(edge(2,5,1.1));
    int size2 = pq2.size();
    for(int i=0;i<size2;i++){
        print(pq2.top().to_string(),' ');
        pq2.pop();
    }
    println();

    println(1.1 > 1);
    println(1.1 < 1);

    edge_weighted_graph g(8);
    g.add_edge(edge(4,5,0.35));
    g.add_edge(edge(4,7,0.37));
    g.add_edge(edge(5,7,0.28));
    g.add_edge(edge(0,7,0.16));
    g.add_edge(edge(1,5,0.32));
    g.add_edge(edge(0,4,0.38));
    g.add_edge(edge(2,3,0.17));
    g.add_edge(edge(1,7,0.19));
    g.add_edge(edge(0,2,0.26));
    g.add_edge(edge(1,2,0.36));
    g.add_edge(edge(1,3,0.29));
    g.add_edge(edge(2,7,0.34));
    g.add_edge(edge(6,2,0.40));
    g.add_edge(edge(3,6,0.52));
    g.add_edge(edge(6,0,0.58));
    g.add_edge(edge(6,4,0.93));


    println("prim 延时算法:");
    // piling();
    lazy_prim_MST mst1(g);
    // piling();
    auto edges1 = mst1.edges();
    // piling();
    // for_each(begin(edges),end(edges),[](edge &e){
    //     println(e.to_string());
    // });
    int size1 = edges1.size();
    log("lazy prim size:",size1);
    log("最小生成树(边):");
    for(int i=0;i<size1;i++){
        // piling();
        println(edges1.front().to_string());
        edges1.pop();
    }
    
    println(numeric_limits<double>::max());

    return 0;
}