--Ʈ����
CREATE TABLE deleted���� (
    ���ֹ�ȣ VARCHAR2(40) PRIMARY KEY,
    �����̸� VARCHAR2(40),
    ����ڹ�ȣ NUMBER(30),
    �����ֹε�Ϲ�ȣ VARCHAR2(40),
    �ڵ�����ȣ VARCHAR2(40),
    �����̸��� VARCHAR2(40),
    deletedDate date
);

CREATE TRIGGER trg_deleted����  -- Ʈ���� �̸�
    AFTER DELETE -- ���� �Ŀ� �۵��ϰ� ����
    ON ���� -- Ʈ���Ÿ� ������ ���̺�
    FOR EACH ROW -- �� �ึ�� �����
BEGIN 
	-- :old ���̺��� ������ ������̺� ����
	INSERT INTO deleted����
		VALUES (:old.���ֹ�ȣ, :old.�����̸�, :old.����ڹ�ȣ, :old.�����ֹε�Ϲ�ȣ, :old.�ڵ�����ȣ, :old.�����̸���, SYSDATE() ); 
END ;

--SELECT * FROM ����;
--
--DELETE FROM ���� WHERE �����̸� = '';
--
--SELECT * FROM ����;
--
--SELECT * FROM deleted����;

create index idx_���� ON ����(���ֹ�ȣ, �����̸�, ����ڹ�ȣ, �����ֹε�Ϲ�ȣ, �ڵ�����ȣ, �����̸���); --�ε��� ����

SELECT 'ALTER INDEX '||INDEX_NAME||' REBUILD; 'FROM USER_INDEXES; --�ε��� ������


INSERT INTO ���� VALUES ('M1', '������', '15823684', '874235-8435424', '010-4682-4464', 'whek54@naver.com');
INSERT INTO ���� VALUES ('M2', '������', '84265123', '241598-2165423', '010-8678-7789', 'cngks123@naver.com');
INSERT INTO ���� VALUES ('M3', '������', '12364152', '778641-3312355', '010-3352-7351', 'wlektj33@naver.com');
INSERT INTO ���� VALUES ('M4', '������', '48234461', '984257-2134853', '010-8874-5663', 'kosh5099@naver.com');
INSERT INTO ���� VALUES ('M5', '�迹��', '42565332', '895643-3429766', '010-7632-9952', 'wldkrjt1@naver.com');
INSERT INTO ���� VALUES ('M6', '���ذ�', '42562635', '132468-8724651', '010-2245-8824', 'wlektj77@naver.com');
INSERT INTO ���� VALUES ('M7', '�̽ÿ�', '78945665', '621764-1217531', '010-6645-3321', 'nnmwl186@naver.com');
INSERT INTO ���� VALUES ('M8', '������', '42865946', '175354-4576589', '010-7332-6654', 'wlsdf99@naver.com');
INSERT INTO ���� VALUES ('M9', '������', '72446724', '321975-6523545', '010-9921-2254', 'zdyywe1@naver.com');
INSERT INTO ���� VALUES ('M10', '������', '54466464', '249875-8851344', '010-5882-4553', 'lwkss354@naver.com');

create index �Ϸù�ȣ_�ε��� on ��������� (�Ϸù�ȣ);
create index ����ȣ_�ε��� on �� (����ȣ);

--index ����
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
                 
                 