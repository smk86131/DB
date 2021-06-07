--트리거
CREATE TABLE deleted업주 (
    업주번호 VARCHAR2(40) PRIMARY KEY,
    업주이름 VARCHAR2(40),
    사업자번호 NUMBER(30),
    업주주민등록번호 VARCHAR2(40),
    핸드폰번호 VARCHAR2(40),
    업주이메일 VARCHAR2(40),
    deletedDate date
);

CREATE TRIGGER trg_deleted업주  -- 트리거 이름
    AFTER DELETE -- 삭제 후에 작동하게 지정
    ON 업주 -- 트리거를 부착할 테이블
    FOR EACH ROW -- 각 행마다 적용됨
BEGIN 
	-- :old 테이블의 내용을 백업테이블에 삽입
	INSERT INTO deleted업주
		VALUES (:old.업주번호, :old.업주이름, :old.사업자번호, :old.업주주민등록번호, :old.핸드폰번호, :old.업주이메일, SYSDATE() ); 
END ;

--SELECT * FROM 업주;
--
--DELETE FROM 업주 WHERE 업주이름 = '';
--
--SELECT * FROM 업주;
--
--SELECT * FROM deleted업주;

create index idx_업주 ON 업주(업주번호, 업주이름, 사업자번호, 업주주민등록번호, 핸드폰번호, 업주이메일); --인덱스 생성

SELECT 'ALTER INDEX '||INDEX_NAME||' REBUILD; 'FROM USER_INDEXES; --인덱스 리빌드


INSERT INTO 업주 VALUES ('M1', '진예인', '15823684', '874235-8435424', '010-4682-4464', 'whek54@naver.com');
INSERT INTO 업주 VALUES ('M2', '나유진', '84265123', '241598-2165423', '010-8678-7789', 'cngks123@naver.com');
INSERT INTO 업주 VALUES ('M3', '김유진', '12364152', '778641-3312355', '010-3352-7351', 'wlektj33@naver.com');
INSERT INTO 업주 VALUES ('M4', '정찬영', '48234461', '984257-2134853', '010-8874-5663', 'kosh5099@naver.com');
INSERT INTO 업주 VALUES ('M5', '김예원', '42565332', '895643-3429766', '010-7632-9952', 'wldkrjt1@naver.com');
INSERT INTO 업주 VALUES ('M6', '정준경', '42562635', '132468-8724651', '010-2245-8824', 'wlektj77@naver.com');
INSERT INTO 업주 VALUES ('M7', '이시연', '78945665', '621764-1217531', '010-6645-3321', 'nnmwl186@naver.com');
INSERT INTO 업주 VALUES ('M8', '이지은', '42865946', '175354-4576589', '010-7332-6654', 'wlsdf99@naver.com');
INSERT INTO 업주 VALUES ('M9', '정재헌', '72446724', '321975-6523545', '010-9921-2254', 'zdyywe1@naver.com');
INSERT INTO 업주 VALUES ('M10', '김혜민', '54466464', '249875-8851344', '010-5882-4553', 'lwkss354@naver.com');

create index 일련번호_인덱스 on 사업장정보 (일련번호);
create index 고객번호_인덱스 on 고객 (고객번호);

--index 생성
select *
from User_Indexes
where table_name = '고객';

--update 문
update 고객
set 전화번호 '010-4101-5290'
where 고객이름 = '선우은미';

--delete 문
delete from 업주
where 업주번호 = 'M10';

--단순질의
select 사업장이름, 사업장주소
from 사업장_이름과위치
where 사업장주소 like '%대전%';

--집계질의
select 사업장이름, AVG(요금)
from 사업장_정보, 사업장이름과위치
where 사업장_정보."사업장주소"=사업장_이름과위치."사업장주소" AND 사업장이름 = '그랜드  인터컨티넨탈 서울 파르나스'
group by 사업장이름;

--부속질의
select 고객이름 as MU모텔사용자
from 고객
where 고객번호 in (select 고객번호
                 from 예약내역
                 where 일련번호 in (select 일련번호
                                  from 사업장_정보
                                  where 사업장주소 in (select 사업장주소
                                                    from 사업장_이름과위치
                                                    where 사업장이름 = 'MU모텔')));

select 고객이름 as MU모텔사용자
from 고객
where 고객번호 in (select 고객번호
                 from 예약내역, 사업장_정보, 사업장_이름과위치
                 where 예약내역.일련번호= 사업장_정보.일련번호 and 사업장_정보."사업장주소" = 사업장_이름과위치."사업장주소" and 사업장이름 = 'MU모텔');

--조인질의
select 고객이름, 사업장주소
from 고객, 예약내역, 사업장_정보
where 고객.고객번호=예약내역.고객번호 AND 예약내역.일련번호 = 사업장_정보.일련번호;

--그룹질의
select 사업장이름, sum(방개수)
from 사업장_정보, 사업장_이름과위치
where 사업장_정보."사업장주소" = 사업장_이름과위치."사업장주소"
group by 사업장이름;

--view생성
create view 총사업장정보
as select *
from 사업장_이름과위치 natural join 사업장_정보;

select *
from 총사업장정보;

--데이터회복
start transaction

insert into 고객
values ('C11','노한수','010-4948-0332','940527-1445667'.'joker@naver.com','joker!@','서울시 노원구 일원로 23-63');
select *from 고객;

savepoint a;

insert into 예약내역 values('R11','A2-O','C11',",",",");

select *from 예약내역;

rollback to a;

select *from 예약내역;

insert into 예약내역
values('R11','A2-O','C11',TO-DATE('2019-04-26','yyyy-mm-dd'),TO-DATE("2019-04-28','yyyy-mm-dd'), 10,'계좌이체';

commit;
--------------------------------------
start transaction

inset into 고객
values ('C11','노한수','010-4948-0332','940527-1445667','joker@naver.com','joker!@','서울시 노원구 일원로 23-63');
select *from 고객;

savepoint a;
---------------------------------------
insert into 예약내역 values('R11','A2-O','C11',",",",");

rollback to a;
--------------------------------------
select *from 예약내역;

insert into 예약내역
values('R11','A2-O','C11', TO_DATE('2019-04-26-,'yyyy-mm-dd'), 10,'계좌이체');

commit;
                 
                 