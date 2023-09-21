/*
    * DDL(DATA DEFINISTION LANGUAGE)
    ������ ���� ���
    
    ��ü���� ���Ӱ� ����(CREATE)�ϰ�, ����(ALTER)�ϰ�, ����(DROP)�ϴ� ��ɾ�
    
    1. ALTER
    ��ü ������ �������ִ� ����
    
    <���̺� ����>
    [ǥ����]
    ALTER ��ü��(TABLE, INDEX, USER...) ���̺�� �����ҳ���;
    
    - ������ ����
    1) Į�� �߰�/ ���� / ����
    2) �������� �߰� / ���� => ���� XX
    (�����ϰ��� �Ѵٸ� ������ ���Ӱ� �߰��ؾ���)
    3) ���̺��/ �÷��� /�������Ǹ� ��������.
*/

-- 1) �÷� �߰�/����/����
-- 1_1) Į�� �߰� (ADD) : ADD �߰���Į���� �ڷ��� [DEFAULT �⺻��] 
SELECT * FROM DEPT_COPY;

-- CNAME Į�� �߰��ϱ�
ALTER TABLE DEPT_COPY ADD CNAME VARCHAR2(20);
-- ���ο� Į���� �߰��ǰ�, NULL������ ä������

-- LNAMEĮ�� �߰� DEFAULT������ '�ѱ�' �̶�� �����ϱ�.
ALTER TABLE DEPT_COPY ADD LNAME VARCHAR2(20) DEFAULT '�ѱ�';

-- 1_2) Į�� ����(MODIFY)
--      �÷��� �ڷ��� ���� : MODIFY ������ Į���� �ٲٰ����ϴ� �ڷ���
--      DEFAULT�� ������  : MODIFY ������ Į���� DEFAULT �ٲٰ����ϴ� �⺻��

-- DEPT_COPY���̺��� DEPT_ID�� �ڷ����� CHAR(3)�� ����
ALTER TABLE DEPT_COPY MODIFY DEPT_ID CHAR(3);

-- ���� �����ϰ����ϴ� Į���� �̹� ����ִ� ���� ������ �ٸ� Ÿ������ �����غ���(�Ұ���X)
-- "column to be modified must be empty to change datatype"
ALTER TABLE DEPT_COPY MODIFY DEPT_ID NUMBER;

-- ���� �����ϰ����ϴ� Į���� �̹� ����ִ� ������ �� ���� ũ��� �����غ���(�Ұ���X)
-- cannot decrease column length because some value is too big 
ALTER TABLE DEPT_COPY MODIFY DEPT_ID CHAR(1);

--> ���� -> ����(X) / ������ ���(X) / ������ Ȯ�� (0)

-- �ѹ��� �������� Į�� ���� ����
-- DEPT_TITLEĮ���� ������ Ÿ���� VARCHAR2(4)���� , 
-- LOCATION_ID �÷��� ������Ÿ���� VARCHAR2(2)��
-- LNAME�÷��� �⺻���� '�̱�'����
ALTER TABLE DEPT_COPY
MODIFY DEPT_TITLE VARCHAR2(40)
MODIFY LOCATION_ID VARCHAR2(2)
MODIFY LNAME DEFAULT '�̱�';

-- 1_3) �÷� ����(DROP COLUMN) : DROP COLUMN �����ϰ����ϴ� Į����
CREATE TABLE DEPT_COPY2
AS SELECT * FROM DEPT_COPY; 

-- DEPT_COPY2���̺� DEPT_IDĮ�� �����.
ALTER TABLE DEPT_COPY2 DROP COLUMN DEPT_ID;

SELECT * FROM DEPT_COPY2;

-- ROLLBACK���� ������ �ȵ�.(��� DDL�� ��ü)
ROLLBACK;

-- ����÷���������
ALTER TABLE DEPT_COPY2 DROP COLUMN DEPT_TITLE;
ALTER TABLE DEPT_COPY2 DROP COLUMN LOCATION_ID;
ALTER TABLE DEPT_COPY2 DROP COLUMN CNAME;

ALTER TABLE DEPT_COPY2 DROP COLUMN LNAME;
-- "cannot drop all columns in a table"
-- ������ Į���� �����Ҽ� ����.

SELECT * FROM DEPT_COPY2;

-- 2) �������� �߰� / ����
/* 
    2_2) �������� �߰�
    
    - PRIMAKRY KEY : ADD PRIMARY KEY(�÷���);
    - FOREIGN  KEY : ADD FOREIGN KEY(�÷���) REFERENCES ���������̺��[(������Į����)]
    - UNIQUE       : ADD UNIQUE(Į����);
    - CHECK        : ADD CHECK(�÷��� ���� ����);
    ==============================================
    - NOT NULL     : MODIFY �÷��� NOT NULL;
    
    ������ �������Ǹ��� �ο��ϰ��� �Ѵٸ�, CONSTRAINT �������Ǹ� �տ��ٰ� ���̱�    
*/

/*
    DEPT_COPY���̺�κ���
    - DEPT_IDĮ���� PRIMARY KEY �������� �߰�
    - DEPT_TITLEĮ���� UNIQUE �������� �߰�
    - LNAME�÷��� NOT NULL �������� �߰�
*/
ALTER TABLE DEPT_COPY
ADD CONSTRAINT DCOPY_PK PRIMARY KEY(DEPT_ID)
ADD CONSTRAINT DCOPY_UQ UNIQUE(DEPT_TITLE)
MODIFY LNAME CONSTRAINT DCOPY_NN NOT NULL;

/*
    2_2) �������� ����
    PRIMARY KEY , FORIGEN KEY ,UNIQUE, CHECK : DROP CONSTRAINT �������Ǹ�
    NOT NULL : MODIFY Į���� NULL;
*/

-- DEPT_COPY���̺�κ��� DCOPY_PK �������� �����
ALTER TABLE DEPT_COPY DROP CONSTRAINT DCOPY_PK;

-- ������ �������� ����
ALTER TABLE DEPT_COPY
DROP CONSTRAINT DCOPY_UQ
MODIFY LNAME NULL;

-- 3) �÷��� / �������Ǹ�/ ���̺�� ����(RENAME)
-- 3_1) Į���� ���� : RENAME COLUMN �����÷��� TO �ٲ��÷���
-- DEPT_COPY ���̺��� DEPT_TITLE�� DEPT_NAME���� �ٲٱ�
ALTER TABLE DEPT_COPY RENAME COLUMN DEPT_TITLE TO DEPT_NAME;

-- 3_2) �������Ǹ� ���� : REANME CONSTRAINT �����������Ǹ� TO �ٲ��������Ǹ�
-- DEPT_COPY���̺��� SYS_C007149�� DCOPY_DID_NN�� �ٲٱ�
ALTER TABLE DEPT_COPY RENAME CONSTRAINT SYS_C007149 TO DCOPY_DID_NN;

-- 3_3) ���̺�� ���� : RENAME [�������̺��] TO �ٲ����̺��
-- DEPT_COPY���̺� �̸��� DEPT_TEST�� ����
ALTER TABLE DEPT_COPY RENAME TO DEPT_TEST; -- ���� ���̺� �̸��� �̹� �������Ƿ� ���� ����.

SELECT * FROM DEPT_TEST;
----------------------------------------------------------------------------------------
/*
    2. DROP
    ��ü�� �����ϴ� ����
    
    [ǥ����]
    DROP TABLE �����ϰ����ϴ� ���̺��̸�.
*/
--EMP_NEW ����
DROP TABLE EMP_NEW;

-- �θ����̺��� �����Ұ���? �׽�Ʈ ȯ�� �����
-- 1) DEPT_TEST���̺� DEPT_ID�÷��� ���� PRIMARY KEY �������� �߰���Ű��
ALTER TABLE DEPT_TEST
ADD CONSTRAINT DCOPY_PK PRIMARY KEY(DEPT_ID);
-- EMPLOYEE_COPY3�� �ܷ�Ű(DEPT_CODE)�� �߰�(�ܷ�Ű �̸� : ECOPY_FK)
-- 2) �̶� �θ����̺��� DEPT_TEST���Ϻ��� DEPT_IDĮ���� ������ų��.
ALTER TABLE EMPLOYEE_COPY3
ADD CONSTRAINT ECOPY_FK FOREIGN KEY(DEPT_CODE) REFERENCES DEPT_TEST;

-- �θ����̺� ����
DROP TABLE DEPT_TEST;
-- ORA-02449: unique/primary keys in table referenced by foreign keys

-- ��, ��𼱰��� �����ǰ� �ִ� �θ����̺���� �������� �ʴ´�.
-- ���࿡ �θ����̺��� �����ϰ�ʹٸ�?
-- ���1) �ڽ����̺��� ���� �������� �θ����̺��� �����Ѵٸ� OK
DROP TABLE �ڽ����̺�;
DROP TABLE �θ����̺�;

-- ���2) �θ����̺� �����ϵ�, �¹����ִ� �ܷ�Ű �������ǵ� �Բ� �����ϴ� ���
-- DROP TABLE �θ����̺�� CASCADE CONSTRAINT;
DROP TABLE DEPT_TEST CASCADE CONSTRAINT;







