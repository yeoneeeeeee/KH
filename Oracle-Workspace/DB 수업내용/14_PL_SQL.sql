/* 
    <PL/SQL>
    PROCEDURE LANGUAGE EXTENSION TO SQL
    
    ����Ŭ��ü�� ����Ǿ��ִ� ������ ���
    SQL���� ������ ������ ����, ����ó��(IF), �ݺ�ó��(LOOP,FOR,WHILE), ����ó������ �����Ͽ�
    SQL�� ������ ����.
    �ټ��� SQL���� �ѹ��� ���డ��(BLOCK����)
    
    * PL/SQL����
    - [����� (DECLARE SECTION)] : DECLARE�� ����, ������ ����� ���� �� �ʱ�ȭ�ϴ� �κ�
    - ����� (EXECUTABLE SECTION) : BEGIN���� ���� END�γ�, SQL��(SELECT,UPDATE,DELETE..) �Ǵ� ���(���ǹ�,�ݺ���)
    ���� ������ ����ϴ� �κ� 
    - [����ó���� (EXCEPTION SECTION)] : EXCEPTION�� ����, ���ܹ߻��� �ذ��ϱ� ���� ������ �̸� ����صѼ� �ִ� �κ�.
*/

-- ���� �ƿ�ǲ �ɼ� ���ֱ�
SET SERVEROUTPUT ON;

BEGIN
    DBMS_OUTPUT.PUT_LINE('HELLO_ORACLE');
END;
/

/*
    1. DECLARE �����
        ���� �� ��� �����ϴ� ����(����� ���ÿ� �ʱ�ȭ�� ����)
        �Ϲ�Ÿ�� ����, ���۷��� ����, ROWŸ�� ����
        
        1_1) �Ϲ�Ÿ�� ���� ���� �� �ʱ�ȭ
        [ǥ����]
        ������ [CONSTANT] �ڷ��� [:=��];
*/

DECLARE
    EID NUMBER;
    ENAME VARCHAR2(20);
    PI CONSTANT NUMBER := 3.14;
BEGIN
    --EID := 800;
    EID := &��ȣ;
    -- ���� ���� �Է�
    
    --ENAME := '�ΰ��';
    ENAME := &�̸�;
    
    DBMS_OUTPUT.PUT_LINE('EID : ' || EID);
    DBMS_OUTPUT.PUT_LINE('ENAME : ' || ENAME);
    DBMS_OUTPUT.PUT_LINE('PI : ' || PI);
END;
/ 
-- �̰� �־�� �������� ���صǾ ���� PL�� ���� ������.
-- 1_2) ���۷��� Ÿ�� ���� ���� �� �ʱ�ȭ(����̺��� �Į���� ������Ÿ���� �����ؼ� �� Ÿ������ ����)
-- [ǥ����]
-- ������ ���̺��.�÷���%TYPE;
DECLARE
    EID EMPLOYEE.EMP_ID%TYPE;
    ENAME EMPLOYEE.EMP_NAME%TYPE;
    SAL EMPLOYEE.SALARY%TYPE;
BEGIN
    EID := '300';
    ENAME := '�ΰ��';
    SAL := 3000000;
    
    -- ����� 200���� �� ����� ���, �����, ������ �����غ���
    SELECT
        EMP_ID ,EMP_NAME, SALARY
        INTO EID, ENAME, SAL
    FROM EMPLOYEE
    -- WHERE EMP_ID = 200;
    WHERE EMP_ID = &���;    
    
    DBMS_OUTPUT.PUT_LINE('EID : ' || EID);
    DBMS_OUTPUT.PUT_LINE('ENAME : ' || ENAME);
    DBMS_OUTPUT.PUT_LINE('SAL : ' || SAL);
END;
/
------------------------------------- �ǽ�����----------------------------------------------------
/* 
    ���۷��� Ÿ�� ������ EID, ENAME, JCODE, SAL, DTITLE�������ϰ�
    �� �ڷ��� EMPLOYEE(EMP_ID, EMP_NAME, JOB_CODE, SALARY)
             DEPARTMENT(DEPT_TITLE)���� �����ϵ���
             
    ����ڰ� �Է��� ����� ����� ���, �����, �����ڵ�, �޿�, �μ��� ��ȸ�� ������ ��Ƽ� ���    
*/
DECLARE
    EID EMPLOYEE.EMP_ID%TYPE;
    ENAME EMPLOYEE.EMP_NAME%TYPE;
    JCODE EMPLOYEE.JOB_CODE%TYPE;
    SAL EMPLOYEE.SALARY%TYPE;
    DTITLE DEPARTMENT.DEPT_TITLE%TYPE;
BEGIN
    
    SELECT EMP_ID, EMP_NAME, JOB_CODE, SALARY, DEPT_TITLE
      INTO EID, ENAME, JCODE, SAL, DTITLE
      FROM EMPLOYEE
      JOIN DEPARTMENT ON DEPT_CODE = DEPT_ID
    WHERE EMP_ID = &���;    
    DBMS_OUTPUT.PUT_LINE(EID || ', ' || ENAME || ', ' || JCODE || ', ' || SAL || ', ' || DTITLE);    
END;
/
----------------------------------------------------------------------------------
--1-3) ROWŸ�� ���� ����
--     ���̺��� �� �࿡ ���� ��� Į������ �Ѳ����� ������ �ִ� ����
--     [ǥ����] ������ ���̺��%ROWTYPE
DECLARE
    E EMPLOYEE%ROWTYPE;
BEGIN
    SELECT *
      INTO E
      FROM EMPLOYEE
    WHERE EMP_ID = &���;
    
    DBMS_OUTPUT.PUT_LINE('����� : ' || E.EMP_NAME);
    DBMS_OUTPUT.PUT_LINE('�޿�   : ' || E.SALARY);
    DBMS_OUTPUT.PUT_LINE('���ʽ�  : ' || NVL(E.BONUS,0));

END;
/
-----------------------------------------------------------
-- 2. BEGIN �����

-- <���ǹ�>

-- 1) IF ���ǽ� THEN ���೻�� END IF;
-- ��� �Է¹��� �� �ش� ����� ���, �̸�, �޿�, ���ʽ����� ���
-- ��, ���ʽ��� ���� �ʴ� ����� ���ʽ��� ����� '���ʽ������޹��� �ʴ� ����Դϴ�' ���
DECLARE
    EID EMPLOYEE.EMP_ID%TYPE;
    ENAME EMPLOYEE.EMP_NAME%TYPE;
    SALARY EMPLOYEE.SALARY%TYPE;
    BONUS EMPLOYEE.BONUS%TYPE;
BEGIN

    SELECT EMP_ID , EMP_NAME , SALARY , NVL(BONUS,0)
      INTO EID , ENAME, SALARY, BONUS
    FROM EMPLOYEE
    WHERE EMP_ID = &���;
    
    DBMS_OUTPUT.PUT_LINE('��� : ' || EID);
    DBMS_OUTPUT.PUT_LINE('�̸� : ' || ENAME);
    DBMS_OUTPUT.PUT_LINE('�޿� : ' || SALARY);
    
    IF BONUS = 0
       THEN DBMS_OUTPUT.PUT_LINE('���ʽ��� ���޹��� �ʴ� ����Դϴ�.');
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('���ʽ� : ' || BONUS*100 || '%');    
END;
/

-- 2) IF ���ǽ� THEN ���೻�� ELSE ���೻�� END IF;
DECLARE
    EID EMPLOYEE.EMP_ID%TYPE;
    ENAME EMPLOYEE.EMP_NAME%TYPE;
    SALARY EMPLOYEE.SALARY%TYPE;
    BONUS EMPLOYEE.BONUS%TYPE;
BEGIN

    SELECT EMP_ID , EMP_NAME , SALARY , NVL(BONUS,0)
      INTO EID , ENAME, SALARY, BONUS
    FROM EMPLOYEE
    WHERE EMP_ID = &���;
    
    DBMS_OUTPUT.PUT_LINE('��� : ' || EID);
    DBMS_OUTPUT.PUT_LINE('�̸� : ' || ENAME);
    DBMS_OUTPUT.PUT_LINE('�޿� : ' || SALARY);
    
    IF BONUS = 0
       THEN DBMS_OUTPUT.PUT_LINE('���ʽ��� ���޹��� �ʴ� ����Դϴ�.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('���ʽ� : ' || BONUS*100 || '%');    
    END IF;
END;
/
-----------------------------�ǽ�����--------------------------------------------
DECLARE
    -- ���۷���Ÿ�Ժ��� (EID, ENAME, DTITLE,NCODE) 
    EID EMPLOYEE.EMP_ID%TYPE;
    ENAME EMPLOYEE.EMP_NAME%TYPE;
    DTITLE DEPARTMENT.DEPT_TITLE%TYPE;
    NCODE KH.NATIONAL.NATIONAL_CODE%TYPE;
    TEAM VARCHAR2(10);
    --   ������ �÷�   (EMP_ID, EMP_NAME, DEPT_TITLE, NATIONAL_CODE)
    -- �Ϲ�Ÿ�� ���� TEAM ���ڿ� : ������, �ؿ���
BEGIN
    -- ����ڰ� �Է��� ����� ����� ���, �̸�, �μ���, �ٹ������ڵ� ��ȸ�� �� ������ ����
    SELECT EMP_ID, EMP_NAME, DEPT_TITLE, NATIONAL_CODE
      INTO EID, ENAME, DTITLE, NCODE
    FROM EMPLOYEE
    JOIN DEPARTMENT ON DEPT_CODE = DEPT_ID 
    JOIN LOCATION ON LOCATION_ID = LOCAL_CODE
    JOIN NATIONAL USING(NATIONAL_CODE)
    WHERE EMP_ID = &���;
    -- NCODE�� ���� KO�� ��� TEAM������ �ѱ��� ����
    IF NCODE = 'KO'
       THEN TEAM := '�ѱ���';
    ELSE 
        TEAM := '�ؿ���';
    END IF;
    -- �װ� �ƴҰ�� TEAM�� �ؿ��� ����    
    -- ���, �̸�, �μ�, �Ҽ�(TEAM)�� ���
    DBMS_OUTPUT.PUT_LINE('��� : ' || EID);
    DBMS_OUTPUT.PUT_LINE('�̸� : ' || ENAME);
    DBMS_OUTPUT.PUT_LINE('�μ� : ' || DTITLE);
    DBMS_OUTPUT.PUT_LINE('�Ҽ� : ' || TEAM);
END;
/
-- 3) IF ���ǽ� 1 THEN ���೻�� ELSIF ���ǽ�2 THEN ���೻��2 [ELSE ���೻�� N] END IF;
-- �޿��� 500���� �̻��̸� ���
-- �޿��� 300���� �̻��̸� �߱�
-- �� �� �ʱ�
-- ��¹� : �ش� ����� �޿������ XX�Դϴ�.
DECLARE
    SAL EMPLOYEE.SALARY%TYPE;
    GRADE VARCHAR2(10);
BEGIN
    SELECT SALARY
      INTO SAL
    FROM EMPLOYEE
    WHERE EMP_ID = &���;
    
    IF SAL >= 5000000 THEN GRADE := '���';
    ELSIF SAL >= 3000000 THEN GRADE := '�߱�';
    ELSE GRADE := '�ʱ�';
    END IF;

    DBMS_OUTPUT.PUT_LINE('�ش����� �޿������ ' || GRADE || '�Դϴ�.');
END;
/
-- 4) CASE �񱳴���� WHEN ����񱳰�1 THEN �����1 WHEN �񱳰�2 THEN �����2 ELSE �����3 END;
DECLARE
    EMP EMPLOYEE%ROWTYPE;
    DNAME VARCHAR2(10);
BEGIN
    SELECT *
      INTO EMP
    FROM EMPLOYEE
    WHERE EMP_ID = &���;
    
    DNAME := CASE EMP.DEPT_CODE
               WHEN 'D1' THEN '�λ���'
               WHEN 'D2' THEN 'ȸ����'
               WHEN 'D3' THEN '��������'
               WHEN 'D4' THEN '����������'
               WHEN 'D9' THEN '�ѹ���'
               ELSE '�ؿ���'
              END;
    DBMS_OUTPUT.PUT_LINE(EMP.EMP_NAME || '�� ' || DNAME || '�Դϴ�.');
END;
/
---------------------------------------------------------------------------------------
-- �ݺ���
/* 
    1) BASIC LOOP��
    [ǥ����]
    LOOP
        �ݺ������� ������ ����;
        
        * �ݺ����� ���������� �ִ� ����
    END LOOP;
    
    * �ݺ����� ���������� �ִ� ����
    1) IF ���ǽ� THEN EXIT; END IF;
    2) EXIT WHEN ���ǽ�;
*/
-- 1~5���� ���������� 1�� �����ϴ� ���� ���
DECLARE
    I NUMBER := 1;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE(I);
        I := I +1;
        
        -- IF I = 6 THEN EXIT; END IF;
        EXIT WHEN I = 6;
    END LOOP;
END;
/
/* 
    2) FOR LOOP��
    FOR ���� IN [REVERSE] �ʱⰪ .. ������
    LOOP
        �ݺ������� ������ ����;
    END LOOP;
*/
BEGIN
    FOR I IN 10..15
    LOOP
        DBMS_OUTPUT.PUT_LINE(I);
    END LOOP;
END;
/

DROP TABLE TEST;

CREATE TABLE TEST(
    TNO NUMBER PRIMARY KEY,
    TDATE DATE
);

CREATE SEQUENCE SEQ_TNO
INCREMENT BY 2
MAXVALUE 10000;

BEGIN    
    FOR I IN 1..1000
    LOOP
        INSERT INTO TEST VALUES(SEQ_TNO.NEXTVAL , SYSDATE);
    END LOOP;    
END;
/

SELECT * FROM TEST;

-- 3) WHILE LOOP��
/* 
    [ǥ����]
    WHILE �ݺ����� ����� ����
    LOOP
        �ݺ������� �����ų ����
    END LOOP;    
*/
DECLARE 
    I NUMBER := 1;
BEGIN
    WHILE I<6
    LOOP
        DBMS_OUTPUT.PUT_LINE(I);
        I := I + 1;
    END LOOP;    
END;
/
--- �ǽ����� -----
-- LOOP���� Ȱ���Ͽ� ������ ¦���� ���
-- 1-1) FOR LOOP�� Ȱ��
DECLARE
    RESULT NUMBER;
BEGIN    
    FOR DAN IN 2..9
    LOOP
        IF MOD(DAN ,2) = 0 -- 2�γ��������� 0�̶�� == ¦�� dan%2 == 0
            THEN
                FOR SU IN 1..9
                LOOP
                    RESULT := DAN * SU;
                    DBMS_OUTPUT.PUT_LINE(DAN || ' * ' || SU || ' = ' || RESULT);
                END LOOP;
        END IF;        
    END LOOP;    
END;
/
-- 1-2) WHILE LOOP�� Ȱ��
DECLARE
    RESULT NUMBER;
    DAN NUMBER := 2;
    SU NUMBER := 1;
BEGIN
    WHILE DAN <= 9
    LOOP  
        SU := 1;
        WHILE SU <= 9
        LOOP 
            RESULT := SU*DAN;
            DBMS_OUTPUT.PUT_LINE(DAN || ' * ' || SU || ' = ' || RESULT);
            SU := SU+1;
        END LOOP;
        DAN := DAN+2;
    END LOOP;
END;
/

-- 4) ����ó����
/* 
    ����(EXCEPTION) : ������ �߻��ϴ� ����
    
    [ǥ����]
    EXCEPTION 
        WHEN ���ܸ�1 THEN ����ó������;
        WHEN ���ܸ�2 THEN ����ó������;
        ...
        WHEN OTHERS THEN ����ó������;
        
        * �ý��ۿ���(����Ŭ���� �̸� �����ص� ����)
        - NO_DATA_FOUND : SELECT �� ����� �� �൵ ���� ���
        - TOO_MANY_ROWS : SELECT �� ����� ���� ���� ���
        - ZERO_DIVIDE   : 0���� ������ �߻��ϴ� ����
        - DUP_VAL_ON_INDEX : UNIQUE �������ǿ� ����Ǿ�����
        ...
*/
-- ����ڰ� �Է��� ���� ������ ������ ��� ���
DECLARE
    RESULT NUMBER;
BEGIN
    RESULT := 10 / &����;
    DBMS_OUTPUT.PUT_LINE('��� : ' || RESULT);
EXCEPTION    
    -- WHEN ZERO_DIVIDE THEN DBMS_OUTPUT.PUT_LINE('������ ����� 0���� ������ �����ϴ�.');
    WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('������ ����� 0���� ������ �����ϴ�.');
END;
/
-- UNIQUEW �������� ����
BEGIN
    UPDATE EMPLOYEE
    SET EMP_ID = &���
    WHERE EMP_NAME = '���ö';
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN DBMS_OUTPUT.PUT_LINE('�̹������ϴ� ����Դϴ�..');
END;
/
-- �����Ͱ� ���ų�, �ʹ����� ���̽�
DECLARE
    EID EMPLOYEE.EMP_ID%TYPE;
    ENAME EMPLOYEE.EMP_NAME%TYPE;
BEGIN
    SELECT EMP_ID, EMP_NAME
      INTO EID, ENAME
    FROM EMPLOYEE
    WHERE MANAGER_ID = &������;
    
    DBMS_OUTPUT.PUT_LINE('��� : ' || EID || '�̸� : ' || ENAME);
EXCEPTION
    WHEN TOO_MANY_ROWS THEN DBMS_OUTPUT.PUT_LINE('�ʹ����� ���� ��ȸ�Ǿ����ϴ�');
    WHEN NO_DATA_FOUND THEN DBMS_OUTPUT.PUT_LINE('��ȸ�� �����Ͱ� �����ϴ�');
END;
/

DECLARE
    DUP_EMPNO EXCEPTION;
    PRAGMA EXCEPTION_INIT(DUP_EMPNO, -00001);
    -- ����ũ�������ǿ� ����Ȱ�� ORA-00001������ �߻��Ѵ�.
    -- ORA-00001������ �����ϱ����ؼ� ���ʿ�  -00001�� ��Z�µ� ORA�� �ڵ����� �ν��ϱ⶧���� �����Ǿ���.
BEGIN
    UPDATE EMPLOYEE
    SET EMP_ID = &���
    WHERE EMP_ID = 200;
EXCEPTION
    WHEN DUP_EMPNO
    THEN DBMS_OUTPUT.PUT_LINE('�̹������ϴ� ����Դϴ�.');
END;
/








