#include"xylib/xiuye"
using namespace xiuye;

template<class T,class U>
struct isEqual{
    enum{
        value = false
    };
};
//te hua
template<class T>
struct isEqual<T,T>{
    enum{
        value = true
    };
};

#define isEQ(...) isEqual<__VA_ARGS__>::value

template<bool>
struct IsTrue{
    enum{
        value = false
    };
};
template<>
struct IsTrue<true>{
    enum{
        value = true
    };
};

template<class T,class U>
struct IsConvertable{
    private:
        typedef char YES;
        typedef struct {
            char none[2];
        }NO;
        static YES test(U);
        static NO test(...);
        static T self();
    public:
        // using Result = IsTrue<sizeof(test(self()))==sizeof(YES)>;
        typedef IsTrue<sizeof(test(self()))==sizeof(YES)> Result;
};


struct A{
    int a;
    float b;
    double c;
};

int main(){

    println(isEqual<int,float>::value);
    println(isEqual<int,int>::value);
    println(isEQ(float,int));
    println(isEQ(float,float));

    println(IsTrue<1==1>::value);
    println(IsConvertable<int,bool>::Result::value);
    println(IsConvertable<int,int>::Result::value);
    println(IsConvertable<char,bool>::Result::value);
    println(IsConvertable<char,A>::Result::value);

    return 0;
}