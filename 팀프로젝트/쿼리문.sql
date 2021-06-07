
--index 생성
create index 일련번호_인덱스 on 사업장정보 (일련번호);
create index 고객번호_인덱스 on 고객 (고객번호);

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
                 
                 