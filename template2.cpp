#include"xylib/xiuye"
using namespace xiuye;

// A a; => constuctor
// A b(a); => copy constructor
// A a = value [type A]; => copy constructor
// A a = value [type other]; => constructor
// A a; a = value; => operator = 

class A{
    public:
        A(){
            println("A constructor");
        }
        A(int i){
            println("A constructor ",i);
        }
        //forbid copy and init copy
        A(const A&) = delete;
        //forbid copy and init copy and assigned
        A& operator = (A&a) = delete;
        // A(const A& o){
        //     println("A copy constructor");
        // }
        // A& operator = (int a){
        //     println("operator = ",a);
        //     return *this;
        // }

};

int main(){

    println("HelloWorld");
    //forbid A copy and = !
    A a;
    A b(999);
    // A c = 123;
    // c = 100;
    // A d(a);
    // A e = d;
    // A e = a;
    // e = a;
    
    return 0;
}