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

SELECT userID, userName, prodName, addr, mobile1 || mobile2 AS "연락처"
   FROM buyTbl
     INNER JOIN userTbl
        ON buyTbl.userID = userTbl.userID ;

SELECT buyTbl.userID, userName, prodName, addr, mobile1 || mobile2 AS "연락처"
   FROM buyTbl
     INNER JOIN userTbl
        ON buyTbl.userID = userTbl.userID ;

SELECT buyTbl.userID, userName, prodName, addr, mobile1 || mobile2 
   FROM buyTbl, userTbl
   WHERE buyTbl.userID = userTbl.userID ;

SELECT buyTbl.userID, userTbl.userName, buyTbl.prodName, userTbl.addr, 
         userTbl.mobile1 || userTbl.mobile2  AS "연락처"
   FROM buyTbl
     INNER JOIN userTbl
        ON buyTbl.userID = userTbl.userID;

SELECT B.userID, U.userName, B.prodName, U.addr, U.mobile1 || U.mobile2  AS "연락처"
   FROM buyTbl B
     INNER JOIN userTbl U
        ON B.userID = U.userID;
        
SELECT B.userID, U.userName, B.prodName, U.addr, U.mobile1 || U.mobile2  AS "연락처"
   FROM buyTbl B
     INNER JOIN userTbl U
        ON B.userID = U.userID
   WHERE B.userID = 'JYP';

SELECT U.userID, U.userName, B.prodName, U.addr, U.mobile1 || U.mobile2  AS "연락처"
   FROM userTbl U
     INNER JOIN buyTbl B
        ON U.userID = B.userID 
   WHERE B.userID = 'JYP';

SELECT U.userID, U.userName, B.prodName, U.addr, U.mobile1 || U.mobile2  AS "연락처"
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
INSERT INTO stdTBL VALUES('김범수','경남');
INSERT INTO stdTBL VALUES('성시경','서울');
INSERT INTO stdTBL VALUES('조용필','경기');
INSERT INTO stdTBL VALUES('은지원','경북');
INSERT INTO stdTBL VALUES('바비킴','서울');
INSERT INTO clubTBL VALUES('수영','101호');
INSERT INTO clubTBL VALUES('바둑','102호');
INSERT INTO clubTBL VALUES('축구','103호');
INSERT INTO clubTBL VALUES('봉사','104호');
INSERT INTO stdclubTBL VALUES(stdclubSEQ.NEXTVAL, '김범수','바둑');
INSERT INTO stdclubTBL VALUES(stdclubSEQ.NEXTVAL,'김범수','축구');
INSERT INTO stdclubTBL VALUES(stdclubSEQ.NEXTVAL,'조용필','축구');
INSERT INTO stdclubTBL VALUES(stdclubSEQ.NEXTVAL,'은지원','축구');
INSERT INTO stdclubTBL VALUES(stdclubSEQ.NEXTVAL,'은지원','봉사');
INSERT INTO stdclubTBL VALUES(stdclubSEQ.NEXTVAL,'바비킴','봉사');

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

SELECT  COUNT(*) AS "데이터 개수"
   FROM HR.employees 
     CROSS JOIN HR.countries;

CREATE TABLE empTbl (emp NCHAR(3), manager NCHAR(3), department NCHAR(3));
INSERT INTO empTbl VALUES('나사장','없음','없음');
INSERT INTO empTbl VALUES('김재무','나사장','재무부');
INSERT INTO empTbl VALUES('김부장','김재무','재무부');
INSERT INTO empTbl VALUES('이부장','김재무','재무부');
INSERT INTO empTbl VALUES('우대리','이부장','재무부');
INSERT INTO empTbl VALUES('지사원','이부장','재무부');
INSERT INTO empTbl VALUES('이영업','나사장','영업부');
INSERT INTO empTbl VALUES('한과장','이영업','영업부');
INSERT INTO empTbl VALUES('최정보','나사장','정보부');
INSERT INTO empTbl VALUES('윤차장','최정보','정보부');
INSERT INTO empTbl VALUES('이주임','윤차장','정보부');

select a.emp as "부하직원", b.emp as "직속상관", b.department as "직속상관부서"
from emptbl a
inner join emptbl b
on a.manager = b.emp
where a.emp = '우대리';

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
dbms_output.put_line('입사한지 ' ||wdays || '일이나 지났습니다. 축하합니다!');
else
dbms_output.put_line('입사한지 ' || wdays || '일밖에 안되었네요. 열심히 하세요.');
end if;
end;

select userid, sum(price*amount) as "총구매액"
from buytbl
group by userid
order by sum(price*amount) desc;

SELECT B.userID, U.userName, SUM(price*amount) AS "총구매액"
   FROM buyTbl B
      INNER JOIN userTbl U
         ON B.userID = U.userID
   GROUP BY B.userID, U.userName
   ORDER BY SUM(price*amount) DESC;
   
select b.userid, u.username, sum(price*amount) as "총구매액"
from buytbl b
right outer join usertbl u
on b.userid = u.userid
group by b.userid, u.username
order by sum(price*amount) desc nulls last;
*/
