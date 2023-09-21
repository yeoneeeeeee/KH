/* 
    * DML (DATA MANIPULATION LANGUAGE)
    ������ ���� ���
    
    ���̺� ���ο� �����͸� ����(INSERT)�ϰų�
    ������ �����͸� ����(UPDATE)�ϰų�
    ����(DELETE)�ϴ� ����
*/
/* 
    1. INSERT : ���̺� ���ο� "��"�� �߰��ϴ� ����
    
    [ǥ����]
    
    * INSERT INTO �迭
    
    1) INSERT INTO ���̺�� VALUES(��1,��2,��3,...);
    -> �ش� ���̺� �����ϴ� "���" Į���� ���� �߰��ϰ����ϴ� ���� ���� ���� �����ؼ�
    "�� ��"�� INSERT�ϰ����� �� �� ���� ǥ����
    ** ���ǻ��� **
    1) �÷��� ����, 2)�ڷ���, 3)������ ���缭 VALUES��ȣ �ȿ� ���� �����ؾ� ��.
    - �����ϰ� �����ϸ� : NOT ENOUGH VALUE ����
    - ������ �����ϸ�   : TOO MANY VALUE ������ �߻��Ѵ�.
*/

INSERT INTO EMPLOYEE
VALUES(900, '�ΰ��','880218-1234567','alrudals@nave.rcom',010123453333678,'D1','J7','S6',1800000,
        0.9,200,SYSDATE,NULL,DEFAULT);
        
SELECT * FROM EMPLOYEE;
------------------------------------------------------------------------------------------------
/* 
    2) INSERT INTO ���̺��(�÷���1, �÷���2,�÷���3...)
    VALUES(��1,��2,��3,...)
    => �ش� ���̺� "Ư��"�÷��� �����ؼ� �� �÷��� �߰��� ���� �����ϰ��� �� �� ���
    
    - �׷��� ��������� �߰��Ǳ� ������ ���� �ȵ�Į���� NULL���� ��(��, DEFAULT������ �Ǿ�������� �װ��� ��)
    
    ���ǻ��� : NOT NULL ���������� �ɷ��ִ� �÷��� �ݵ�� �����ؼ� ���� ���� �����ؾ��Ѵ�.
            ��, DEFAULT������ �Ǿ��ֵ��� ���� ���ص��ȴ�.            
*/
INSERT INTO EMPLOYEE(EMP_ID, EMP_NAME, EMP_NO, DEPT_CODE , JOB_CODE, SAL_LEVEL)
VALUES (901 , '�ΰ��2','123456-1234567','D1','J6','S5');

SELECT * FROM EMPLOYEE WHERE EMP_ID=901;

/* 
    3) INSERT INTO ���̺�� (��������);
    => VALUES()�� ���� ���� �����ϴ°��� �ƴ϶�
       ���������� ��ȸ�� ������� ��°�� INSERT�ϴ� ����
       ��, �������� �ѹ��� INSERT �� �� �ִ�.
*/

-- ���ο� ���̺� ����
CREATE TABLE EMP_01(
    EMP_ID NUMBER,
    EMP_NAME VARCHAR2(30),
    DEPT_TITLE VARCHAR2(20)
);
-- ��ü ������� ���, �̸�, �μ����� ��ȸ�� ����� EMP_01���̺� ��°�� �߰�
--1) ��ȸ
SELECT EMP_ID, EMP_NAME,DEPT_TITLE
FROM EMPLOYEE 
LEFT JOIN DEPARTMENT ON DEPT_CODE = DEPT_ID;

--2) INSERT
INSERT INTO EMP_01 (
                    SELECT EMP_ID, EMP_NAME,DEPT_TITLE
                    FROM EMPLOYEE 
                    LEFT JOIN DEPARTMENT ON DEPT_CODE = DEPT_ID
);
/*
    * INSERT ALL �迭
    �� �� �̻��� ���̺� ���� INSERT �� �� ���
    ���� : �� �� ���Ǵ� ���������� �����ؾ��Ѵ�.
    
    1) INSERT ALL
       INTO ���̺��1 VALUES(�÷���, �÷���, ...)
       INTO ���̺��2 VALUES(�÷���, �÷���, ....)
            ��������;
*/
-- ���ο� ���̺��� ���� �����
-- ù��° ���̺� : �޿��� 300���� �̻��� ������ǻ��, �����, ���޸��� ������ ���̺�
-- ���̺�� : EMP_JOB / EMP_ID(NUMBER), EMP_NAME(VARCAHR2(30), JOB_NAME(VARCHAR2(20)
CREATE TABLE EMP_JOB(
    EMP_ID NUMBER,
    EMP_NAME VARCHAR2(30),
    JOB_NAME VARCHAR2(20)
);

-- ù��° ���̺� : �޿��� 300���� �̻��� ������ǻ��, �����, �μ����� ������ ���̺�
-- ���̺�� : EMP_DEPT / EMP_ID(NUMBER), EMP_NAME(VARCAHR2(30), DEPT_TITLE(VARCHAR2(20)
CREATE TABLE EMP_DEPT(
    EMP_ID NUMBER,
    EMP_NAME VARCHAR2(30),
    DEPT_TITLE VARCHAR2(20)
);

--�޿��� 300���� �̻��� ������� ���, �̸�, ���޸�, �μ��� ��ȸ
SELECT EMP_ID, EMP_NAME, JOB_NAME, DEPT_TITLE
FROM EMPLOYEE
JOIN JOB USING(JOB_CODE)
LEFT JOIN DEPARTMENT ON DEPT_CODE = DEPT_ID 
WHERE SALARY >= 3000000;

-- EMP_JOB���̺��� �޿��� 300���� �̻��� ������� EMP_ID,EMP_NAME,JOB_NAME ����
-- EMP_DEPT���̺��� �޿��� 300���� �̻��� ������� EMP_ID, EMP_NAME,DEPT_TITLE�� ����
INSERT ALL
INTO EMP_JOB VALUES(EMP_ID,EMP_NAME,JOB_NAME)
INTO EMP_DEPT VALUES(EMP_ID,EMP_NAME,DEPT_TITLE)
     SELECT EMP_ID, EMP_NAME, JOB_NAME, DEPT_TITLE
     FROM EMPLOYEE
     JOIN JOB USING(JOB_CODE)
     LEFT JOIN DEPARTMENT ON DEPT_CODE = DEPT_ID 
     WHERE SALARY >=3000000;
     
SELECT * FROM EMP_JOB;
SELECT * FROM EMP_DEPT;

-----------------------------------------------------------------------------------
/* 
    2) INSERT ALL
       WHEN ����1 THEN
            INTO ���̺��1 VALUES(�÷���, �÷���, ...)
       WHEN ����2 THEN
            INTO ���̺��2 VALUES(Į����, Į����, ...)
       ��������
       
       - ���ǿ� �´� ���鸸 �ְڴ�.
*/

-- ������ ����ؼ� �� ���̺� �� INSERT
-- ���ο� �׽�Ʈ�� ���̺� ����
-- 2010�⵵ �������� ������ �Ի��� ������� ���, �����, �Ի���, �޿��� ��� ���̺� (EMP_OLD)
CREATE TABLE EMP_OLD
AS SELECT EMP_ID,EMP_NAME, HIRE_DATE,SALARY
   FROM EMPLOYEE
   WHERE 1 = 0;

-- 2010�⵵ �������� ���Ŀ�(2010������) �Ի��� ������� ���, �����, �Ի���, �޿��� ��� ���̺� (EMP_NEW)
CREATE TABLE EMP_NEW
AS SELECT EMP_ID,EMP_NAME, HIRE_DATE,SALARY
   FROM EMPLOYEE
   WHERE 1 = 0;
   
-- 1) �������� �κ�
-- 2010�� ����, ����
SELECT EMP_ID , EMP_NAME, HIRE_DATE, SALARY
FROM EMPLOYEE 
WHERE HIRE_DATE < '2010/01/01'; -- 15

SELECT EMP_ID , EMP_NAME, HIRE_DATE, SALARY
FROM EMPLOYEE 
WHERE HIRE_DATE >= '2010/01/01'; -- 9 

INSERT ALL
WHEN HIRE_DATE < '2010/01/01' THEN
     INTO EMP_OLD VALUES(EMP_ID , EMP_NAME, HIRE_DATE, SALARY) -- 15��
WHEN HIRE_DATE >= '2010/01/01' THEN
     INTO EMP_NEW VALUES(EMP_ID , EMP_NAME, HIRE_DATE, SALARY) -- 9��
     SELECT EMP_ID, EMP_NAME, HIRE_DATE, SALARY FROM EMPLOYEE;
     
SELECT * FROM EMP_OLD;
SELECT * FROM EMP_NEW;

/*
    2. UPDATE
    
    ���̺� ��ϵ� ������ �����͸� �����ϴ� ����
    
    [ǥ����]
    UPDATE ���̺��
    SET �÷��� = �ٲܰ� ,
        �÷��� = �ٲܰ� ,
        ... -- �������� ī������ ���ú��� ���� �̶� AND�� �ƴ϶� , �� �����Ѵ�
    WHERE ����; -- WHERE���� ���� �����ѵ�, ������ ������̺��� ������� �ٲ�� �ȴ�
*/

-- ���纻 ���̺� ���� �� �۾�.
CREATE TABLE DEPT_COPY 
AS SELECT * 
   FROM DEPARTMENT;

SELECT * FROM DEPT_COPY;

--DEPT_COPY���̺��� D9�μ��� �μ����� ������ȹ������ ����
UPDATE DEPT_COPY 
SET DEPT_TITLE = '������ȹ��'; -- 9�� ���� ����
-- ��ü ���� ��� DEPT_TITLE������ ��� ������ȹ������ ������.

-- ����) ������׿� ���ؼ� �ǵ����� ��ɾ� : ROLLBACK;
ROLLBACK;

UPDATE DEPT_COPY 
SET DEPT_TITLE = '������ȹ��'
WHERE DEPT_ID = 'D9'
;

SELECT * FROM DEPT_COPY;

CREATE TABLE EMP_SALARY
AS SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY, BONUS
FROM EMPLOYEE;

SELECT * FROM EMP_SALARY;

-- EMP_SALAY���̺��� ���ö ����� �޿��� 1000�������� ����
UPDATE EMP_SALARY
SET SALARY = 10000000
WHERE EMP_NAME = '���ö';

-- EMP_SALARY���̺��� ������ ����� �޿��� 700���� ,���ʽ��� 0.2�� ����
UPDATE EMP_SALARY
SET SALARY = 7000000 ,
    BONUS = 0.2
WHERE EMP_NAME = '������';

SELECT * FROM EMP_SALARY;
-- EMP_SALARY���̺��� ��ü����� �޿��� ������ �޿��� 20%���� �λ��� �ݾ����� ����
UPDATE EMP_SALARY
SET SALARY = SALARY * 1.2 ;

SELECT * FROM EMP_SALARY;
/* 
    UPDATE�� �������� ���
    ���������� ������ ��������� ������ �����κ��� �����ϰڴ�.
    
    - CREATE�ÿ� �������� ���� : �������� ������ ����� ���̺��� ����ڴ�.
    - INSERT�ÿ� �������� ���� : �������� ������ ����� �ش� ���̺� ���Ӱ� �����ϰڴ�.
    
    [ǥ����]
    UPDATE ���̺��
    SET �÷Ÿ� = (��������)
    WHERE ����;    
*/
-- EMP_SALARY ���̺� �ΰ�� ����� �μ��ڵ带 ������ ����� �μ��ڵ�� ����
UPDATE EMP_SALARY 
SET DEPT_CODE = (
                    SELECT DEPT_CODE
                    FROM EMPLOYEE
                    WHERE EMP_NAME = '������'
                )
WHERE EMP_NAME ='�ΰ��';
    
SELECT * FROM EMP_SALARY;

-- ���� ����� �޿��� ���ʽ���  ����� ����� �޿��� ���ʽ������� ����.
UPDATE EMP_SALARY
-- SET SALARY = (SELECT SALARY FROM EMP_SALARY WHERE EMP_NAME='�����')
-- ,   BONUS  = (SELECT BONUS FROM EMP_SALARY WHERE EMP_NAME='�����')
SET (SALARY , BONUS) = (SELECT SALARY, BONUS FROM EMP_SALARY WHERE EMP_NAME='�����') 
WHERE EMP_NAME ='����';

-- ���ǻ��� : UPDATE�ÿ��� ������ ���� ���ؼ� �ش� Į���� �������ǿ� ����Ǹ� �ȵ�.
-- ������ ����� ����� 200
UPDATE EMPLOYEE 
SET EMP_ID = 200 
WHERE EMP_NAME = '������';
-- unique constraint (KH.EMPLOYEE_PK) violated : PRIMARY KEY �������� ����.

UPDATE EMPLOYEE 
SET EMP_NAME = NULL 
WHERE EMP_ID = 200;
-- ORA-01407: cannot update ("KH"."EMPLOYEE"."EMP_NAME") to NULL
-- NOT NULL�������� ����.

COMMIT;
-- ��� ��������� Ȯ���ϴ� ��ɾ�

/* 
    4. DELETE
    
    ���̺� ��ϵ� �����͸� "��"������ �����ϴ� ����
    
    [ǥ����]
    DELETE FROM ���̺��
    WHERE ����; -- WHERE�� ���� ����.��, ������ �ش� ���̺��� ��� ���� ����.    
*/
DELETE FROM EMPLOYEE;

SELECT * FROM EMPLOYEE;

ROLLBACK; -- �ѹ�� ������ Ŀ�Խ������� ���ư���.

--EMPLOYEE ���̺�κ��� �ΰ��, �ΰ��2����� ������ �����
DELETE FROM EMPLOYEE
WHERE EMP_NAME IN ('�ΰ��','�ΰ��2');

COMMIT;

-- DEPARTMENT���̺�κ��� DEPT_ID�� D1�κμ��� ����.
DELETE FROM DEPARTMENT
WHERE DEPT_ID = 'D1';
-- ���࿡ EMPLOYEE���̺��� DEPT_cODE�÷����� �ܷ�Ű ���������� �߰��Ǿ��� ���, ������ ���� �ʾ�����!

DELETE FROM DEPARTMENT
WHERE DEPT_ID = 'D3';
-- �ܷ�Ű ���������� �ڽ����̺��� �ɷ��־�����, ������� �ʾ����Ƿ� ������ �� ������!

ROLLBACK;

/* 
    * TRUNCATE : ���̺��� ��ü ���� �� �����Ҷ� ����ϴ� ����
                 DELETE �������� ����ӵ��� �ξ� ����
                 ������ ������ ���� �Ұ�
                 ROLLBACK�� �Ұ�����.(�����ϰ� �����ؾ��Ѵ�)
    
    [ǥ����]
    TRUNCATE TABLE ���̺��;
    
    DELETE ������ ��
        TRUNCATE TABLE ���̺��;            |       DELETE FROM ���̺��;
    --------------------------------------------------------------------------------------
        ������ �������� �Ұ�(WHERE X)        |       Ư������ ���� ����(WHERE O)
        ����ӵ��� ����                      |       ����ӵ��� ����
        ROLLBACK �Ұ���                     |       ROLLBACK ����
*/
SELECT * FROM EMP_SALARY;

DELETE FROM EMP_SALARY;

ROLLBACK; -- DELETE���� �ѹ� ����.

TRUNCATE TABLE EMP_SALARY;




