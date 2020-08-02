#include"../common"

using namespace std;

class edge{

    int v;
    int w;
    double weight;

    public:

        edge(int v,int w,double weight){
            this->v = v;
            this->w = w;
            this->weight = weight;

        }
        double wht(){
            return weight;
        }
        int either(){
            return v;
        }
        int other(int vertex){
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
        string to_string(){
            return std::to_string(v)+std::to_string(w)+std::to_string(weight);
        }
};

class edge_weighted_graph{

    int v;
    int e;
    vertor<edge> *adj;

    public:
        edge_weighted_graph(int v){
            this->v = v;
            this->w = w;
            this->adj = adj;
            adj = new vertor<edge>[v];
            for(int i=0;i<v;i++){
                adj[i] = vertor<edge>();
            }

        }

        int get_v(){
            return v;
        }

        int get_w(){
            return w;
        }

        void add_edge(edge e0){
            adj[v].push_back(e0);
            adj[w].push_back(e0);
            e++;
        }

        vertor<edge> operator[] (int idx){
            return adj[idx];
        }


        virtual ~edge_weighted_graph(){
            delete []adj;
            adj = nullptr;
        }



};

int main(){

    

    return 0;
}