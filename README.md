# MySQL_Trainging

<hr />

# WSL2에 mysql설치하기
Antipiebse·2022년 4월 5일
- https://velog.io/@antipiebse/wsl2%EC%97%90-mysql%EC%84%A4%EC%B9%98%ED%95%98%EA%B8%B0

# SQL 기초 강의] 혼자 공부하는 SQL(MySQL 8.0) | 한빛미디어
- https://youtube.com/playlist?list=PLVsNizTWUw7GCfy5RH27cQL5MeKYnl8Pm&si=pUK-bbPWSwPSTrFp

# MySQL명령어 정리

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
