#include<iostream>
using namespace std;

int main(){

    cout << "Hello World" << endl;

    enum color{
        RED,
        BLUE,
        GREEN = -2,
        YELLOW,
        PINK
    };

    cout << RED << " " << PINK <<endl;

    return 0;
}