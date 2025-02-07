# MySQL_Trainging

# link

- [MySQL 설치 위치](#mysql-설치-위치)
- [SQL파일 MySQL 넣기](#sql파일-mysql-넣기)
- docker
  - [첨에 설치하고 들어가기 & docker에서 들어가기 sql(docker안에서 실행&설치 및 docker exec)](#sqldocker안에서-실행설치-및-docker-exec)
  - [MySQL _ Docker안에서 들어가는 방법](#sql-첨에-root비번-설정까지첨에-들어가는거랑-난중에-들어가는거-비슷하다)

- MySQL명령어 정리
  - [How can a user implicitly end current MySQL transaction?](#how-can-a-user-implicitly-end-current-mysql-transaction)
  - [(외부링크)테이블 추가 , 변경](https://dreamcoding.tistory.com/71)
- tutorial
  - [SQL 기초 강의 | 혼자 공부하는 SQL(MySQL 8.0) | 한빛미디어](#sql-기초-강의-혼자-공부하는-sqlmysql-80--한빛미디어)
  - [WSL2에 mysql설치하기](#wsl2에-mysql설치하기)
  - [(외부링크)docker run mysql](https://poiemaweb.com/docker-mysql)

- VSCode Extentions
  - [(외부링크)MySQL_Database Management for MySQL/MariaDB, PostgreSQL, Redis and ElasticSearch.](https://marketplace.visualstudio.com/items?itemName=cweijan.vscode-mysql-client2)

<hr />

# WSL2에 mysql설치하기[|🔝|](#link)
Antipiebse·2022년 4월 5일
- https://velog.io/@antipiebse/wsl2%EC%97%90-mysql%EC%84%A4%EC%B9%98%ED%95%98%EA%B8%B0

# SQL 기초 강의] 혼자 공부하는 SQL(MySQL 8.0) | 한빛미디어[|🔝|](#link)
- https://youtube.com/playlist?list=PLVsNizTWUw7GCfy5RH27cQL5MeKYnl8Pm&si=pUK-bbPWSwPSTrFp

# MySQL 설치 위치[|🔝|](#link)

- 출처: https://larva.tistory.com/entry/mysql-설치-경로-확인 [devNote:티스토리]

```bash
# mysql 설치경로 확인
$ ps aux | grep mysql

# whereis mysql기본 설치 경로는
/var/lib/mysql/저장된 database 경로 확인 방법

mysql> show variables like 'datadir';

```

# SQL파일 MySQL 넣기[|🔝|](#link)

- https://stackoverflow.com/questions/17666249/how-to-import-an-sql-file-using-the-command-line-in-mysql
- https://dev.mysql.com/doc/refman/8.4/en/mysql-batch-commands.html

```bash
mysql -u username -p database_name < file.sql
```

# SQL 첨에 root비번 설정까지(첨에 들어가는거랑 난중에 들어가는거 비슷하다)[|🔝|](#link)

```
# shell에서 접속하기 누른다음에 비번 누르면 된다.
mysql -uroot -p
Enter password:

```

# sql(docker안에서 실행&설치 및 docker exec)[|🔝|](#link)

- https://blog.naver.com/pjok1122/221539169731
- https://poiemaweb.com/docker-mysql

```

$ docker pull mysql

# 도커 내가 원하는 버젼으로 설치
$ docker pull mysql:8.0.22

# 도커 이미지 보기
$ docker images

# 도커 첨에 실행 패턴
$ docker run --name mysql-container -e MYSQL_ROOT_PASSWORD=<password> -d -p 3306:3306 mysql:latest


# 도커 실행하기 "mysql-container"
$ docker exec -it mysql-container bash


# 도커 list 숨긴것까지 다 보기 
$ docker ps -a

# 도커 중지
$ docker stop mysql-container

# 도커 시작 dc3d이렇게 쳐도 됨 name으로 해도 되고
$ docker start mysql-container

# 도커 재시작
$ docker restart mysql-container

# 쉘에서 MySQL 들어가기
$ mysql -u root -p

# MySQL안에서 데이터 베이스 보기
mysql> show databases;


# shell에서 접속하기 누른다음에 비번 누르면 된다.
mysql -uroot -p
Enter password:
```
