#include"../common"

#include<linux/init.h>
#include<linux/module.h>

static int __init hello_init(){
    log("Hello World enter");
    return 0;
}

module_init(hello_init);

static void __exit hello_exit(){
    log("hello world exit");
}

module_exit(hello_exit);

MODULE_AUTHOR("xiuye");
MODULE_LICENSE("GPL v2");
MODULE_DESCRIPTION("A simple Hello World Module");
MODULE_ALIAS("A simplest module");



