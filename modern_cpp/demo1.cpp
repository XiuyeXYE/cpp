#include"../common"
using namespace std;

#ifdef __cplusplus
extern "C" {
#endif

int add(int x,int y){
    return x+y;
}

#ifdef __cplusplus
}
#endif

int main(){

    [out=std::ref(std::cout<<"Result from C code: "<<add(1,2))](){
        out.get() << ".\n";
        log(typeid(out).name(),typeid(out.get()).name());
        log(typeid(cout).name());
    }();

    return 0;
}