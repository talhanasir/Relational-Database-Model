Script started on Tue 10 Oct 2023 06:32:47 AM CDT
]0;mtalh2@csc570e:~[?1034h[mtalh2@csc570e ~]$ docker-connect-mtalh2
[?2004hroot@csc572-mysql-mtalh2:/# 
[Kroot@csc572-mysql-mtalh2:/# [7mmysql -u root[27mmysql -u root
[?2004l
Welcome to the MySQL monitor.  Commands end with ; or \g.
Your MySQL connection id is 55
Server version: 8.0.34 MySQL Community Server - GPL

Copyright (c) 2000, 2023, Oracle and/or its affiliates.

Oracle is a registered trademark of Oracle Corporation and/or its
affiliates. Other names may be trademarks of their respective
owners.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

mysql> prompt \d-t1>1
[19G>[K
[19G2>
PROMPT set to '\d-t2>'
(none)-t2>use databas
[21G[K
[20G[K
[19G[K
[18G[K
[17G[K
[16G[K
[15G[Kmtalh2
Reading table information for completion of table and column names
You can turn off this feature to get a quicker startup with -A

Database changed
mtalh2-t2>BEGIN;
Query OK, 0 rows affected (0.00 sec)

mtalh2-t2>INSERT INTO accounts VALUES ('emusk', 'Elon Musk', 199);
Query OK, 1 row affected (0.00 sec)

mtalh2-t2>SELECT * FROM accounts;
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

mtalh2-t2>COMMIT;
Query OK, 0 rows affected (0.00 sec)

mtalh2-t2>
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

mtalh2-t2>BEGIN;
Query OK, 0 rows affected (0.00 sec)

mtalh2-t2>UPDATE accounts SET balance = balance - 10 WHERE username='lellison';
ERROR 1205 (HY000): Lock wait timeout exceeded; try restarting transaction
mtalh2-t2>SELECT * FROM accounts;
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

mtalh2-t2>UPDATE accounts SET balance = balance - 10 WHERE username='lellison';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mtalh2-t2>SELECT * FROM accounts;
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

mtalh2-t2>
[11GSELECT * FROM accounts;
[11GUPDATE accounts SET balance = balance - 10 WHERE username='lellison';
[11GSELECT * FROM accounts;[K
[11GUPDATE accounts SET balance = balance - 10 WHERE username='lellison';
[11GBEGIN;[K
[11GSELECT * FROM accounts;
[11GCOMMIT;[K
[11GSELECT * FROM accounts;
[11GCOMMIT;[K
Query OK, 0 rows affected (0.01 sec)

mtalh2-t2>
[11GCOMMIT;
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

mtalh2-t2>
[11GSELECT * FROM accounts;
[11GCOMMIT;[K
[11GSELECT * FROM accounts;
[11GUPDATE accounts SET balance = balance - 10 WHERE username='lellison';
[11GSELECT * FROM accounts;[K
[11GUPDATE accounts SET balance = balance - 10 WHERE username='lellison';
[11GBEGIN;[K
[11GSELECT * FROM accounts;
[11GBEGIN;[K
Query OK, 0 rows affected (0.00 sec)

mtalh2-t2>UPDATE accounts SET balance = balance - 20 WHERE username='emusk';
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mtalh2-t2>
[11GUPDATE accounts SET balance = balance - 20 WHERE username='emusk';
[11GBEGIN;[K
[11GSELECT * FROM accounts;
[11GCOMMIT;[K
[11GSELECT * FROM accounts;
[11GCOMMIT;[K
Query OK, 0 rows affected (0.00 sec)

mtalh2-t2>
[11GCOMMIT;
[11GUPDATE accounts SET balance = balance - 20 WHERE username='emusk';
[11GBEGIN;[K
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
| emusk       | Elon Musk       |     179 |
+-------------+-----------------+---------+
7 rows in set (0.00 sec)

mtalh2-t2>quit
Bye
[?2004hroot@csc572-mysql-mtalh2:/# exit
[?2004l
exit
]0;mtalh2@csc570e:~[mtalh2@csc570e ~]$ exit
exit

Script done on Tue 10 Oct 2023 08:30:33 AM CDT
