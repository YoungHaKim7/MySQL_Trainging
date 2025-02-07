# link

- [MySQL명령어 정리](#mysql명령어-정리)
  - [How can a user implicitly end current MySQL transaction?](#how-can-a-user-implicitly-end-current-mysql-transaction)

- Table 추가, 삭제, 수정
  - [table 만들기(create table)]()
  - [table 추가하기(alter table)]()
  - [table 수정하기(change)]
  - [table전체적으로 보기(DESC table1("테이블명"))]()
  - [table 삭제하기(drop)]()

# MySQL명령어 정리[|🔝|](#link)

- [외국인이 정리한거(mysql 명령어 굿)_how-to-start-logging-with-mysql/](https://betterstack.com/community/guides/logging/how-to-start-logging-with-mysql/)
- https://offbyone.tistory.com/54


```sql
$ mysql -h서버 -u아이디 -p비밀번호 데이터베이스명

# 비번 1234
mysql -uroot -p1234 testdb

mysql -uroot -p1234

mysql -uroot -p

## ~~~ mysql 셀 명령어 ~~~ ####

mysql> show databases;


# 데이터 베이스의 생성 및 삭제
mysql> CREATE DATABASE testdb CHARACTER SET utf8 COLLATE utf8_general_ci;


mysql> CREATE DATABASE testdb;

mysql> DROP DATABASE testdb;


# 3. 사용자 추가 및 제거

mysql> CREATE USER 'testdbuser'@'localhost' IDENTIFIED BY 'password';

mysql> GRANT ALL PRIVILEGES ON testdb.* TO 'testdbuser'@'localhost';

mysql> CREATE USER 'testdbuser'@'%' IDENTIFIED BY 'password';

mysql> REVOKE ALL PRIVILEGES *.* FROM 'testdbuser'@'localhost';


mysql> DROP USER 'testdbuser'@'localhost';


# 4. 데이터베이스 선택 및 쿼리 작업

mysql> use testdb;

mysql> show tables;

mysql> show tables like 'time%';

# 5. 데이터베이스 및 테이블 생성 스크립트 보기

mysql> show create databse testdb;
 
mysql> show create table tb_test;


# 6. 쿼리 스크립트 파일 실행하기
mysql -utestdbuser -p testdb < insert.sql
Enter password: ****

# 프로세스 리스트보기
 
mysql> show processlist;


mysql> kill 프로세스아이디

# 8. 관리자 비밀번호 분실시 비밀번호 변경 방법
 
- 현재 MySQL 서버를 중지합니다.
- 권한을 체크하지 않게하는 --skip-grant 옵션을 사용하여 서버를 시작합니다.
 
# mysqld --skip-grant

```

# How can a user implicitly end current MySQL transaction?[|🔝|](#link)
- https://www.tutorialspoint.com/How-can-a-user-implicitly-end-current-MySQL-transaction

```sql
mysql> START TRANSACTION;
Query OK, 0 rows affected (0.00 sec)

mysql> INSERT INTO MARKS Values(3,'gaurav','Comp',69);
Query OK, 1 row affected (0.26 sec)

mysql> Create table student(id int, Name Varchar(10),);
Query OK, 0 rows affected (0.84 sec)

mysql> Rollback;
Query OK, 0 rows affected (0.00 sec)

mysql> select * from marks;
+------+---------+-----------+-------+
| Id | Name | Subject | Marks |
+------+---------+-----------+-------+
| 1 | Aarav | Maths | 50 |
| 1 | Harshit | Maths | 55 |
| 3 | Gaurav | Comp | 69 |
+------+---------+-----------+-------+
3 rows in set (0.00 sec)
```

- https://hermeslog.tistory.com/358
```sql
mysql> SHOW DATABASES;

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
| testDB             |
+--------------------+

mysql> use testDB;

mysql> show tables;
+-------------------------+
| Tables_in_testDB        |
+-------------------------+
| payment_events          |
| payment_order_histories |
| payment_orders          |
+-------------------------+
3 rows in set (0.00 sec)

# COLUMN 정보조회 (with comment)

mysql> show columns from 테이블명;


mysql> show CREATE table payment_events;

----------------------------------------------+
| payment_events | CREATE TABLE `payment_events` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `buyer_id` bigint NOT NULL,
  `is_payment_done` tinyint(1) NOT NULL DEFAULT '0',
  `payment_key` varchar(255) DEFAULT NULL,
  `order_id` varchar(255) DEFAULT NULL,
  `type` enum('NORMAL') NOT NULL,
  `order_name` varchar(255) NOT NULL,
  `method` enum('EASY_PAY') DEFAULT NULL,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `approved_at` datetime DEFAULT NULL,
  `psp_raw_data` json DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `payment_key` (`payment_key`),
  UNIQUE KEY `order_id` (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci |
+----------------+------------------------------------------------------------------------------------------------------------------------------------------------------------------------
```

<hr />

# table 만들기(create table)[|🔝|](#link)

```sql
CREATE TABLE payment_order_histories (  
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    FOREIGN KEY (payment_order_id) REFERENCES payment_orders(id)
) COMMENT '';
```

# table 추가하기(alter table)[|🔝|](#link)

```sql
ALTER TABLE payment_orders 
    ADD COLUMN  [type] COMMENT '' AFTER `product_id`;
```

# table 수정하기(columns명 바꾸기(change))[|🔝|](#link)

```sql
ALTER TABLE `payment_orders` 
	CHANGE `amount` `amount` decimal(12,2) NOT NULL ;
```

# table columns명 바꾸기(change 02)[|🔝|](#link)

```sql
ALTER TABLE `payment_orders` 
	CHANGE `seller_idtest` `seller_id` bigint NOT NULL ;
```

# table전체적으로 보기(DESC table1("테이블명"))(#link)

```
mysql> DESC table1;
```

# table 삭제하기(drop)(#link)

```sql
# sql내용
ALTER TABLE `payment_orders` 
	DROP COLUMN `amount` `amount` decimal(12,2) NOT NULL ;

# cli로 입력
mysql> ALTER TABLE tables1 DROP COLUMN addtable;

# table확인
mysql> DESC tables1;
```
