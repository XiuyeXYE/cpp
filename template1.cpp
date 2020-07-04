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

#define isTrue(...) IsTrue<__VA_ARGS__>::value

template<class T,class U>
struct IsConvertable{
    private:
    //you can use "using aliasType = type"!
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

#define isConvertable(...) IsConvertable<__VA_ARGS__>::Result::value

template<class T,int N>
int ArrayLength(T(&)[N]){
    return N;
}


int ArrayLength(const char *s){
    return sizeof(s);
}

struct A{
    int a;
    float b;
    double c;
};

enum class Color{
	RED,
	GREEN,
	BLUE
};

template<typename T>
int ArrayLength(T &a){
    log(sizeof(a),sizeof(a[0]));
	return sizeof(a)/sizeof(a[0]);
}

int main(){

    println(isEqual<int,float>::value);
    println(isEqual<int,int>::value);
    println(isEQ(float,int));
    println(isEQ(float,float));

    println(IsTrue<1==1>::value);
    println(isTrue(1==1));
    println(IsConvertable<int,bool>::Result::value);
    println(IsConvertable<int,int>::Result::value);
    println(IsConvertable<char,bool>::Result::value);
    println(IsConvertable<char,A>::Result::value);
    println(isConvertable(char,A));
    println(isConvertable(char,int));

    println(len("1234567"));

    int a[10];

    println(ArrayLength(a));
    int b[100][101];
    println(ArrayLength(b));
    println(ArrayLength("123456789"));
    println(len("123456789"));
    println(len(""));
    println(len(a));
    println(len(b));
    println(len(b[0]));
    std::cout << (int)Color::RED << std::endl;
  
    println((int)Color::RED);
	
	const char *s1= "HelloWorld";
    info(s1,ArrayLength(s1));//err num
    log(123);

    return 0;
}
