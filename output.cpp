// #include<iostream>
#include"xylib/output"
// using namespace std;
// using namespace xiuye;
enum color{ //must be global!or else , println not recognize
        RED,
        GREEN
};
enum class color2{
        RED,
        GREEN,
        BLUE,
        YELLOW
};
int main(){

   
    // ostream & operator << (ostream& out,color c){
    //     return out;
    // }
    std::cout << RED << std::endl;
    // std::cout << color2::RED << std::endl;
    // color2 c = color2::RED;
    xiuye::println("HelloWorld",1,'A',9.9,1000L,GREEN);
    return 0;
}

