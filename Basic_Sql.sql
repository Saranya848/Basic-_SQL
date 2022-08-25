mysql> create database OrganizationDB;
Query OK, 1 row affected (0.01 sec)

mysql> use OrganizationDB;
Database changed
mysql> create table College(College_id int primary key, college_name varchar(50), college_branch varchar(50), college_address varchar(200));
Query OK, 0 rows affected (0.05 sec)

mysql> insert into College values(242, "KLU", "Guntur", "Vaddeswaram, Guntur, Andhra Pradesh, India");
Query OK, 1 row affected (0.01 sec)

mysql> insert into College values(352, "Gitam", "Vizag", "Visakhapatnam, Andhra Pradesh, India");
Query OK, 1 row affected (0.01 sec)

mysql> insert into College values(522, "Avathi", "Garividi", "Garividi, Andhra Pradesh, India");
Query OK, 1 row affected (0.01 sec)

mysql> create table student(s_id int primary key, college_name varchar(50), s_name varchar(50), email varchar(50), phoneno long, s_branch varchar(50), Student_address varchar(200));
Query OK, 0 rows affected (0.04 sec)

mysql> insert into student(53556, "KLU", "Swathi.A", "swathi@gmail.com", 8934572847, "CSE", "Vizag");
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '53556, "KLU", "Swathi.A", "swathi@gmail.com", 8934572847, "CSE", "Vizag")' at line 1
mysql> insert into student values(53556, "KLU", "Swathi.A", "swathi@gmail.com", 8934572847, "CSE", "Vizag");
Query OK, 1 row affected (0.01 sec)

mysql> insert into student values(41489, "Gitam", "Ajay Kumar", "Ajay@gmail.com", 8824245647, "EEE", "Vizag");
Query OK, 1 row affected (0.01 sec)

mysql> insert into student values(36456, "KLU", "Rahul Kumar", "Rahul@gmail.com", 8285747747, "EEE", "Hyd");
Query OK, 1 row affected (0.01 sec)

mysql> create table Department(dpart_id int, dpart_name varchar(100));
Query OK, 0 rows affected (0.04 sec)

mysql> insert into Department values(255, "CSE");
Query OK, 1 row affected (0.01 sec)

mysql> insert into Department values(256, "EEE");
Query OK, 1 row affected (0.01 sec)

mysql> insert into Department values(526, "EEE");
Query OK, 1 row affected (0.01 sec)

mysql> insert into Department values(528, "CSE");
Query OK, 1 row affected (0.01 sec)

mysql> insert into Department values(530, "Civil");
Query OK, 1 row affected (0.01 sec)

//Displaying all the dept names along with no of students in it
mysql> ALTER TABLE student RENAME COLUMN s_branch TO dpart_name;
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select dpart_name from Student group by dpart_name;
+------------+
| dpart_name |
+------------+
| EEE        |
| CSE        |
+------------+
2 rows in set (0.00 sec)

mysql> desc student;
+-----------------+--------------+------+-----+---------+-------+
| Field           | Type         | Null | Key | Default | Extra |
+-----------------+--------------+------+-----+---------+-------+
| s_id            | int          | NO   | PRI | NULL    |       |
| college_name    | varchar(50)  | YES  |     | NULL    |       |
| s_name          | varchar(50)  | YES  |     | NULL    |       |
| email           | varchar(50)  | YES  |     | NULL    |       |
| phoneno         | mediumtext   | YES  |     | NULL    |       |
| dpart_name      | varchar(50)  | YES  |     | NULL    |       |
| Student_address | varchar(200) | YES  |     | NULL    |       |
+-----------------+--------------+------+-----+---------+-------+
7 rows in set (0.00 sec)

mysql> select * from student;
+-------+--------------+-------------+------------------+------------+------------+-----------------+
| s_id  | college_name | s_name      | email            | phoneno    | dpart_name | Student_address |
+-------+--------------+-------------+------------------+------------+------------+-----------------+
| 36456 | KLU          | Rahul Kumar | Rahul@gmail.com  | 8285747747 | EEE        | Hyd             |
| 41489 | Gitam        | Ajay Kumar  | Ajay@gmail.com   | 8824245647 | EEE        | Vizag           |
| 53556 | KLU          | Swathi.A    | swathi@gmail.com | 8934572847 | CSE        | Vizag           |
+-------+--------------+-------------+------------------+------------+------------+-----------------+
3 rows in set (0.00 sec)

mysql> insert into student values(66456, "KLU", "Vamsi Kumar", "kumar@gmail.com", 7835757, "Civil", "Hyd");
Query OK, 1 row affected (0.01 sec)

mysql> select * from student;
+-------+--------------+-------------+------------------+------------+------------+-----------------+
| s_id  | college_name | s_name      | email            | phoneno    | dpart_name | Student_address |
+-------+--------------+-------------+------------------+------------+------------+-----------------+
| 36456 | KLU          | Rahul Kumar | Rahul@gmail.com  | 8285747747 | EEE        | Hyd             |
| 41489 | Gitam        | Ajay Kumar  | Ajay@gmail.com   | 8824245647 | EEE        | Vizag           |
| 53556 | KLU          | Swathi.A    | swathi@gmail.com | 8934572847 | CSE        | Vizag           |
| 66456 | KLU          | Vamsi Kumar | kumar@gmail.com  | 7835757    | Civil      | Hyd             |
+-------+--------------+-------------+------------------+------------+------------+-----------------+
4 rows in set (0.00 sec)

mysql> select dpart_name from Student group by dpart_name;
+------------+
| dpart_name |
+------------+
| EEE        |
| CSE        |
| Civil      |
+------------+
3 rows in set (0.00 sec)

mysql> select dpart_name, Count(*) from Student group by dpart_name;
+------------+----------+
| dpart_name | Count(*) |
+------------+----------+
| EEE        |        2 |
| CSE        |        1 |
| Civil      |        1 |
+------------+----------+
3 rows in set (0.00 sec)

//having
mysql> select dpart_name, Count(*) from Student group by dpart_name having count(*)<2;
+------------+----------+
| dpart_name | Count(*) |
+------------+----------+
| CSE        |        1 |
| Civil      |        1 |
+------------+----------+
2 rows in set (0.00 sec)

mysql> Select s_name from student
    -> where dpart_name In
    -> select dpart_name, Count(*) from Student group by dpart_name having count(*)<2;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'select dpart_name, Count(*) from Student group by dpart_name having count(*)<2' at line 3
mysql> Select s_name from student
    -> where dpart_name IN
    -> select dpart_name from Student group by dpart_name having count(*)<2;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'select dpart_name from Student group by dpart_name having count(*)<2' at line 3
mysql> Select s_name from student
    -> where dpart_name IN
    -> (select dpart_name from Student group by dpart_name having count(*)<2);
+-------------+
| s_name      |
+-------------+
| Swathi.A    |
| Vamsi Kumar |
+-------------+
2 rows in set (0.00 sec)

//Order by values
mysql> select s_name, college_name, dpart_name
    -> from student
    -> order by s_name desc
    -> ;
+-------------+--------------+------------+
| s_name      | college_name | dpart_name |
+-------------+--------------+------------+
| Vamsi Kumar | KLU          | Civil      |
| Swathi.A    | KLU          | CSE        |
| Rahul Kumar | KLU          | EEE        |
| Ajay Kumar  | Gitam        | EEE        |
+-------------+--------------+------------+
4 rows in set (0.00 sec)

mysql> select s_name, dpart_name
    -> from student
    -> order by s_name desc, dpart_name asec;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'asec' at line 3
mysql> select s_name, dpart_name
    -> from student
    -> order by s_name desc, dpart_name asc;
+-------------+------------+
| s_name      | dpart_name |
+-------------+------------+
| Vamsi Kumar | Civil      |
| Swathi.A    | CSE        |
| Rahul Kumar | EEE        |
| Ajay Kumar  | EEE        |
+-------------+------------+
4 rows in set (0.00 sec)

mysql> select s_name, dpart_name
    -> from student
    -> order by s_name desc, dpart_name desc;
+-------------+------------+
| s_name      | dpart_name |
+-------------+------------+
| Vamsi Kumar | Civil      |
| Swathi.A    | CSE        |
| Rahul Kumar | EEE        |
| Ajay Kumar  | EEE        |
+-------------+------------+
4 rows in set (0.00 sec)

mysql> select s_name, dpart_name
    -> from student
    -> order by dpart_name desc, s_name desc;
+-------------+------------+
| s_name      | dpart_name |
+-------------+------------+
| Rahul Kumar | EEE        |
| Ajay Kumar  | EEE        |
| Swathi.A    | CSE        |
| Vamsi Kumar | Civil      |
+-------------+------------+
4 rows in set (0.00 sec)


//indexing
mysql> create index Depart_index on student(dpart_name acs);
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'acs)' at line 1
mysql> create index Depart_index on student(dpart_name asc);
Query OK, 0 rows affected (0.07 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select * from student
    -> where dpart_name asc;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'asc' at line 2
mysql> select * from student
    -> where dpart_name = "CSE";
+-------+--------------+----------+------------------+------------+------------+-----------------+
| s_id  | college_name | s_name   | email            | phoneno    | dpart_name | Student_address |
+-------+--------------+----------+------------------+------------+------------+-----------------+
| 53556 | KLU          | Swathi.A | swathi@gmail.com | 8934572847 | CSE        | Vizag           |
+-------+--------------+----------+------------------+------------+------------+-----------------+
1 row in set (0.00 sec)

//Joins
