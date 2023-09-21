/* 
    <PROCEDURE>
    PL/SQL������ "����"�ؼ� �̿��ϰ� �ϴ� ��ü
    �ʿ��ҋ����� ���� �ۼ��� PL/SQL���� ���ϰ� ȣ�� �����ϴ�.
    [ǥ����]
    CREATE [OR REPLACE] PROCEDURE ���ν�����[(�Ű�����)]
    IS
    BEGIN
        ����κ�
    END;
    
    *���ν��� ������*
    EXEC ���ν�����;
*/
-- EMPLOYEE���̺��� ������ COPY���̺� ����
CREATE TABLE PRO_TEST
AS SELECT * FROM EMPLOYEE;

SELECT * FROM PRO_TEST;

-- ���ν��� �����ϱ�
CREATE PROCEDURE DEL_DATA
IS
BEGIN
    DELETE FROM PRO_TEST;
    COMMIT;
END;
/

-- ������ ���ν��� ��ȸ
SELECT * FROM USER_PROCEDURES;

-- ���ν��� ����
EXEC DEL_DATA;

SELECT * FROM PRO_TEST;

-- �Ű����� �ִ� ���ν��� �����
-- IN  : ���ν��� ����� �ʿ��� ���� �޴� ����(�Ϲ����� �Ű������� ������ ����)
-- OUT : ȣ���Ѱ����� �ǵ����ִ� ����(�����)
CREATE OR REPLACE PROCEDURE PRO_SELECT_EMP(
                                            V_EMP_ID IN EMPLOYEE.EMP_ID%TYPE,
                                            V_EMP_NAME OUT EMPLOYEE.EMP_NAME%TYPE,
                                            V_SALARY OUT EMPLOYEE.SALARY%TYPE,
                                            V_BONUS OUT EMPLOYEE.BONUS%TYPE)
IS
BEGIN
    SELECT EMP_NAME, SALARY , BONUS
      INTO V_EMP_NAME, V_SALARY, V_BONUS
      FROM EMPLOYEE
    WHERE EMP_ID = V_EMP_ID;    
END;
/

--�Ű������� �ִ� ���ν��� �����ϱ�
VAR EMP_NAME VARCHAR2(20);
VAR SALARY NUMBER;
VAR BONUS NUMBER;

EXEC PRO_SELECT_EMP(201, :EMP_NAME , :SALARY , :BONUS);

PRINT EMP_NAME;
PRINT SALARY;
PRINT BONUS;

/* 
    ���ν����� ����
    1. ó���ӵ��� ����
    2. ��뷮 �ڷ�ó���� ������.
    EX) DB���� ��뷮�� �����͸� SELECT������ �޾ƿͼ� �ڹٿ��� ó���ϴ� CASE 
                                  VS 
        DB���� ��뷮�� �����͸� SELECT�� �� �ڹٷ� �ѱ��� �ʰ� ����ó���ϴ� CASE
        
        DB���� ó���ϴ°� ������ ����(�����͸� �ѱ涧���� �ڿ��� �Һ��)
    
    ���ν��� ����
    1. DB�ڿ��� ���� ����ϱ⶧���� DB�� ���ϸ� �ְԵ�
    2. ������ ���鿡�� �ڹټҽ��ڵ�, ����Ŭ �ҽ��ڵ� �ΰ��� ���ÿ� �����ϱ� ��ƴ�.
    
    ����)
    �ѹ��� ó���Ǵ� �����ͷ��� ����, ������ �䱸�ϴ� ó���� ��ü�� �ڹٺ��� DB�󿡼� ó���ϴ°��� �������鿡�� �������̰�    
    �ҽ�����(��������)���鿡���� �ڹٿ��� �۾��ϴ°� �� ����.    
*/
--------------------------------------------------------------------------------------------
/*
    <FUNCTION>
    ���ν����� ���� ���������� ���� ����� ��ȯ������ ����.
    
    FUNCTION �������
    [ǥ����]
    CREATE [OR REPLACE] FUNCTION ��Ǹ�[(�Ű�����)]
    RETURN �ڷ���
    IS
    BEGIN
        ����κ�
    END;
    
    ����̸�(�μ�)    
*/
CREATE OR REPLACE FUNCTION MYFUNC(V_STR VARCHAR2)
RETURN VARCHAR2
IS
    RESULT VARCHAR2(1000);
BEGIN
    DBMS_OUTPUT.PUT_LINE(V_STR);
    RESULT := '*'|| V_STR || '*';    
    RETURN RESULT;
END;
/

SELECT MYFUNC('�ΰ��') FROM DUAL;

-- EMP_ID�� ���޹޾Ƽ� ����(���ʽ� ���Կ���)�� ����ؼ� ������ִ� �Լ� �����.
-- CALC_SALARY
CREATE OR REPLACE FUNCTION CALC_SALARY(V_EMP_ID EMPLOYEE.EMP_ID%TYPE)
RETURN NUMBER
IS
    RESULT NUMBER;
    E EMPLOYEE%ROWTYPE;
BEGIN
    SELECT *
      INTO E
    FROM EMPLOYEE
    WHERE EMP_ID = V_EMP_ID;    
    RESULT := (E.SALARY + E.SALARY * NVL(E.BONUS,0)) * 12 ;    
    RETURN RESULT;
END;
/

SELECT EMP_ID , CALC_SALARY(EMP_ID)
FROM EMPLOYEE;












