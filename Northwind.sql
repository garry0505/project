
create database accenture;
use accenture;
create table student1(id int , name varchar(10) , mob int);
create table student2(id int , address text);
insert into student1 values(1 , "gary", 8879),
(2 , "sid", 9876),
(3 , "vaibhav", 4879),
(4 , "gaurang", 8819),
(5 , "isha", 8873);
insert into student2 values(4, "kalyan"),
(5, "kalwa"),
(6, "dombivali"),
(7, "thane");
select s1.name, s1.mob,s2.address from student1 s1 right join student2 s2 on s1.id=s2.id;
DELIMITER //
create procedure getconditiontable()
begin
select * from student1 where id=4;
END //
CALL getconditiontable;

DELIMITER //
CREATE procedure GETMOB( IN GREATERTHAN INT)
BEGIN 
SELECT NAME, MOB
FROM STUDENT1
WHERE MOB>GREATERTHAN;
END //
CALL GETMOB(2000);

DELIMITER //
CREATE PROCEDURE UPDATEMOBILE( IN E_id int ,IN E_MOB INT )
BEGIN
UPDATE STUDENT1 
SET id=E_ID
WHERE mob=E_MOB;
END //
CALL UPDATEMOBILE(8,"sid");
select * from student1;
DELETE FROM STUDENT1 WHERE id=1;


create table employee1(emp_id int,emp_name varchar(30),sal double,hire_date date,dept_id int,mang_id int);
insert into employee1 values(1,'Komal',30000,'2021-11-17',102,1005),
(2,'Kavita',40000,'2021-11-14',101,1004),
(3,'gary',90000,'2022-10-14',103,1003),
(2,'Kavita',40000,'2021-10-12',104,1002);

DELIMETER //
CREATE PROCEDURE COUNTDEPT( IN id int , out count int)
BEGIN
select count(*) into count
from employee1
where emp_id=id;
END  //

create table employee2(emp_id int,emp_name varchar(30),sal double,hire_date date,dept_id int,mang_id int);
insert into employee2 values(1,'Komal',30000,'2021-11-17',102,1005),
(2,'Kavita',40000,'2021-11-14',101,1004),
(3,'gary',90000,'2022-10-14',103,1003),
(2,'Kavita',40000,'2021-10-12',104,1002);
SELECT * FROM EMPLOYEE2;

DELIMITER //
CREATE PROCEDURE COUNTDEPT4( IN id int , OUT count1 int)
BEGIN
select count(*) INTO count1
from employee2
where emp_id=id;
END  //
DELIMITER ;
CALL COUNTDEPT4(104,@H);
SELECT @H;

DELIMITER //
CREATE FUNCTION GETTOTALEMPLOYEES()
RETURNS INT DETERMINISTIC
BEGIN
 DECLARE TOTAL INT ;
 SELECT COUNT(*) INTO TOTAL FROM employee2;
 RETURN TOTAL;
 END //
 DELIMITER //
 SELECT GETTOTALEMPLOYEES();
 
 DELIMITER //
 CREATE TRIGGER EMPIDCHECK BEFORE INSERT ON employee2 FOR EACH ROW IF NEW.SAL<0
 THEN SET NEW .SAL=0;
 END IF; //
 SELECT * FROM EMPLOYEE2;
 INSERT INTO EMPLOYYE2 VALUES (9,'Komal',-30000,'2021-11-17',102,1005);
 
 DELIMITER //
 CREATE TRIGGER EMPIDCHECK1 BEFORE INSERT ON employee2 FOR EACH ROW IF NEW.emp_id<0
 THEN SET NEW.emp_id=0;
 END IF; //
 INSERT INTO EMPLOYee2 VALUES (-9,'Komal',30000,'2021-11-17',102,1005);
 SELECT * FROM EMPLOYEE2;
 
 
 



















