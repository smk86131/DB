
create table cartoon
(
cartoonid varchar2(4 byte) not null primary key,
cartoonname varchar2(30 byte),
cartoondescription varchar2(40 byte)
);

select * from cartoon;
select * from cartoon where cartoonid = 'c001';

