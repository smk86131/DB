/*
CREATE TABLE movieTBL 
  (movie_id        NUMBER(4),
   movie_title     NVARCHAR2(30),
   movie_director  NVARCHAR2(20),
   movie_star      NVARCHAR2(20),
   movie_script    CLOB,
   movie_film      BLOB
);

select*from movietbl

select distinct u.userid, u.username, u.addr
from usertbl u
inner join buytbl b
on u.userid = b.userid
order by u.userid;

SELECT * 
   FROM buyTbl
     INNER JOIN userTbl
        ON buyTbl.userID = userTbl.userID
   WHERE buyTbl.userID = 'JYP';

SELECT * 
   FROM buyTbl
     INNER JOIN userTbl
        ON buyTbl.userID = userTbl.userID;

SELECT userID, userName, prodName, addr, mobile1 || mobile2 AS "����ó"
   FROM buyTbl
     INNER JOIN userTbl
        ON buyTbl.userID = userTbl.userID ;

SELECT buyTbl.userID, userName, prodName, addr, mobile1 || mobile2 AS "����ó"
   FROM buyTbl
     INNER JOIN userTbl
        ON buyTbl.userID = userTbl.userID ;

SELECT buyTbl.userID, userName, prodName, addr, mobile1 || mobile2 
   FROM buyTbl, userTbl
   WHERE buyTbl.userID = userTbl.userID ;

SELECT buyTbl.userID, userTbl.userName, buyTbl.prodName, userTbl.addr, 
         userTbl.mobile1 || userTbl.mobile2  AS "����ó"
   FROM buyTbl
     INNER JOIN userTbl
        ON buyTbl.userID = userTbl.userID;

SELECT B.userID, U.userName, B.prodName, U.addr, U.mobile1 || U.mobile2  AS "����ó"
   FROM buyTbl B
     INNER JOIN userTbl U
        ON B.userID = U.userID;
        
SELECT B.userID, U.userName, B.prodName, U.addr, U.mobile1 || U.mobile2  AS "����ó"
   FROM buyTbl B
     INNER JOIN userTbl U
        ON B.userID = U.userID
   WHERE B.userID = 'JYP';

SELECT U.userID, U.userName, B.prodName, U.addr, U.mobile1 || U.mobile2  AS "����ó"
   FROM userTbl U
     INNER JOIN buyTbl B
        ON U.userID = B.userID 
   WHERE B.userID = 'JYP';

SELECT U.userID, U.userName, B.prodName, U.addr, U.mobile1 || U.mobile2  AS "����ó"
   FROM userTbl U
     INNER JOIN buyTbl B
        ON U.userID = B.userID 
   ORDER BY U.userID;

SELECT DISTINCT U.userID, U.userName,  U.addr
   FROM userTbl U
     INNER JOIN buyTbl B
        ON U.userID = B.userID 
   ORDER BY U.userID ;

SELECT U.userID, U.userName,  U.addr
   FROM userTbl U
   WHERE EXISTS (
      SELECT * 
      FROM buyTbl B
      WHERE U.userID = B.userID );

CREATE TABLE stdTBL 
( stdName   NCHAR(5) NOT NULL PRIMARY KEY,
  addr	    NCHAR(2) NOT NULL
);
CREATE TABLE clubTBL 
( clubName    NCHAR(5) NOT NULL PRIMARY KEY,
  roomNo      NCHAR(4) NOT NULL
);
CREATE SEQUENCE stdclubSEQ;
CREATE TABLE stdclubTBL
(  idNum    NUMBER(5) NOT NULL PRIMARY KEY, 
   stdName  NCHAR(5) NOT NULL,
   clubName NCHAR(5) NOT NULL,
FOREIGN KEY(stdName) REFERENCES stdTBL(stdName),
FOREIGN KEY(clubName) REFERENCES clubTBL(clubName)
);
INSERT INTO stdTBL VALUES('�����','�泲');
INSERT INTO stdTBL VALUES('���ð�','����');
INSERT INTO stdTBL VALUES('������','���');
INSERT INTO stdTBL VALUES('������','���');
INSERT INTO stdTBL VALUES('�ٺ�Ŵ','����');
INSERT INTO clubTBL VALUES('����','101ȣ');
INSERT INTO clubTBL VALUES('�ٵ�','102ȣ');
INSERT INTO clubTBL VALUES('�౸','103ȣ');
INSERT INTO clubTBL VALUES('����','104ȣ');
INSERT INTO stdclubTBL VALUES(stdclubSEQ.NEXTVAL, '�����','�ٵ�');
INSERT INTO stdclubTBL VALUES(stdclubSEQ.NEXTVAL,'�����','�౸');
INSERT INTO stdclubTBL VALUES(stdclubSEQ.NEXTVAL,'������','�౸');
INSERT INTO stdclubTBL VALUES(stdclubSEQ.NEXTVAL,'������','�౸');
INSERT INTO stdclubTBL VALUES(stdclubSEQ.NEXTVAL,'������','����');
INSERT INTO stdclubTBL VALUES(stdclubSEQ.NEXTVAL,'�ٺ�Ŵ','����');

SELECT S.stdName, S.addr, C.clubName, C.roomNo
   FROM stdTBL S 
      INNER JOIN stdclubTBL SC
           ON S.stdName = SC.stdName
      INNER JOIN clubTBL C
	  ON SC.clubName = C.clubName 
   ORDER BY S.stdName;

SELECT C.clubName, C.roomNo, S.stdName, S.addr
   FROM  stdTBL S
      INNER JOIN stdclubTBL SC
           ON SC.stdName = S.stdName
      INNER JOIN clubTBL C
	 ON SC.clubName = C.clubName
    ORDER BY C.clubName;

SELECT * 
   FROM buyTbl 
     CROSS JOIN userTbl;

SELECT * 
   FROM buyTbl , userTbl ;

SELECT  COUNT(*) AS "������ ����"
   FROM HR.employees 
     CROSS JOIN HR.countries;

CREATE TABLE empTbl (emp NCHAR(3), manager NCHAR(3), department NCHAR(3));
INSERT INTO empTbl VALUES('������','����','����');
INSERT INTO empTbl VALUES('���繫','������','�繫��');
INSERT INTO empTbl VALUES('�����','���繫','�繫��');
INSERT INTO empTbl VALUES('�̺���','���繫','�繫��');
INSERT INTO empTbl VALUES('��븮','�̺���','�繫��');
INSERT INTO empTbl VALUES('�����','�̺���','�繫��');
INSERT INTO empTbl VALUES('�̿���','������','������');
INSERT INTO empTbl VALUES('�Ѱ���','�̿���','������');
INSERT INTO empTbl VALUES('������','������','������');
INSERT INTO empTbl VALUES('������','������','������');
INSERT INTO empTbl VALUES('������','������','������');

select a.emp as "��������", b.emp as "���ӻ��", b.department as "���ӻ���μ�"
from emptbl a
inner join emptbl b
on a.manager = b.emp
where a.emp = '��븮';

select stdname, addr from stdtbl
union all
select clubname, roomno from clubtbl;

declare
hiredate date;
curdate date;
wdays number(5);
begin
select hire_date into hiredate
from hr.employees
where employee_id = 200;
curdate := current_date();
wdays := curdate - hiredate;
if (wdays/365) >= 5 then
dbms_output.put_line('�Ի����� ' ||wdays || '���̳� �������ϴ�. �����մϴ�!');
else
dbms_output.put_line('�Ի����� ' || wdays || '�Ϲۿ� �ȵǾ��׿�. ������ �ϼ���.');
end if;
end;

select userid, sum(price*amount) as "�ѱ��ž�"
from buytbl
group by userid
order by sum(price*amount) desc;

SELECT B.userID, U.userName, SUM(price*amount) AS "�ѱ��ž�"
   FROM buyTbl B
      INNER JOIN userTbl U
         ON B.userID = U.userID
   GROUP BY B.userID, U.userName
   ORDER BY SUM(price*amount) DESC;
   
select b.userid, u.username, sum(price*amount) as "�ѱ��ž�"
from buytbl b
right outer join usertbl u
on b.userid = u.userid
group by b.userid, u.username
order by sum(price*amount) desc nulls last;
*/
