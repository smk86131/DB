
--index ����
create index �Ϸù�ȣ_�ε��� on ��������� (�Ϸù�ȣ);
create index ����ȣ_�ε��� on �� (����ȣ);

select *
from User_Indexes
where table_name = '��';

--update ��
update ��
set ��ȭ��ȣ '010-4101-5290'
where ���̸� = '��������';

--delete ��
delete from ����
where ���ֹ�ȣ = 'M10';

--�ܼ�����
select ������̸�, ������ּ�
from �����_�̸�����ġ
where ������ּ� like '%����%';

--��������
select ������̸�, AVG(���)
from �����_����, ������̸�����ġ
where �����_����."������ּ�"=�����_�̸�����ġ."������ּ�" AND ������̸� = '�׷���  ������Ƽ��Ż ���� �ĸ�����'
group by ������̸�;

--�μ�����
select ���̸� as MU���ڻ����
from ��
where ����ȣ in (select ����ȣ
                 from ���೻��
                 where �Ϸù�ȣ in (select �Ϸù�ȣ
                                  from �����_����
                                  where ������ּ� in (select ������ּ�
                                                    from �����_�̸�����ġ
                                                    where ������̸� = 'MU����')));

select ���̸� as MU���ڻ����
from ��
where ����ȣ in (select ����ȣ
                 from ���೻��, �����_����, �����_�̸�����ġ
                 where ���೻��.�Ϸù�ȣ= �����_����.�Ϸù�ȣ and �����_����."������ּ�" = �����_�̸�����ġ."������ּ�" and ������̸� = 'MU����');

--��������
select ���̸�, ������ּ�
from ��, ���೻��, �����_����
where ��.����ȣ=���೻��.����ȣ AND ���೻��.�Ϸù�ȣ = �����_����.�Ϸù�ȣ;

--�׷�����
select ������̸�, sum(�氳��)
from �����_����, �����_�̸�����ġ
where �����_����."������ּ�" = �����_�̸�����ġ."������ּ�"
group by ������̸�;

--view����
create view �ѻ��������
as select *
from �����_�̸�����ġ natural join �����_����;

select *
from �ѻ��������;

--������ȸ��
start transaction

insert into ��
values ('C11','���Ѽ�','010-4948-0332','940527-1445667'.'joker@naver.com','joker!@','����� ����� �Ͽ��� 23-63');
select *from ��;

savepoint a;

insert into ���೻�� values('R11','A2-O','C11',",",",");

select *from ���೻��;

rollback to a;

select *from ���೻��;

insert into ���೻��
values('R11','A2-O','C11',TO-DATE('2019-04-26','yyyy-mm-dd'),TO-DATE("2019-04-28','yyyy-mm-dd'), 10,'������ü';

commit;
--------------------------------------
start transaction

inset into ��
values ('C11','���Ѽ�','010-4948-0332','940527-1445667','joker@naver.com','joker!@','����� ����� �Ͽ��� 23-63');
select *from ��;

savepoint a;
---------------------------------------
insert into ���೻�� values('R11','A2-O','C11',",",",");

rollback to a;
--------------------------------------
select *from ���೻��;

insert into ���೻��
values('R11','A2-O','C11', TO_DATE('2019-04-26-,'yyyy-mm-dd'), 10,'������ü');

commit;
                 
                 