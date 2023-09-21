/*
    <�Լ� FUNCTION>
    �ڹٷ� ������ �޼ҵ�� ���� ����
    �Ű������� ���޵� ������ �о ����� ����� ��ȯ => ȣ���ؼ� �� ��
    
    - ������ �Լ� : n���� ���� �о n���� ����� ���� (�� �ึ�� �Լ� ���� �� ��� ��ȯ)
    - �׷� �Լ�  :  n���� ���� �о 1���� ����� ���� (�ϳ��� �׷캰�� �Լ� ������ ����� ��ȯ)
    
    ������ �Լ��� �׷��Լ��� �Բ� ����Ҽ� ���� : ��� ���� ������ �ٸ��� ����
*/
--------------------------------------<������ �Լ�>---------------------------------------------------------
/* 
    <���ڿ��� ���õ� �Լ�>
    LENGTH / LENGTHB
    
    - LENGTH(���ڿ�) : ���޵� ���ڿ��� ���� �� ��ȯ
    - LENGTHB(���ڿ�) : ���޵� ���ڿ��� ����Ʈ �� ��ȯ
    
    ������� ���ڷ� ��ȯ => NUMBER
    ���ڿ� : ���ڿ� ������ ���ͷ� , ���ڿ������� ����� Į��
    
    �ѱ��� ���ڴ� 3BYTE OR 2BYTE
    ���� , ���� ,Ư������ : ���ڴ� 1BYTE ��޵�.
*/

SELECT LENGTH('����Ŭ!'), LENGTHB('����Ŭ!')
FROM DUAL;
-- DUAL : �������̺�(DUMMY TABLE) : ��������̳� ����Į���� ���� �ѹ��� �׽�Ʈ�뵵�� ����ϰ������ ����ϴ� ���̺�

SELECT '����Ŭ' , 1,2,3, SYSDATE
FROM DUAL;

SELECT 
    EMAIL, LENGTH(EMAIL), LENGTHB(EMAIL), EMP_NAME, LENGTH(EMP_NAME), LENGTHB(EMP_NAME)
FROM EMPLOYEE;

/* 
    INSTR
    - INSTR(���ڿ�, Ư������, ã����ġ�� ���۰�, ����) : ���ڿ��κ��� Ư�������� ��ġ�� ��ȯ
    
    ã�� ��ġ�� ���۰�, ������ ���� ����. ������� NUMBERŸ������ ��ȯ
    ã����ġ�� ���۰�(1/-1)
    1 : �տ������� ã�ڴ�(������ �⺻��)
    -1 : �ڿ������� ã�ڴ�.
*/

SELECT INSTR('AABAACAABBAA','B')
FROM DUAL; -- 3

SELECT INSTR('AABAACAABBAA','B', 1)
FROM DUAL; -- 3

SELECT INSTR('AABAACAABBAA','B', -1)
FROM DUAL; -- 10

SELECT INSTR('AABAACAABBAA','B', -1 , 2)
FROM DUAL; -- 9

SELECT INSTR('AABAACAABBAA','B', -1 , 0)
FROM DUAL; -- ������ ��� ������ ����������� �����߻�
-- �ε���ó�� ������ ��ġ�� ã�°��� ������ �ڹ�ó�� 0���ͽ����� �ƴ϶� 1���� �����Ѵ�.

-- EMAIL���� @�� ��ġ�� ã��
SELECT
    INSTR(EMAIL, '@') AS "@�� ��ġ"
FROM EMPLOYEE;
/* 
    SUBSTR
    ���ڿ��κ��� Ư�� ���ڿ��� �����ϴ� �Լ�
    
    - SUBSTR(���ڿ�, ó����ġ, ������ ���ڰ���)
    
    ������� CHARACTERŸ������ ��ȯ(���ڿ� ����)
    ������ ���� ������ ���� ����(������ ���ڿ� ������ �����ϰڴٶ�� �ǹ�)
    ó����ġ�� ������ ���ð��� : �ڿ������� N��° ��ġ�κ��� ���ڸ� �����ϰڴ� ��� ��.
*/
SELECT SUBSTR('SHOWMETHEMONEY',7)
FROM DUAL;

SELECT SUBSTR('SHOWMETHEMONEY',5,2)
FROM DUAL;

SELECT SUBSTR('SHOWMETHEMONEY',1,6)
FROM DUAL;

SELECT SUBSTR('SHOWMETHEMONEY',-8,3)
FROM DUAL;

-- �ֹε�Ϲ�ȣ���� �����κ��� �����ؼ� ����(1), ����(2)�� üũ
SELECT EMP_NAME, SUBSTR(EMP_NO,8,1) AS ����
FROM EMPLOYEE;

-- �̸��Ͽ��� ID�κи� �����ؼ� ��ȸ(INSTR + SUBSTR)
SELECT EMP_NAME, EMAIL, SUBSTR(EMAIL , 1 , INSTR(EMAIL , '@') - 1  ) AS ID
FROM EMPLOYEE;

-- ������ ����鸸 ��ȸ
SELECT EMP_NAME, SALARY
FROM EMPLOYEE
WHERE SUBSTR(EMP_NO, 8, 1) IN ('1','3');

/* 
    LPAD / RPAD
    
    - LPAD/RPAD(���ڿ�, ���������� ��ȯ�� ������ ����, �����̰����ϴ¹���)
    : ������ ���ڿ��� �����̰����ϴ� ���ڸ� ���ʿ�, �����ʿ� ���ٿ��� ���������� N���̸�ŭ�� ���ڿ��� ��ȯ
    
    ������� CHARACTERŸ������ ��ȯ
    �����̰��� �ϴ� ���� ��������(�⺻�� ' ')
*/

SELECT LPAD(EMAIL, 16) , EMAIL
FROM EMPLOYEE;

SELECT RPAD(EMAIL, 20, '#')
FROM EMPLOYEE;

-- �ֹε�Ϲ�ȣ ��ȸ : 621235-1985634 => 651235-1******
-- EMP_NAME, �ֹε�Ϲ�ȣ��ȸ
SELECT EMP_NAME, RPAD(SUBSTR(EMP_NO, 1 , 8),14 , '*') AS �ֹι�ȣ
FROM EMPLOYEE;

/* 
    LTRIM / RTRIM
    - LTRIM / RTRIM(���ڿ�, ���Ž�Ű�����ϴ� ����)
    : ���ڿ��� ����, �����ʿ��� ���Ž�Ű�����ϴ� ���ڵ��� ã�Ƽ� ������ ������ ���ڿ��� ��ȯ
    
    ������� CHARACTER ���·� ����
    ���Ž�Ű�����ϴ� ���� ���� ���� => ' '�� ���ŵ�.
*/
SELECT LTRIM('        K     H             ')
FROM DUAL;

SELECT LTRIM('00012304568100','0')
FROM DUAL;

SELECT RTRIM('00012304568100','0')
FROM DUAL;

SELECT LTRIM('131322KH123','123K')
FROM DUAL;
-- ���Ž�Ű�����ϴ� ���ڿ��� ������ �����ִ°� �ƴ϶�
-- ���� �ϳ��ϳ��� �� �����ϸ� �����ִ� ����

/* 
    TRIM
    - TRIM(BOTH/LEADING/TRAILING '�����ϰ����ϴ� ����' FROM '���ڿ�')
    : ���ڿ��� ����/����/���ʿ� �ִ� Ư�����ڸ� ������ ������ ���ڿ��� ��ȯ
    
    ������� ���ڿ�Ÿ������ ��ȯ
    �ɼ��� ��������, �⺻���� BOTH
*/
SELECT TRIM('     K    H     ') 
FROM DUAL;

--
SELECT TRIM('Z' FROM 'ZZZKHZZZZ')
FROM DUAL;

SELECT TRIM(LEADING 'Z' FROM 'ZZZKHZZZZ')
FROM DUAL; -- == LTRIM�� ���

SELECT TRIM(TRAILING 'Z' FROM 'ZZZKHZZZZ')
FROM DUAL; -- == RTRIM�� ����ѳ༮
/* 
    LOWER/UPPER/INITCAP
    
    -LOWER(���ڿ�)
    : �ҹ��ڷκ���
    
    -UPPER(���ڿ�)
    : �빮�ڷκ���
    
    -INITCAP(���ڿ�)
    : �� �ܾ��� ù��°���ڸ� �빮�ڷ� ����
*/
SELECT LOWER('Welcome'), UPPER('Welcome'), INITCAP('welcome to C class')
FROM DUAL;

/* 
    CONCAT
    
    - CONCAT(���ڿ�1, ���ڿ�2)
    : ���޵� ���ڿ� �ΰ��� �ϳ��� ���ڿ��� ���ļ� ��ȯ
*/

SELECT CONCAT('�ΰ��','MKM')
FROM DUAL;

SELECT '�ΰ��' || 'mkm'
FROM DUAL;

SELECT CONCAT(CONCAT('�ΰ��','MKM'),'MIN')
FROM DUAL;

SELECT '�ΰ��' || 'mkm' || 'MIN'
FROM DUAL;

/* 
    REPLACE
    
    - REPLACE(���ڿ�, ã������, �ٲܹ���)
    : ���ڿ��κ��� ã�����ڸ� ã�Ƽ� �ٲܹ��ڷ� �ٲ� ���ڿ��� ��ȯ
*/

SELECT REPLACE('����� ������ ���ﵿ','���ﵿ','�Ｚ��')
FROM DUAL;

------------------------------------------------------------------------------------------------------
/* 
    <���ڿ� ���õ� �Լ�>
    
    ABS
    
    - ABS(���밪�� ���� ����) : ���밪�� �����ִ� �Լ�.
    
    ������� NUMBER���·� ��ȯ
*/

SELECT ABS(-50)
FROM DUAL;

/* 
    MOD
    
    - MOD(����, ������) : % �� ���� ���� ������ ���� ��ȯ���ִ� �Լ�
    
*/

SELECT MOD(10, 3)
FROM DUAL;

SELECT MOD(-10, 3)
FROM DUAL;

SELECT MOD(10.9, 3)
FROM DUAL;

/* 
    ROUND
    
    - ROUND(�ݿø��ϰ����ϴ� ��, �ݿø��� ��ġ) : �ݿø�ó������
    
    �ݿ����� ��ġ : �Ҽ��� �������� �Ʒ� N��° ������ �ݿø� �ϰڴ�.
                  ��������(��ġ ������ �⺻�� 0, �Ҽ��� ù��° �ڸ����� �ݿø��� �ϰڴ�)
*/

SELECT ROUND(123.456)
FROM DUAL;

SELECT ROUND(123.456, 1)
FROM DUAL;

SELECT ROUND(123.456, -1)
FROM DUAL;

/* 
    CEIL
    
    - CEIL(�ø�ó���� ����) : �Ҽ���Ʒ��� ���� ������ �ø�ó�����ִ� �Լ�
    
    FLOOR
    
    - FLOOR(����ó���ϰ����ϴ� ����) :�Ҽ��� �Ʒ��Ǽ��� ������ ����ó�����ִ� �Լ�
*/
SELECT CEIL(123.11111)
FROM DUAL;

SELECT FLOOR(123.999)
FROM DUAL;

-- �� ������ �ٹ��ϼ� ���ϱ� (���ó�¥ - ����� ==> �Ҽ���)
SELECT EMP_NAME , CONCAT(FLOOR(SYSDATE-HIRE_DATE),'��') AS �ٹ��ϼ�
FROM EMPLOYEE;

/* 
    TRUNC
    - TRUNC(����ó���Ҽ���, ��ġ) : ��ġ������ ������ ����ó�� �Լ�
    
    ��ġ ������ �⺻���� 0 == FLOOR�Լ��� ����
*/
SELECT TRUNC(123.786)
FROM DUAL;

SELECT TRUNC(123.786,1)
FROM DUAL;

SELECT TRUNC(123.786,2)
FROM DUAL;

SELECT TRUNC(123.786 ,-1)
FROM DUAL;
--------------------------------------------------------------------------------
/* 
    <��¥ ���� �Լ�>
    
    DATE Ÿ�� : �⵵, �� ,�� , �� ,�� ,�ʸ� �� ������ �ڷ���
*/

-- 1. MONTHS_BETWEEN(DATE1, DATE2) : �� ��¥ ������ ������ ��ȯ (��ȯ���� NUMBER)
-- DATE2�� �� �̷��ϰ�� ������ ����.
-- �� ������ �ٹ��ϼ�, �ٹ� ������
SELECT EMP_NAME
     , FLOOR(SYSDATE - HIRE_DATE) || '��' �ٹ��ϼ�
     , FLOOR(MONTHS_BETWEEN(SYSDATE , HIRE_DATE)) || '����' �ٹ�������
FROM EMPLOYEE;

SELECT EMP_NAME
     , FLOOR(SYSDATE - HIRE_DATE) || '��' �ٹ��ϼ�
     , FLOOR(ABS(MONTHS_BETWEEN(HIRE_DATE , SYSDATE))) || '����' �ٹ�������
FROM EMPLOYEE;

-- 2. ADD_MONTHS(DATE , NUMBER) : Ư�� ��¥�� �ش� ���ڸ�ŭ �������� ���� ��¥��ȯ(������� DATEŸ��)
-- ���� ��¥�κ��� 5���� ����
SELECT ADD_MONTHS(SYSDATE,5)
FROM DUAL;

-- ��ü ������� 1�� �ټ���(== �Ի��� ���� 1�ֳ�)
SELECT EMP_NAME, HIRE_DATE, ADD_MONTHS(HIRE_DATE, 12)
FROM EMPLOYEE;

-- 3. NEXT_DAY(DATE, ����(����/����) ): Ư�� ��¥���� ���� ����� ������ ã�Ƽ� �� ��¥�� ��ȯ
SELECT NEXT_DAY(SYSDATE, '�����')
FROM DUAL;

SELECT NEXT_DAY(SYSDATE, '��')
FROM DUAL;

-- 1:�Ͽ���, 2:������, 3:ȭ... 7:�����
SELECT NEXT_DAY(SYSDATE, 7)
FROM DUAL;

-- DDL(������ ���Ǿ��) : CREATE, ALTER , DROP
ALTER SESSION SET NLS_LANGUAGE = AMERICAN;

SELECT NEXT_DAY(SYSDATE, 'SUN')
FROM DUAL;

-- �ѱ���� �� ����
ALTER SESSION SET NLS_LANGUAGE = KOREAN;

-- 4. LAST_DAY(DATE) : �ش� Ư����¥ ���� ������ ��¥�� ���ؼ� ��ȯ(DATE�ڷ���)
SELECT LAST_DAY(SYSDATE)
FROM DUAL;

-- 5. EXTRACT : �⵵ , ��, �ϵ��� �����������ؼ� ��ȯ(NUMBERŸ��)
/* 
    - EXTRACT(YEAR FROM ��¥) : Ư�� ��¥�κ��� YEAR(�⵵)�� ����
    - EXTRACT(MONTH FROM ��¥): Ư�� ��¥�κ��� MONTH(��)�� ����
    - EXTRACT(DAY FROM ��¥ ) : Ư�� ��¥�κ��� DAY(��)�� ����
*/
SELECT EXTRACT(YEAR FROM SYSDATE) ,
       EXTRACT(MONTH FROM SYSDATE), 
       EXTRACT(DAY FROM SYSDATE)
FROM DUAL;
----------------------------------------------------------------------------------
/* 
    <����ȯ �Լ�>
    NUMBER/DATE => CHARACTER
    
    - TO_CHAR(NUMBER/DATE , ����)
    : ������ �Ǵ� ��¥�� �����͸� ���ڿ� Ÿ������ ��ȯ(���˿� ���缭)
*/
-- ���ڸ� ���ڿ���
SELECT TO_CHAR(1234)
FROM DUAL; -- 1234 => '1234'

SELECT TO_CHAR(1234,'00000')
FROM DUAL; -- 1234 => '01234' : �� ������ 0���� ä����

SELECT TO_CHAR(1234, '99999')
FROM DUAL; -- 1234 => ' 1234' : ��ĭ�� ' '���� ä����

SELECT TO_CHAR(1234, 'L00000')
FROM DUAL; -- L : LOCAL => ���� ������ ������ ȭ�����

SELECT TO_CHAR(1234, 'L99,999')
FROM DUAL;
------------------------------------------------------------------------------
SELECT TO_CHAR(SYSDATE)
FROM DUAL; -- '23/05/30'

-- '2023-05-30'
SELECT TO_CHAR(SYSDATE,'YYYY-MM-DD')
FROM DUAL;

-- �� �� �� : ����(AM)/����(PM)
SELECT TO_CHAR(SYSDATE, 'PM HH:MI:SS')
FROM DUAL;

-- �ú��� :24�ð�����
SELECT TO_CHAR(SYSDATE, 'HH24:MI:SS')
FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'MON DAY, YYYY')
FROM DUAL;

-- �⵵�� ���� �ִ� ����
SELECT TO_CHAR(SYSDATE, 'YYYY'),
       TO_CHAR(SYSDATE, 'RRRR'),
       TO_CHAR(SYSDATE, 'YY'),
       TO_CHAR(SYSDATE, 'RR'),
       TO_CHAR(SYSDATE, 'YEAR')
FROM DUAL;
-- YY�� RR�� ������
-- R�� ���ϴ� �ܾ� : ROUND(�ݿø�)
-- YY : �������� ������ 20�� ���� => (20)21
-- RR : 50�� �������� ������ 20, ũ�� 19�� ����. => 1989

-- ���ν� �����ִ� ����
SELECT TO_CHAR(SYSDATE , 'MM')
      ,TO_CHAR(SYSDATE , 'MON')
      ,TO_CHAR(SYSDATE , 'MONTH') 
      ,TO_CHAR(SYSDATE , 'RM') -- RM : �θ����ڷ�ǥ��
FROM DUAL;

-- �Ϸν� �����ִ� ����
SELECT TO_CHAR(SYSDATE, 'D'),
       TO_CHAR(SYSDATE, 'DD'),
       TO_CHAR(SYSDATE, 'DDD')
FROM DUAL;
-- D : 1���� �������� �Ͽ��Ϻ��� ��ĥ°���� �˷��ִ� ����
-- DD: 1�� �������� 1�Ϻ��� ��ĥ°���� �˷��ִ� ����
-- DDD: 1�� �������� 1�� 1�Ϻ��� ��ĥ°���� �˷��ִ� ����

-- ���Ϸν� �����ִ� ����
SELECT TO_CHAR(SYSDATE,'DY')
       ,TO_CHAR(SYSDATE,'DAY')
FROM DUAL; -- '����' �̶�� ������ �ֳ� ������ ����.

-- EMPLYOEE���� 2010�� ���Ŀ� �Ի��� ������� �����, �Ի���(XXXX�� XX�� XX�� (��))�� ��ȸ
SELECT EMP_NAME, TO_CHAR(HIRE_DATE, 'YYYY"��" MM"��" DD"��" (DY)')
FROM EMPLOYEE
WHERE EXTRACT(YEAR FROM HIRE_DATE) >= 2010;
-- WHERE HIRE_DATE >= '10/01/01';
/* 
    NUMBER/CHARCTER => DATE
    - TO_DATE(NUMBER/CHARCTER , ����) : ������ , ���ڿ� �����͸� ��¥�� �����ͷ� ��ȯ
*/
SELECT TO_DATE(20210101)
FROM DUAL; -- �⺻������ YY/MM/DD�� ��ȯ�� �ȴ�.

SELECT TO_DATE('20210101')
FROM DUAL;

SELECT TO_DATE(000101)
FROM DUAL; -- 000101 == 101 : 0���� �����ϴ� ���ڷ� �ν��Ͽ� �����߻�

SELECT TO_DATE('000101')
FROM DUAL; -- 0���ν����ϴ� �⵵�� �ݵ�� Ȧ����ǥ�� ��� �����ؾ��Ѵ�.

SELECT TO_DATE('20100101','YYYYMMDD')
FROM DUAL;

SELECT TO_DATE('140630', 'YYMMDD')
FROM DUAL; -- 2014��

SELECT TO_DATE('880218', 'YYMMDD')
FROM DUAL; -- 20880218�⵵�� ���õ�

SELECT TO_DATE('880218', 'RRMMDD')
FROM DUAL; 
-- ���ڸ� �⵵�� ���� RR������ ������������ => 50�� �̻��̸� 19, 50 �̸��̸� 20�� �ٴ´�.

/* 
    CHARACTER => NUMBER
    - TO_NUMBER(CHARACTER, ����) : ���ڿ� �����͸� ���������� ��ȯ(������� NUMBER)
*/

-- �ڵ�����ȯ�� ����(���ڿ� -> ����)
SELECT '123'+'456'
FROM DUAL; -- 579 : �ڵ�����ȯ ��Ų�� ������� ����

SELECT '10,000,000' + '550,000'
FROM DUAL; -- ����(,)�� ���ԵǾ��ֱ⶧���� �ڵ�����ȯ�� �ȵ�

SELECT TO_NUMBER('0123')
FROM DUAL; -- 123

SELECT TO_NUMBER('10,000,000', '99,999,999') + TO_NUMBER('550,000','999,999')
FROM DUAL; 

-- ���ڿ�, ����, ��¥ ����ȯ(TO_CHAR, TO_NUMBER, TO_DATE)
---------------------------------------------------------------------------------------------
-- NULL : ���� �������� ������ ��Ÿ���� ��
-- NULL ó�� �Լ��� : NVL , NVL2, NULLIF
/* 
    <NULL ó�� �Լ�>
    
    NVL(�÷���, �ش��÷����� NULL�� ��� ��ȯ�� ��ȯ��)
    �ش��÷��� ���� �����Ұ�� ������ Į������ ��ȯ
    Į���� ���� �������� ������� ���� ������ ���� ��ȯ��.
*/

-- �����, ���ʽ�, ���ʽ������°�� 0���� �ٲ㼭 ���
SELECT EMP_NAME, BONUS , NVL(BONUS , 0)
FROM EMPLOYEE;

-- ���ʽ� ���� ���� ��ȸ
SELECT EMP_NAME, (SALARY + (SALARY * NVL(BONUS , 0))) * 12 AS "���ʽ� ���� ����"
FROM EMPLOYEE;

/* 
    NVL2(�÷���, �����1, �����2)
    �ش� �÷����� NULL�� �ƴҰ�� �����1 ��ȯ
    �ش� �÷����� NULL�� ��� �����2 ��ȯ
*/

-- �̸� + ���ʽ� + ���ʽ��� �ִ� ����� '���ʽ��� ����' , ���ʽ��� ���� ����� '���ʽ� ����'
SELECT EMP_NAME, BONUS , NVL2(BONUS,'���ʽ��� ����','���ʽ� ����') AS ���ʽ�����
FROM EMPLOYEE;
-- �̸� + �μ��ڵ� + �μ��ڵ尡 �ִ»���� '�μ���ġ�Ϸ�', ���»���� '����' ��ȸ
SELECT EMP_NAME, DEPT_CODE, NVL2(DEPT_CODE, '�μ���ġ�Ϸ�','����') AS �μ���ġ����
FROM EMPLOYEE;

/* 
    NULLIF(�񱳴��1, �񱳴��2) : �����
    �ΰ��� ������ ��� NULL��ȯ
    �ΰ��� ��������������� �񱳴��1 ��ȯ
*/
SELECT NULLIF('123','123')
FROM DUAL;

SELECT NULLIF('123','456')
FROM DUAL;

----------------------------------------------------------
-- �����Լ� : DECODE => SWITCH��
--           CASE WHEN THEN ���� => IF��
/* 
    <�����Լ�>
    - DECODE(�񱳴�� , ���ǰ�1, �����1, ���ǰ�2, �����2, ���ǰ�3,�����3,..... , �����)
    
    - �ڹ��� SWITHC���� ����
    switch(�񱳴��){
    case ���ǰ�1 : �����1; break;
    case ���ǰ�2 : �����2; break;
    ....
    default : �����
    }
    
    �񱳴�󿡴� �÷�, �������, �Լ��� ���� �ִ�.
*/

-- ���, �����, �ֹε�Ϲ�ȣ, �ֹε�Ϲ�ȣ�κ��� ���� �ڸ��� �����ؼ� 1�̸� ����, 2�� ���� ����Į�� �����
SELECT EMP_ID,EMP_NAME, EMP_NO ,
DECODE(SUBSTR(EMP_NO,8,1) , 1 ,'����', 2 , '����' ) "����"
FROM EMPLOYEE;

-- �������� �޿��� �λ���Ѽ� ��ȸ
-- �����ڵ尡 'J7'�� ����� �޿��� 10%�λ��ؼ� ��ȸ
-- �����ڵ尡 'J6'�� ����� �޿��� 15%�λ��ؼ� ��ȸ
-- �����ڵ尡 'J5'�� ����� �޿��� 20%�λ��ؼ� ��ȸ
-- �� ���� �����ڵ�� �޿��� 5%�� �λ��ؼ� ��ȸ
-- �����, �����ڵ�, ������ �޿��� �����ı޿��� ���
SELECT
    EMP_NAME,
    JOB_CODE,
    SALARY,
    DECODE(JOB_CODE, 'J7', SALARY * 1.1 , 'J6', SALARY *1.15 , 'J5' , SALARY * 1.2 , SALARY * 1.05)
    "������ �޿�"
FROM EMPLOYEE;
/*
    CASE WHEN THEN ����
    - DECODE �����Լ��� ���ϸ� DECODE�� �ش� ���ǰ˻�� ����񱳸��� ����
    
    CASE WHEN THEN������ ��� Ư�� ������ �� ������� ���� ����
    [ǥ����]
    CASE WHEN ���ǽ�1 THEN �����1
         WHEN ���ǽ�2 THEN �����2
         WHEN ���ǽ�3 THEN �����3
         ...
         ELSE �����
    END;    
*/
SELECT
    EMP_NAME,
    JOB_CODE,
    SALARY,
    CASE WHEN JOB_CODE = 'J7' THEN SALARY * 1.1
         WHEN JOB_CODE = 'J6' THEN SALARY * 1.15
         WHEN JOB_CODE = 'J5' THEN SALARY * 1.2
         ELSE SALARY*1.05
    END "������ �޿�"
FROM EMPLOYEE;

-- �����, �޿�, �޿����(SAL_LEVELĮ�� ������)
-- �޿���� : SALARY ���� 500����� �ʰ��� ��� '���'
--                       500���� ���� 350���� �ʰ� �ϰ�� '�߱�'
--                       350���� ������ ��� '�ʱ�'
-- CASE WHEN THEN�������� �ۼ��غ���.
SELECT
    EMP_NAME, SALARY ,
    CASE WHEN SALARY > 5000000 THEN '���'    
         WHEN SALARY > 3500000 THEN '�߱�'
         ELSE '�ʱ�'
    END �޿����
FROM EMPLOYEE;

-------------------------------������� ������ �Լ�--------------------------------

--�׷��Լ� : �����͵��� ��(SUM), �����͵��� ���(AVG)
/* 
    N���� ���� �о 1���� ����� ��ȯ(�ϳ��� �׷캰�� �Լ� ���� ��� ��ȯ)
*/
-- 1. SUM(����Ÿ���÷�) : �ش� Į�������� �� �հ踦 ��ȯ���ִ� �Լ�
-- ��ü ������� �� �޿� �հ�
SELECT SUM(SALARY)
FROM EMPLOYEE;

-- �μ��ڵ尡 'D5'�λ������ �� �޿� �հ�
SELECT SUM(SALARY)
FROM EMPLOYEE 
WHERE DEPT_CODE ='D5';

-- 2. AVG(����Ÿ���÷�) : �ش�Į�������� ����� ���ؼ� ��ȯ
-- ��ü ������� ��� �޿�
SELECT ROUND(AVG(SALARY))
FROM EMPLOYEE;

-- 3. MIN(ANYŸ��) : �ش� Į�������� ���� �������� ��ȯ
-- ��ü ������� �����޿�, ���� ���� �̸���, �������� �̸��ϰ�, �Ի����� ���� ������ ���
SELECT
      MIN(SALARY) , MIN(EMP_NAME) , MIN(EMAIL) , MIN(HIRE_DATE)
FROM EMPLOYEE;

-- 4. MAX(ANYŸ���÷�) : �ش�Į�������� ���� ū���� ��ȯ
SELECT
      MAX(SALARY) , MAX(EMP_NAME) , MAX(EMAIL) , MAX(HIRE_DATE)
FROM EMPLOYEE;

-- 5. COUNT(*/�÷��̸�/DISTINCT �÷��̸�) ��ȸ�� ���� ������ ���� ��ȯ
-- COUNT(*) : ��ȸ����� �ش��ϴ� ��� ���� ������ �� ���� ��ȯ
-- COUNT(Į���̸�) : ������ �ش�Į���� ���� NULL�� �ƴ� �͸� ���� ��ȯ
-- COUNT(DISTINCT �÷��̸�) : ������ �ش� Į������ �ߺ����� ������� �ϳ��θ� ���� ��ȯ

-- ��ü ������� ���� ��ȸ
SELECT COUNT(*)
FROM EMPLOYEE; -- 23

-- ������ ������� ��ȸ
SELECT COUNT(*)
FROM EMPLOYEE
WHERE SUBSTR(EMP_NO,8,1) = '2';

-- �μ���ġ�� �Ϸ�� ���� �����
SELECT COUNT(DEPT_CODE)
FROM EMPLOYEE
-- WHERE SUBSTR(EMP_NO,8,1) = '2' AND DEPT_CODE IS NOT NULL;
WHERE SUBSTR(EMP_NO,8,1) = '2';

-- ���� ������� �����ִ� �μ��� ����
SELECT COUNT(DISTINCT DEPT_CODE)
FROM EMPLOYEE;

---------------------------------------------------------------
-- EMPLOYEE���̺��� ������, �μ��ڵ�, �������, ���� ��ȸ
-- (��, ��������� �ֹι�ȣ���� �����ؼ� 00�� 00�� 00�Ϸ� ��µǰ��ϸ�
-- ���̴� �ֹι�ȣ���� ��¥�����ͷ� ��ȯ�� ���� ���)
SELECT EMP_NAME "������",
       DEPT_CODE "�μ��ڵ�",
       -- SUBSTR(EMP_NO,1,2) || '�� ' || SUBSTR(EMP_NO,3,2) ||'�� ' || SUBSTR(EMP_NO,5,2) || '��'
       TO_CHAR(TO_DATE(SUBSTR(EMP_NO,1,6) , 'YYMMDD' ) , 'YY"��" MM"��" DD"��"') AS �������,
       EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM TO_DATE(SUBSTR(EMP_NO,1,2) , 'RRRR' )) "����"
FROM EMPLOYEE;




