Script started on Tue 10 Oct 2023 06:14:08 AM CDT
]0;mtalh2@csc570e:~[?1034h[mtalh2@csc570e ~]$ docker-connect-mtalh2
[?2004hroot@csc572-mysql-mtalh2:/# 
[Kroot@csc572-mysql-mtalh2:/# [7mmysql -u root[27mmysql -u root
[?2004l
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 54
Server version: 8.0.34 MySQL Community Server - GPL

Copyright (c) 2000, 2023, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> use mtalh2
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mysql> prompt \d-t1>
PROMPT set to '\d-t1>'
mtalh2-t1>CREATE TABLE accounts (
    -> username VARCHAR(20),
    -> fullname VARCHAR(100),
    -> balance INT
    -> );
ERROR 1050 (42S01): Table 'accounts' already exists
mtalh2-t1>SELECT username, fullname, balance FROM accounts;
+-------------+-----------------+---------+
| username    | fullname        | balance |
+-------------+-----------------+---------+
| mzuckerberg | Mark Zuckerberg |      85 |
| tcook       | Tim Cook        |      66 |
| jdorsey     | Jack Dorsey     |      74 |
| jbezos      | Jeff Bezos      |      90 |
| lellison    | Larry Ellison   |      37 |
| bgates      | Bill Gates      |      89 |
+-------------+-----------------+---------+
6 rows in set (0.00 sec)

mtalh2-t1>BEGIN;
Query OK, 0 rows affected (0.00 sec)

mtalh2-t1>SELECT * FROM accounts;
+-------------+-----------------+---------+
| username    | fullname        | balance |
+-------------+-----------------+---------+
| mzuckerberg | Mark Zuckerberg |      85 |
| tcook       | Tim Cook        |      66 |
| jdorsey     | Jack Dorsey     |      74 |
| jbezos      | Jeff Bezos      |      90 |
| lellison    | Larry Ellison   |      37 |
| bgates      | Bill Gates      |      89 |
+-------------+-----------------+---------+
6 rows in set (0.00 sec)

mtalh2-t1>SELECT * FROM accounts;
+-------------+-----------------+---------+
| username    | fullname        | balance |
+-------------+-----------------+---------+
| mzuckerberg | Mark Zuckerberg |      85 |
| tcook       | Tim Cook        |      66 |
| jdorsey     | Jack Dorsey     |      74 |
| jbezos      | Jeff Bezos      |      90 |
| lellison    | Larry Ellison   |      37 |
| bgates      | Bill Gates      |      89 |
+-------------+-----------------+---------+
6 rows in set (0.00 sec)

mtalh2-t1>COMMIT;
Query OK, 0 rows affected (0.00 sec)

mtalh2-t1>
[11GCOMMIT;
[11GSELECT * FROM accounts;
+-------------+-----------------+---------+
| username    | fullname        | balance |
+-------------+-----------------+---------+
| mzuckerberg | Mark Zuckerberg |      85 |
| tcook       | Tim Cook        |      66 |
| jdorsey     | Jack Dorsey     |      74 |
| jbezos      | Jeff Bezos      |      90 |
| lellison    | Larry Ellison   |      37 |
| bgates      | Bill Gates      |      89 |
| emusk       | Elon Musk       |     199 |
+-------------+-----------------+---------+
7 rows in set (0.01 sec)

mtalh2-t1>BEGIN;
Query OK, 0 rows affected (0.00 sec)

mtalh2-t1>UPDATE accounts SET balance = balance + 5 WHERE usernam e='lellison';
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mtalh2-t1>SELECT * FROM accounts;
+-------------+-----------------+---------+
| username    | fullname        | balance |
+-------------+-----------------+---------+
| mzuckerberg | Mark Zuckerberg |      85 |
| tcook       | Tim Cook        |      66 |
| jdorsey     | Jack Dorsey     |      74 |
| jbezos      | Jeff Bezos      |      90 |
| lellison    | Larry Ellison   |      42 |
| bgates      | Bill Gates      |      89 |
| emusk       | Elon Musk       |     199 |
+-------------+-----------------+---------+
7 rows in set (0.00 sec)

mtalh2-t1>rollback;
Query OK, 0 rows affected (0.01 sec)

mtalh2-t1>SELECT * FROM accounts;
+-------------+-----------------+---------+
| username    | fullname        | balance |
+-------------+-----------------+---------+
| mzuckerberg | Mark Zuckerberg |      85 |
| tcook       | Tim Cook        |      66 |
| jdorsey     | Jack Dorsey     |      74 |
| jbezos      | Jeff Bezos      |      90 |
| lellison    | Larry Ellison   |      37 |
| bgates      | Bill Gates      |      89 |
| emusk       | Elon Musk       |     199 |
+-------------+-----------------+---------+
7 rows in set (0.00 sec)

mtalh2-t1>
[11GSELECT * FROM accounts;
+-------------+-----------------+---------+
| username    | fullname        | balance |
+-------------+-----------------+---------+
| mzuckerberg | Mark Zuckerberg |      85 |
| tcook       | Tim Cook        |      66 |
| jdorsey     | Jack Dorsey     |      74 |
| jbezos      | Jeff Bezos      |      90 |
| lellison    | Larry Ellison   |      27 |
| bgates      | Bill Gates      |      89 |
| emusk       | Elon Musk       |     199 |
+-------------+-----------------+---------+
7 rows in set (0.00 sec)

mtalh2-t1>UPDATE accounts SET balance = balance + 20 WHERE username=' lellison';
ERROR 1205 (HY000): Lock wait timeout exceeded; try restarting transaction
mtalh2-t1>
[11GUPDATE accounts SET balance = balance + 20 WHERE username=' 
lellison';
[A[11GSELECT * FROM accounts;[K
[K[A[34G
+-------------+-----------------+---------+
| username    | fullname        | balance |
+-------------+-----------------+---------+
| mzuckerberg | Mark Zuckerberg |      85 |
| tcook       | Tim Cook        |      66 |
| jdorsey     | Jack Dorsey     |      74 |
| jbezos      | Jeff Bezos      |      90 |
| lellison    | Larry Ellison   |      27 |
| bgates      | Bill Gates      |      89 |
| emusk       | Elon Musk       |     179 |
+-------------+-----------------+---------+
7 rows in set (0.00 sec)

mtalh2-t1>quit
Bye
[?2004hroot@csc572-mysql-mtalh2:/# exit
[?2004l
exit
]0;mtalh2@csc570e:~[mtalh2@csc570e ~]$ exit
exit

Script done on Tue 10 Oct 2023 08:30:05 AM CDT
