#include"../common"
/*
https://github.com/XiuyeXYE/cpp
*/

template<int a>
void outi(){
    log("a=",a);
}


int main(){

    outi<123>();

    const int a = 100;
    outi<a>();

    constexpr int b = 101;
    outi<b>();

    return 0;
}

