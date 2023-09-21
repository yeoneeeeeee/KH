/* 
-- * DCL
    ������ ���� ���(Data Controller Language)
    
    �������� �ý��۱��� �Ǵ� ��ü���ٱ����� �ο�(grant)�ϰų� ȸ��(revoke)�ϴ� ���
    
    - ���� �ο� (grant)
      �ý��� ���� : Ư�� DB�� �����ϴ� ����, ��ü���� �����Ҽ� �ִ� ����
      ��ü���ٱ��� : Ư�� ��ü�鿡 �����ؼ� �����Ҽ� �ִ� ����
    
    - �ý��� ����
    [ǥ����]
    GRANT ����1, ����2 .. TO ������;
    
    - �ý��� ������ ����
      CREATE SESSION : ������ ������ �� �ִ� ����
      CREATE TABLE   : ���̺��� �����Ҽ� �ִ� ����
      CREATE VIEW    : �並 �����Ҽ� �ִ� ����
      CREATE SEQUENCDE : �������� �����Ҽ� �ִ� ����
      ....
*/
-- 1. SAMPLE ���� ����
CREATE USER SAMPLE IDENTIFIED BY SAMPLE;

-- 2. SAMPLE ������ �����ϱ� ���� CREATE SESSION ���� �ο�
GRANT CREATE SESSION TO SAMPLE; -- CREATE SESSION == CONNECT

-- 3_1. SAMPLE������ ���̺��� �����Ҽ��ִ� CREATE TABLE ���� �ο�
GRANT CREATE TABLE TO SAMPLE;

-- 3_2. SAMPLE������ ���̺����̽��� �Ҵ����ֱ�(SAMPLE ���� ����)
ALTER USER SAMPLE QUOTA 2M ON SYSTEM;
-- QUOTA : �� => �������ִ�, �Ҵ��ϴ�
-- 2M    : 2 Mega Byte

--4. SAMPLE������ �並 �����Ҽ��ִ� CREATE VIEW ���� �ο�
GRANT CREATE VIEW TO SAMPLE;

/*
    - ��ü����
    Ư�� ��ü���� ���� �Ҽ��ִ� ����
    ���� : SELECT, INSERT, UPDATE ,DELETE => DML.
    
    [ǥ����]
    GRANT �������� ON Ư����ü TO ������;
    
    ��������    |       Ư����ü
    =====================================
    SELECT      | TABLE, VIEW, SEQUENCE
    INSERT      | TABLE, VIEW
    UPDATE      | TABLE, VIEW
    DELETE      | TABLE, VIEW
*/
-- 5. SAMPLE ������ KH.EMPLOYEE���̺��� ��ȸ�� �� �ִ� ���� �ο�
GRANT SELECT ON KH.EMPLOYEE TO SAMPLE;

-- 6. SAMPLE ������ KH.DEPARMENT ���̺� ���� ������ �� �ִ� ���� �ο�
GRANT INSERT ON KH.DEPARTMENT TO SAMPLE;

-- �ּ����� ���Ѹ� �ο��ϰ��� �Ҷ� CONNECT, RESOURCE�� �ο�
-- GRANT CONNECT, RESOURCE TO ������; 
/* 
    <�� ROLE>
    Ư�� ���ѵ��� �ϳ��� �������� ��� ���� ��
    
    CONNECT : CREATE SESSION(�����ͺ��̽��� ������ ���ִ� ����)
    RESOURCE : CREATE TABLE, CREATE SEQUENCE , SELECT, INSERT , ....
               (Ư�� ��ü���� ���� �� �����Ҽ� �ִ� ���� == ������ �� �ִ� ����)
*/
----------------------------------------------------------------------------
/* 
    * ���� ȸ��( REVOKE)
    ������ �������� ����ϴ� ��ɾ�
    
    [ǥ����]
    REVOKE ����1, ����2, FROM ������;
*/
-- 7. SAMPLE �������� ���̺��� �����Ҽ� ������ ���� ȸ��
REVOKE CREATE TABLE FROM SAMPLE;

-- �ǽ�����--

-- ����ڿ��� �ο��� ���� : CONNECT, RESOURCE
-- ������ �ο����� ����� : MYMY

CREATE USER MYMY IDENTIFIED BY MYMY;
GRANT CONNECT, RESOURCE TO MYMY;

DROP USER MYMY;



