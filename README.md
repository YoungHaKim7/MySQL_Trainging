# MySQL_Trainging

# link

- [MySQL명령어 정리](#mysql명령어-정리)
  - [How can a user implicitly end current MySQL transaction?](#how-can-a-user-implicitly-end-current-mysql-transaction)
  - [테이블 추가 , 변경](https://dreamcoding.tistory.com/71)
- tutorial
  - [SQL 기초 강의 | 혼자 공부하는 SQL(MySQL 8.0) | 한빛미디어](#sql-기초-강의-혼자-공부하는-sqlmysql-80--한빛미디어)
  - [WSL2에 mysql설치하기](#wsl2에-mysql설치하기)
  - [docker run mysql](https://poiemaweb.com/docker-mysql)

<hr />

# WSL2에 mysql설치하기[|🔝|](#link)
Antipiebse·2022년 4월 5일
- https://velog.io/@antipiebse/wsl2%EC%97%90-mysql%EC%84%A4%EC%B9%98%ED%95%98%EA%B8%B0

# SQL 기초 강의] 혼자 공부하는 SQL(MySQL 8.0) | 한빛미디어[|🔝|](#link)
- https://youtube.com/playlist?list=PLVsNizTWUw7GCfy5RH27cQL5MeKYnl8Pm&si=pUK-bbPWSwPSTrFp

# MySQL명령어 정리[|🔝|](#link)

- [외국인이 정리한거(mysql 명령어 굿)_how-to-start-logging-with-mysql/](https://betterstack.com/community/guides/logging/how-to-start-logging-with-mysql/)
- https://offbyone.tistory.com/54

```
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

```
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
```
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
