// #include<iostream>
// using namespace std;
#include"common"

int main(){

    // cout << "Hello World" << endl;

    enum color{
        RED,
        BLUE,
        GREEN = -2,
        YELLOW,
        PINK
    };

    // cout << RED << " " << PINK <<endl;

    log("Hello World");

    log(RED,PINK);

    return 0;
}