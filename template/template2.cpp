// #include"xylib/xiuye"
// using namespace xiuye;

#include"../common"

// A a; => constuctor
// A b(a); => copy constructor
// A a = value [type A]; => copy constructor
// A a = value [type other]; => constructor
// A a; a = value; => operator = 

class A{
    public:
        A() = default;
        // {
        //     println("A constructor");
        // }
        A(int i){
            println("A constructor ",i);
        }
        //forbid copy and init copy
        A(const A&) = delete;
        //forbid copy and init copy and assigned
        A& operator = (A&a) = delete;

        A(A&&){
            println("right value reference Constuctor");
        }

        // A(const A& o){
        //     println("A copy constructor");
        // }
        // A& operator = (int a){
        //     println("operator = ",a);
        //     return *this;
        // }

};

A f(){
    A a;
    return a;
}



int main(){

    println("HelloWorld");
    //forbid A copy and = !
    A a;
    // a = 100;//error
    A b(999);
    // A c = 123;//error
    // c = 100;//error
    // A d(a);//error
    // A e = d;//error
    // A e = a;//error
    // e = a;//error

    A g(static_cast<A&&>(a));
    A h(std::move(a));
    // A h(std::forward(a));
    println("next");
    A i = f();
    A &&j = f();
    auto &&k = f();
    // println(i);
    const char s[]= "HelloWorld";
    info(s,len(s));

    log(len("HelloWorld"),sizeof("HelloWorld"),typeid("HelloWorld").name());

    const char *s1= "HelloWorld";
    info(s1,len(s1));

    return 0;
}