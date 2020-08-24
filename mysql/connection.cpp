#include"../common"

int main(){

    MYSQL *conn_ptr;
    conn_ptr = mysql_init(NULL);
    if(!conn_ptr){
        log("mysql_init failed");
        return EXIT_FAILURE;
    }
    conn_ptr = mysql_real_connect(conn_ptr,"127.0.0.1",//don't use localhost!it not DNS
    "app","passwd",
    "mall",0/*3306 yes OK*/,NULL,0);
    if(conn_ptr){
        log("connection success");

    }else{
        log("connection failed");
    }
    
    mysql_close(conn_ptr);


    return EXIT_SUCCESS;
}