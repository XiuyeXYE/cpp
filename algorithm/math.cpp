// #include"xylib/output"
// #include"xylib/math"
// #include"xylib/time"
// using namespace xiuye;
#include"../common"

int main(){

    TimeSpec::begin();
    println(max(5,6,31,22,5));
    println(min(5,6,31,22,5));

    println(max(5.0,6.0,31.0,22.0,5.0));
    println(min(5.0,6.0,31.0,22.0,5.0));

    for(int i=0;i<87650;i++)
        println(i);

    TimeSpec::print_cost_ticks();
    TimeSpec::print_cost_seconds();
    return 0;
}