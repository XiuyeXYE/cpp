// #include<iostream>
// #include"xylib/output"
// #include<string>
// #include<cstring>
// using namespace std;
// using namespace xiuye;

#include"../common"

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

    xiuye::println(__FILE__,__LINE__);

//     xiuye::println("["+__FILE__+":"+__LINE__+"]");

    xiuye::line(123,456);

     std::string prefix = "[";
        prefix +=__FILE__;
        prefix+=":";
        prefix+=std::to_string(__LINE__);
        prefix+="]";
        xiuye::println(prefix);

        xiuye::println(strlen(__FILE__),sizeof(__LINE__));
        // std::to_string("ABC");

        std::string prefix1 = "[";
        prefix1 = prefix1 + __FILE__+":"+std::to_string(__LINE__)+"]";

        xiuye::println(prefix1);

        xiuye::line("ABC","DEF","GHI");

        xiuye::info("DDDD","DDDDD","GFFFF");

        xiuye::log("DDDD","DDDDD","GFFFF");
        

    return 0;
}

