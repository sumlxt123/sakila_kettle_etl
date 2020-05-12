
## sakila EEL 项目
参考资料：


## 项目介绍
使用kettle 7.1版本，解决基于一个虚拟的DVD出租连锁点Sakila，通过一个简单的星型模型对其进行分析，星型模型来自于Mysql免费的sakila数据库。
查看其结构可以参考一下blog：
https://www.cnblogs.com/xqzt/p/4401163.html
https://www.cnblogs.com/xqzt/p/4438749.html


## 初始化sakila数据库及插入数据
```
CREATE USER sakila IDENTIFIED BY 'sakila';
GRANT ALL PRIVILEGES ON sakila.* TO sakila;


# 执行sql文件
shell> mysql -u root -p

mysql> SOURCE C:/temp/sakila-db/sakila-schema.sql;
mysql> SOURCE C:/temp/sakila-db/sakila-data.sql;

```


## 初始化sakila_dwh数据库
```
CREATE USER sakila_dwh IDENTIFIED BY 'sakila_dwh';
GRANT ALL PRIVILEGES ON sakila_dwh.* TO sakila_dwh;
```


# load_rentals.kjb 设计
>在配置邮件时如使用163邮箱时，密码需要使用授权密码   SMTP服务器：smtp.163.com  port:25

![load_rentals.kjb](https://github.com/sumlxt123/sakila_kettle_etl/tree/master/images/load_rentals.kjb.png)


# load_dim_staff.ktr
>实现增量更新
![load_dim_staff.ktr](https://github.com/sumlxt123/sakila_kettle_etl/tree/master/images/load_dim_staff.ktr.png)


# load_dim_customer.ktr
>在转换中调用子转换
![load_dim_customer.ktr](https://github.com/sumlxt123/sakila_kettle_etl/tree/master/images/load_dim_customer.ktr.png)


# load_dim_store.ktr
>在转换中调用子转换
![load_dim_store.ktr](https://github.com/sumlxt123/sakila_kettle_etl/tree/master/images/load_dim_store.ktr.png)


# load_dim_actor.ktr
>插入/更新功能使用
![load_dim_actor.ktr](https://github.com/sumlxt123/sakila_kettle_etl/tree/master/images/load_dim_actor.ktr.png)


# load_dim_film.ktr
>实现行列转换
![load_dim_film.ktr](https://github.com/sumlxt123/sakila_kettle_etl/tree/master/images/load_dim_film.ktr.png)
![load_dim_film.ktr1](https://github.com/sumlxt123/sakila_kettle_etl/tree/master/images/load_dim_film.ktr1.png)

# load_fact_rental.ktr
>处理空值数据
![load_fact_rental.ktr](https://github.com/sumlxt123/sakila_kettle_etl/tree/master/images/load_fact_rental.ktr.png)
