/* 
DML : ������ ���� , SELECT(DQL) , INSERT , UPDATE ,DELETE
DDL : ������ ���� , CREATE , ALTER, DROP
TCL : Ʈ����� ����, COMMIT, ROLLBACK
DCL : ���� �ο� , GRANT , REVOKE

    <SELECT>
    �����͸� ��ȸ�ϰų� �˻��� �� ����ϴ� ��ɾ�
    
    - RESULT SET : SELECT ������ ���� ��ȸ�� �������� ������� �ǹ�
                (��ȸ�� ����� ����)
    [ǥ����]
    SELECT ��ȸ�ϰ����ϴ� �÷���, �÷���2, �÷���3
    FROM ���̺��;
*/
-- EMPLOYEE���̺��� ��ü ������� �����ȣ, ����̸�, �޿� Į���� ��ȸ��
SELECT EMP_ID, EMP_NAME, SALARY
FROM EMPLOYEE;

select emp_id
from employee;
-- ��ɾ�, Ű���� , �÷���, ���̺���� ��ҹ��ڸ� �������ʴ´�.
-- �ҹ��ڷ� �ص� ���������� �빮�ڷ� ���°� ����

-- EMPLOYEE ���̺��� ��ü ������� ��� Į���� ��ȸ
SELECT * 
FROM EMPLOYEE;

-- EMPLOYEE���� ��ü ������� �̸�, �̸���, �޴�����ȣ ��ȸ
SELECT EMP_NAME, EMAIL, PHONE
FROM EMPLOYEE;

------------ �ǽ� ����----------------
-- 1. JOB���̺��� ��� Į�� ��ȸ
SELECT * 
FROM JOB;
-- 2. JOB���̺��� ���޸� Į���� ��ȸ
SELECT JOB_NAME
FROM JOB;
-- 3. DEPARTMENT ���̺��� ��� Į�� ��ȸ
SELECT * 
FROM DEPARTMENT;
-- 4. EMPLOYEE ���̺��� ������, �̸���, ��ȭ��ȣ, �Ի��� Į���� ��ȸ
SELECT EMP_NAME, EMAIL, PHONE, HIRE_DATE
FROM EMPLOYEE;
-- 5. EMPLOYEE ���̺��� �Ի���, ������, �޿� Į���� ��ȸ
SELECT HIRE_DATE, EMP_NAME, SALARY
FROM EMPLOYEE;
/* 
    <�÷����� ���� �������>
    ��ȸ�ϰ��� �ϴ� Į������ �����ϴ� SELECT ���� �������(+-/*)�� ����ؼ� ����� ��ȸ�� �� �ִ�.
*/
-- EMPLOYEE���̺�κ��� ������, ����, ����( == ���� * 12)
SELECT EMP_NAME, SALARY, SALARY * 12
FROM EMPLOYEE;

-- EMPLOYEE���̺�κ��� ������, ����, ���ʽ�, ���ʽ��� ���Ե� ����
SELECT EMP_NAME, SALARY, BONUS , (SALARY + BONUS * SALARY) * 12
FROM EMPLOYEE;
--> �������������� NULL���� ������ ��� ��������� ��������� NULL�� �ȴ�.

-- DATE Ÿ�Գ����� ������ ����(DATE => ��,��,��,��,��,��)
-- EMPLOYEE���̺�κ��� ������, �Ի���, �ٹ��ϼ� ��ȸ(���ó�¥ - �Ի���)
-- ���ó�¥ : SYSDATE
SELECT EMP_NAME, HIRE_DATE, SYSDATE , SYSDATE - HIRE_DATE
FROM EMPLOYEE;
-- ���� �������� ���� : DATEŸ�Ծȿ� ���Ե� ��,��,�ʿ� ���� ������� �Բ� �����ϱ⶧��
-- ������� �� ����

/* 
    <�÷��� ��Ī �ο��ϱ�>
    [ǥ����]
    �÷��� AS ��Ī, �÷��� AS "��Ī" , �÷��� ��Ī, �÷��� "��Ī"
    
    AS�� ���̵� �Ⱥ��̵� ���� ��Ī�� Ư�����ڳ� ���Ⱑ ���Ե� ��� ������ ""�� ��� ǥ���ؾ���.
*/
-- EMPLOYEE ���̺�κ��� ������, ����, ����(== ����*12)
--                            �޿�(��) ,  ����(���ʽ� ������)
SELECT EMP_NAME, SALARY AS "�޿�(��)", SALARY *12 AS "����(���ʽ� ������)"
FROM EMPLOYEE;

-- EMPOLYEE���̺�κ��� ������ , �Ի���, �ٹ��ϼ�(���ó�¥ - �Ի���) ��ȸ
SELECT EMP_NAME ������, HIRE_DATE "�Ի���" , SYSDATE - HIRE_DATE AS "�ٹ��ϼ�"
FROM EMPLOYEE;

/* 
    <���ͷ�>
    ���Ƿ� ������ ���ڿ�('')�� SELECT���� ����ϸ� ���� �� ���̺� �����ϴ� ������ó�� ��ȸ��
    �����ϴ�.    
*/
-- EMPLOYEE ���̺�κ��� ���, ����� , �޿�
SELECT EMP_ID, EMP_NAME, SALARY, '��' ����
FROM EMPLOYEE;
-- SELECT���� ������ ���ͷ� ���� ��ȸ ����� RESULT SET�� ����࿡ �ݺ������� ��µȴ�.
/* 
    <DISTINCT>
    ��ȸ�ϰ����ϴ� �÷��� �ߺ��� ���� �� �ѹ��� ��ȸ�ϰ��� �� �� ���
    Į���� �տ� ���
    
    [ǥ����]
    DISTINCT Į����
*/
-- EMPLOYEE���̺��� �μ��ڵ�鸸 ��ȸ
SELECT DISTINCT DEPT_CODE
FROM EMPLOYEE;

-- EMPLOYEE���̺��� �����ڵ�鸸 ��ȸ
SELECT DISTINCT JOB_CODE
FROM EMPLOYEE;

-- DEPT_CODE, JOB_CODE�� ��Ʈ�� ��� �ߺ��� ������ �Ǻ�
SELECT DISTINCT DEPT_CODE, JOB_CODE
FROM EMPLOYEE;

-----------------------------------------------------
/* 
    <WHERE ��>
    ��ȸ�ϰ��� �ϴ� ���̺� Ư�� ������ �����ؼ�
    �� ���ǿ� �����ϴ� �����͵鸸 ��ȸ�ϰ��� �� �� ����ϴ� ����
    
    [ǥ����]
    SELECT �÷���, �÷���... => �÷����� �̾Ƴ��ڴ�.
    FROM ���̺��
    WHERE ���ǽ�; => ���ǿ� �����ϴ� ����� �̾Ƴ��ڴ�.
    
    �������
    FROM(1��) => WHERE => SELECT
    
    - ���ǽĿ� �پ��� �����ڵ� ��� ����
    <�񱳿�����>
    > , < , >= , <=
    =(��ġ�ϴ°�? : �ڹ�, �ڽ� == �̿���)
    != , ^= , <> (��ġ���� �ʴ°�?)
*/
-- EMPLOYEE���̺�κ��� �޿��� 400���� �̻��� ����鸸 ��ȸ(����÷�)
SELECT *
FROM EMPLOYEE 
WHERE SALARY >= 4000000;

-- EMPLOYEE���̺�κ��� �μ��ڵ尡 D9�� ������� �����, �μ��ڵ� ,�޿� ��ȸ
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE 
WHERE DEPT_CODE = 'D9';
-- EMPLOYEE���̺�κ��� �μ��ڵ尡 D9�� �ƴ� ������� �����, �μ��ڵ� , �޿� ��ȸ
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE 
-- WHERE DEPT_CODE != 'D9';
-- WHERE DEPT_CODE ^= 'D9';
WHERE DEPT_CODE <> 'D9';
------------------------------------------------------------------
-- 1. EMPLOYEE ���̺��� �޿��� 300���� �̻��� ������� �̸�, �޿� ,�Ի��� ��ȸ.
SELECT EMP_NAME, SALARY, HIRE_DATE
FROM EMPLOYEE 
WHERE SALARY >= 3000000;
-- 2. EMPLOYEE ���̺��� �����ڵ尡 J2�� ������� �̸� ,�޿� , ���ʽ� ��ȸ
SELECT EMP_NAME, SALARY , BONUS
FROM EMPLOYEE
WHERE JOB_CODE = 'J2';
-- 3. EMPLOYEE ���̺��� ���� �������� ������� ���, �̸�, �Ի��� ��ȸ
SELECT EMP_ID, EMP_NAME, HIRE_DATE
FROM EMPLOYEE
WHERE ENT_YN = 'N';
-- 4. EMPLOYEE ���̺��� ������ 5000���� �̻��� ������� �̸� , �޿�, ����, �Ի��� ��ȸ
SELECT EMP_NAME, SALARY, SALARY * 12 AS ����, HIRE_DATE
FROM EMPLOYEE
-- WHERE ���� >= 500000; -- ����
WHERE SALARY * 12 >= 50000000;
--> SELECT������ �ο��� ��Ī�� WHERE�������� ����Ҽ� ����. 

/* 
    <��������>
    ���� ���� ������ ���� �� ���
    AND(�ڹ� &&) , OR(�ڹ� ||)
    AND : ~�̸鼭, �׸���
    OR  : ~�̰ų�, �Ǵ�
*/
-- EMPLOYEE ���̺��� �μ��ڵ尡 D9�̸鼭 �޿��� 500���� �̻��� ������� �̸�, �μ��ڵ�, �޿� ��ȸ
SELECT EMP_NAME, DEPT_CODE, SALARY 
FROM EMPLOYEE 
WHERE DEPT_CODE = 'D9' AND SALARY >= 5000000;

-- �μ��ڵ尡 D6�̰ų� �޿��� 300���� �̻��� ������� �̸�, �μ��ڵ�, �޿���ȸ
SELECT EMP_NAME, DEPT_CODE, SALARY 
FROM EMPLOYEE
WHERE DEPT_CODE = 'D6' OR SALARY >= 3000000;
-- �޿��� 350���� �̻��̰� 600���������� ������� �̸�, ���, �޿� ,�����ڵ� ��ȸ
SELECT EMP_NAME, EMP_ID, SALARY, JOB_CODE
FROM EMPLOYEE
WHERE SALARY <= 6000000 AND SALARY >= 3500000 ;
/* 
    <BETWEEN A AND B>
    �� �̻� �� ������ ������ ���� ������ �����Ҷ� ���
    [ǥ����]
    �񱳴��Į���� BETWEEN ���Ѱ� AND ���Ѱ�;
*/
SELECT EMP_NAME, EMP_ID, SALARY , JOB_CODE
FROM EMPLOYEE
WHERE SALARY BETWEEN 3500000 AND 6000000;

-- �޿��� 350���� �̸��̰� 600���� �ʰ��� ������� �̸�, ���, �޿�, �����ڵ� ��ȸ
SELECT EMP_NAME, EMP_ID, SALARY , JOB_CODE
FROM EMPLOYEE
WHERE  SALARY NOT BETWEEN 3500000 AND 6000000;
--> ����Ŭ�� NOT�� �ڹ��� �����������ڿ� ������ �ǹ̸� ����. ��ġ�� Į���� ��, �� �������.

-- ** BETWEEN AND �����ڴ� DATE���İ��� �������� ��� ������.
-- �Ի����� '90/01/01' ~ '03/01/01'�� ������� ��� �÷� ��ȸ
SELECT * 
FROM EMPLOYEE 
-- WHERE HIRE_DATE >= '90/01/01' AND HIRE_DATE <= '03/01/01';
WHERE HIRE_DATE BETWEEN '90/01/01' AND '03/01/01';

-- �Ի����� '90/01/01' ~ '03/01/01'�� �ƴ� ������� ��� �÷� ��ȸ
SELECT *
FROM EMPLOYEE
WHERE HIRE_DATE NOT BETWEEN '90/01/01' AND '03/01/01';
/* 
    <LIKE 'Ư������'>
    ���ϰ����ϴ� Į�� ���� ���� ������ Ư�� ���Ͽ� ������ ��� ��ȸ
    
    [ǥ����]
    �񱳴���÷��� LIKE 'Ư������'
    
    - �ɼ� : Ư�����Ϻκп� ���ϵ�ī���� '%', '_'�� ������ ������ �� ����
    
    '%' : 0���� �̻�
          �񱳴�� Į���� LIKE '����%' => �÷����߿� '����'�� �����ϴ� ���� ��ȸ
          �񱳴�� Į���� LIKE '%����' => �÷����߿� '����'�� ������ ���� ��ȸ
          �񱳴�� Į���� LIKE '%����%' => Į���� �߿� '����' ���ԵǴ°� ��ȸ
    
    '_' : 1����
          �񱳴���÷��� LIKE '_����' => �ش� Į���� �߿� '����'�տ� ������  1���ڰ� �����ϴ� ��츸 ��ȸ
          �񱳴���÷��� LIKE '__����' => �ش� Į���� �߿� '����'�տ� ������ 2���ڰ� �����ϴ� ��츸 ��ȸ
*/

-- ���� ������ ������� �̸�, �޿�, �Ի��� ��ȸ
SELECT EMP_NAME, SALARY, HIRE_DATE
FROM EMPLOYEE 
WHERE EMP_NAME LIKE '��_%';

-- �̸� �߿� '��'�� ���Ե� ������� �̸�, �ֹι�ȣ ,�μ��ڵ� ��ȸ
SELECT EMP_NAME, EMP_NO, DEPT_CODE
FROM EMPLOYEE
WHERE EMP_NAME LIKE '%��%';

-- ��ȭ��ȣ 4��° �ڸ��� 9�ν����ϴ� ������� ��� , �����, ��ȭ��ȣ ,�̸��� ��ȸ
SELECT EMP_ID, EMP_NAME, PHONE, EMAIL
FROM EMPLOYEE
WHERE PHONE LIKE '___9%';

-- �̸� ������ڰ� '��'�� ������� ��� Į��
SELECT *
FROM EMPLOYEE
WHERE EMP_NAME LIKE '_��_';
--------------------------------------------------------
--1. �̸��� '��'���� ������ ������� �̸�, �Ի��� ��ȸ
SELECT EMP_NAME, HIRE_DATE
FROM EMPLOYEE
WHERE EMP_NAME LIKE '%��';
--2. ��ȭ��ȣ ó�� 3���ڰ� 010�� �ƴ� ������� �̸�, ��ȭ��ȣ ��ȸ
SELECT EMP_NAME, PHONE
FROM EMPLOYEE
WHERE NOT PHONE LIKE '010%';
--3. DEPARTMENT���̺��� �ؿܿ����� ���õ� �μ����� ��� �÷� ��ȸ
SELECT * 
FROM DEPARTMENT
WHERE DEPT_TITLE LIKE '�ؿܿ���%'; 

/* 
    <IS NULL>
    �ش� ���� NULL���� �����ش�.
    
    [ǥ����]
    �񱳴�� �÷� IS NULL : �÷����� NULL�� ���
    �񱳴�� �÷� IS NOT NULL : �÷����� NULL�� �ƴ� ���
*/

-- ���ʽ��� ���� �ʴ� ������� ��� , �̸�, �޿� ,���ʽ�
SELECT EMP_ID, EMP_NAME, SALARY , BONUS
FROM EMPLOYEE 
WHERE BONUS IS NULL;

-- ����� ���� ������� �����, ������, �μ��ڵ� ��ȸ
SELECT EMP_NAME, MANAGER_ID, DEPT_CODE
FROM EMPLOYEE 
WHERE MANAGER_ID IS NULL;

-- ����� ���� �μ���ġ�� ���� ���� ���� ������� ��� Į�� ��ȸ
SELECT * 
FROM EMPLOYEE
WHERE MANAGER_ID IS NULL AND DEPT_CODE IS NULL;
-- �μ���ġ�� ���� �ʾ����� ���ʽ��� �޴� ����� ��� �÷� ��ȸ
SELECT * 
FROM EMPLOYEE
WHERE DEPT_CODE IS NULL AND BONUS IS NOT NULL;
/* 
    <IN>
    �� ��� Į������ ���� ������ ��ϵ� �߿� ��ġ�ϴ� ���� �ִ��� �Ǵ�
    
    [ǥ����]
    �񱳴��Į�� IN (��1,��2,��3,��4,..,..)
*/
-- �μ��ڵ尡 D6 �̰ų� �Ǵ� D8�̰ų� �Ǵ� D5�� ������� �̸�, �μ��ڵ�, �޿��� ��ȸ
SELECT EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
-- WHERE DEPT_CODE = 'D6' OR DEPT_CODE ='D8' OR DEPT_CODE = 'D5';
WHERE DEPT_CODE IN ('D6','D8','D5');

-- �����ڵ尡 J1�̰ų� �Ǵ� J3�̰ų� �Ǵ� J4�� ������� ������ ��� ����� Į�� ��ȸ
SELECT *
FROM EMPLOYEE
WHERE JOB_CODE NOT IN ('J1','J3','J4');

/* 
    <���� ������ ||>
    ���� Į�������� ��ġ �ϳ��� �÷��ΰ�ó�� ��������ִ� ������
    �÷��� ���ͷ�(������ ���ڿ�)�� �����Ҽ� ����
    
*/
SELECT EMP_ID || EMP_NAME || SALARY
FROM EMPLOYEE;

-- XX�� XXX�� ������ XXXX�� �Դϴ�. AS �޿�����
SELECT 
EMP_ID || '�� ' || EMP_NAME || '�� ������ ' || SALARY || '�� �Դϴ�' AS �޿�����
FROM EMPLOYEE;

/* 
    <������ �켱����>
    0. ()
    1. ���������
    2. ���Ῥ����
    3. �񱳿�����
    4. IS NULL, LIKE , IN
    5. BETWEEN AND
    6. NOT
    7. �������� (AND)
    8. �������� (OR)
*/
/* 
    <ORDER BY ��>
    SELECT�� ���� �������� �����ϴ� �����ϻӸ� �ƴ϶� �����ε� ���� �������� ����Ǵ� ����
    ���� ��ȸ�� ������鿡 ���ؼ� ���� ������ ������� ����
    
    [ǥ����]
    SELECT ��ȸ�� �÷�1, 2, 3...
    FROM ��ȸ�� ���̺��
    WHERE ���ǽ�(��������)
    ORDER BY [���ı������� ��������ϴ� �÷���/��Ī/�÷� ����] [ASC/DESC](��������) [NULLS FIRST/NULLS LAST](��������)
    
    �������� / ��������
    - ASC :��������(������ �⺻��)
    - DESC : ��������
    
    �����ϰ����ϴ� �÷����� NULL�� ���� ���
    - NULLS FIRST : NULL������ ������ ��ġ�ϰڴ�.(���������� �⺻��)
    - NULLS LAST  : NULL������ �������� ��ġ�ϰڴ�(���������� �⺻��)
*/

-- ������ ��������� ���� �����ϰ� �ʹ�..(��������)
SELECT *
FROM EMPLOYEE
ORDER BY SALARY DESC;

-- ���ʽ� ���� ����
SELECT *
FROM EMPLOYEE
-- ORDER BY BONUS ; -- ASC(��������) & NULLS LAST �⺻��
-- ORDER BY BONUS ASC NULLS FIRST;
ORDER BY BONUS DESC , SALARY;

-- ���� ���� �������� �����ϱ�
SELECT EMP_NAME, SALARY , (SALARY * 12) "����"
FROM EMPLOYEE 
-- ORDER BY 3 ASC;
-- ORDER BY ���� ASC;
ORDER BY (SALARY * 12) ASC;
-- ORDER BY�� ���� �Ӹ��ƴ϶� ���ڿ�, ��¥�� ���ؼ��� ���İ����ϴ�.







