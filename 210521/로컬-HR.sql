DECLARE
    var1 NUMBER(5) ; -- ���� ����
BEGIN
    var1 := 100; -- ������ �� ����
    IF  var1 = 100 THEN  -- ���� var1�� 100�̶��
        DBMS_OUTPUT.PUT_LINE('100�Դϴ�');
    ELSE
        DBMS_OUTPUT.PUT_LINE('100�� �ƴմϴ�');
    END IF;
END ;

DECLARE
    hireDate DATE ; -- �Ի���
    curDate DATE ; -- ����
    wDays   NUMBER(5) ; -- �ٹ��� �ϼ�
BEGIN
    SELECT hire_date INTO hireDate -- hire_date ���� ����� hireDATE�� ����
       FROM HR.employees
       WHERE employee_id = 200;
    curDate := CURRENT_DATE(); -- ���� ��¥
    wDays :=  curDate - hireDate; -- ��¥�� ����(�� ����)
    IF (wDays/365) >= 5 THEN -- 5���� �����ٸ�
        DBMS_OUTPUT.PUT_LINE('�Ի����� ' || wdays || 
                    '���̳� �������ϴ�. �����մϴ�!');
    ELSE
        DBMS_OUTPUT.PUT_LINE('�Ի����� ' || wdays || 
                    '�Ϲۿ� �ȵǾ��׿�. ������ ���ϼ���.');
    END IF;
END ;