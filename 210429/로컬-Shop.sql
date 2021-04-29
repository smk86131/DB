insert into membertbl values ('figure', '����', '��⵵ ������ ������');

select * from membertbl

update membertbl set memberaddress = '���� ������ ���ﵿ' where membername = '����';

delete from membertbl where membername = '����';

create table deletedmembertbl(
memberid char(8),
membername nchar(5),
memberaddress nvarchar2(20),
deleteddate date
);

create trigger trg_deletedmembertbl
after delete
on membertbl
for each row
begin
insert into deletedmembertbl
values (:old.memberid, :old.membername, :old.memberaddress, sysdate());
end;

delete from membertbl where membername = '������';

select * from deletedmembertbl;
