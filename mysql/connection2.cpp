#include"../common"
/*https://github.com/XiuyeXYE/cpp*/
int main(){

    
    MYSQL my_connection;
    MYSQL_RES *res_ptr;
    MYSQL_ROW sqlrow;

    mysql_init(&my_connection);
    if(mysql_real_connect(&my_connection,"127.0.0.1",
    "app","passwd",
    "mysql",0,NULL,0
    ))
    {
        log("connection success");

        int res = mysql_query(&my_connection,"select * from user");
        if(res){
            log("select error:",mysql_error(&my_connection));
        }
        else{
            // res_ptr = mysql_use_result(&my_connection);//first than follower
                        
            // log("affected rows:",(unsigned long)mysql_affected_rows(&my_connection));//insert update
            
            // if(res_ptr){
            //     while((sqlrow = mysql_fetch_row(res_ptr))){
            //         log("We select:",sqlrow[0]);
            //     }
            //     mysql_free_result(res_ptr);
            // }

            res_ptr = mysql_store_result(&my_connection);
            
            if(res_ptr){
                log("Retrieved",(unsigned long)mysql_num_rows(res_ptr),"rows");//select
                log("columns",mysql_field_count(&my_connection));
                MYSQL_FIELD *field_ptr;
                while((field_ptr=mysql_fetch_field(res_ptr))!=NULL){
                    log("column:",field_ptr->name,"table:",
                    field_ptr->table,"autoincrement:",
                    field_ptr->flags & AUTO_INCREMENT_FLAG,
                    "\tmax width:",field_ptr->length,
                    "type:",field_ptr->type
                    );
                }
                while((sqlrow = mysql_fetch_row(res_ptr))){
                    
                    log("We select:",sqlrow[0]);
                }
                mysql_free_result(res_ptr);
            }

        }

        mysql_close(&my_connection);
    }
    else{
        log("Connection failed");
        if(mysql_errno(&my_connection)){
            log("Connection error:",mysql_errno(&my_connection),
            mysql_error(&my_connection));
        }
    }

    return EXIT_SUCCESS;;
}