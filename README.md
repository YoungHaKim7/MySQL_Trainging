# MySQL_Trainging

# link

- [MySQL 설치 위치](#mysql-설치-위치)
- [SQL파일 MySQL 넣기](#sql파일-mysql-넣기)

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

```bash
mysql -u username -p database_name < file.sql
```
