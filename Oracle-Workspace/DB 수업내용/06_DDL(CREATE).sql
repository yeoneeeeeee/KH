/* 
    *DDL(DATA DEFINITION LANGUAGE) : ������ ���� ���
    
    ����Ŭ���� �����ϴ� ��ü(OBJECT)��
    ������ �����(CREATE) ������ �����ϰ�(ALTER) ������ ����(DROP)�ϴ� ��ɹ�
    ��, ������ü�� �����ϴ� ���� DB������, �����ڰ� �����.
    
    ����Ŭ������ ��ü(DB�� �̷�� ��������)
    ���̺�(TABLE), �����(USER), �Լ�(FUNCTION) , ��(VIEW), ������(SEQUENCE), �ε��� ���...        
*/
/*
    <CREATE TABLE>
    
    ���̺� : ��(ROW) , ��(COLUMN)�� �����Ǵ� ���� �⺻���� �����ͺ��̽� ��ü ������ �ϳ�
            ��� �����ʹ� ���̺��� ���ؼ� �����(�����͸� �����ϰ����Ϸ��� ������ ���̺��� �������Ѵ�)
            
    [ǥ����]
    CREATE TABLE ���̺�� (
    �÷��� �ڷ���,
    �÷��� �ڷ���,
    �÷��� �ڷ���,
    ...
    )
    
    <�ڷ���>
    - ���� (CHAR(ũ��)/VARCHAR2(ũ��)) : ũ��� BYTE��
                                    (����, ������ ,Ư������ => 1���ڴ� 1BYTE)
                                    (�ѱ� => 1���ڴ� 2/3BYTE)
           CHAR(����Ʈ��) : �ִ� 2000BYTE���� ��������
                           ��������(�ƹ��� �������� ���͵� �������� ä���� ó�� �Ҵ��� ũ�⸦ �����ϰڴ�.)
                           �ַ� ���� ���� ���ڼ��� ������ ������� ���
                           EX) ���� : ��/�� , M/F
                            �ֹι�ȣ : 6-7 => 14���� => 14BYTE
          VARCHAR2(����Ʈ��) : �ִ� 4000BYTE���� ��������
                              ��������(���� ���� ���� ��� �� ��� ���� �����缭 ũ�Ⱑ �پ���.)
                              �ַ� ���� ���� ���ڼ��� ���������� ������� ���
                              ��) �̸�, ���̵�, ��й�ȣ, �̸���..
          ���� (NUMBER) : ����/�Ǽ� ������� NUMBER
          ��¥ (DATE)   : ��/��/��/��/��/�� �������� �ð��� ����
*/
-->> ȸ������ �����͸� ������� ���̺� ���� 
CREATE TABLE MEMBER(
    MEMBER_ID VARCHAR2(20), -- ��ҹ��� ����X , ��Ÿ��ǥ����� �������� -> ����ٷ� ������.
    MEMBER_PWD VARCHAR2(20),
    MEMBER_NAME VARCHAR2(20),
    MEMBER_BDATE DATE
);
-- ���̺� Ȯ�ι��1
SELECT * FROM MEMBER;

-- ���̺� Ȯ�ι��2 : ������ ��ųʸ� �̿�
-- ������ ��ųʸ�  : �پ��� ��ü���� ������ �����ϰ��ִ� �ý��� ���̺�
SELECT *
FROM USER_TABLES;
-- USER_TABLES: ���� �� ����� ������ ������ �ִ� ���̺���� �������� ������ Ȯ���Ҽ��ִ� ������ ��ųʸ�.

SELECT *
FROM USER_TAB_COLUMNS; -- �÷��� Ȯ���ϴ� ���

/*
    Į���� �ڸ�Ʈ �ޱ�(Į���� ���� ����)
    [ǥ����]
    COMMENT ON COLUMN ���̺��.�÷��� IS '�ּ�����';
*/
COMMENT ON COLUMN MEMBER.MEMBER_ID IS 'ȸ�����̵�';
-- MEMBER_PWD : ȸ����й�ȣ
COMMENT ON COLUMN MEMBER.MEMBER_PWD IS 'ȸ����й�ȣ';
-- MEMBEr_NAME : ȸ���̸�
COMMENT ON COLUMN MEMBER.MEMBER_NAME IS 'ȸ���̸�';
-- MEMBER_BDATE : �������
COMMENT ON COLUMN MEMBER.MEMBER_BDATE IS '�������';

-- INSERT(�����͸� �߰��� ���ִ� ����) => DML��
-- �� ������ �߰�(���� �������� �߰�), �߰��� ���� ���(���� ���� �߿�!)
-- INSERT INTO ���̺�� VALUES(ù��° Į���� ��, �ι�° Į���� ��, ... )

INSERT INTO MEMBER VALUES('user01','pass01','ȫ�浿','99/05/10');

INSERT INTO MEMBER VALUES('user02','pass02','�谩��','1980-10-06');

INSERT INTO MEMBER VALUES('user03','pass03','�ڸ���',SYSDATE);

INSERT INTO MEMBER VALUES(NULL,NULL,NULL,SYSDATE); -- ���̵�, ��й���,�̸��� NULL���� �����ص� �ǳ�?
INSERT INTO MEMBER VALUES('user03','pass03','�ڸ���',SYSDATE); -- �ߺ��� ���̵� �����ص� �ǳ�? 

-- ���� NULL���̳� �ߺ��� ���̵��� ��ȿ���� ���� �����̴�
-- ��ȿ�� �����Ͱ��� �����ϱ� ���ؼ� ���������� �ɾ�����Ѵ�.
/*
    <�������� CONSTRAINTS>
    
    - ���ϴ� �����Ͱ��� �����ϱ� ���ؼ� (�����ϱ� ���ؼ�) Ư�� �÷����� �����ϴ� ����
      (������ ���ἳ ������ ��������)
    - ���������� �ο��� �÷��� ���� �����Ϳ� ������ �ִ��� ������ �ڵ����� �˻��� ����
    
    - ���� : NOT NULL, UNIQUE, CHECK, PRIMARY KEY , FOREIGN KEY
    
    - �÷��� ���������� �ο��ϴ� ��� : �÷�������� / ���̺������
*/

/*
    1. NOT NULL ��������
       �ش� �÷��� �ݵ�� ���� �����ؾ߸� �� ��� ���
       => �� NULL���� ���� ���ͼ��� �ȵǴ� �÷��� �ο��ϴ� ��������
         ����/������ NULL���� ������� �ʵ��� �����ϴ� ��������
         
         �÷����� ������θ� ��� ����.
*/

-- NOT NULL ���������� ������ ���̺� �����
-- �÷�������� : �÷��� �ڷ��� �������� => ���������� �ο��ϰ����ϴ� �÷� �ڿ� ��ٷ� ����ϴ� ���.
CREATE TABLE MEM_NOTNULL(
    MEM_NO NUMBER NOT NULL,
    MEM_ID VARCHAR2(20) NOT NULL,
    MEM_PWD VARCHAR2(20) NOT NULL,
    MEM_NAME VARCHAR2(20) NOT NULL,
    GENDER CHAR(3),
    PHONE VARCHAR2(15),
    EMAIL VARCHAR2(30) 
);

INSERT INTO MEM_NOTNULL 
VALUES (1, 'user01', 'pass01' ,'���','��','010-1111-1111','aksrydaks@naver.com');

SELECT * FROM MEM_NOTNULL;

INSERT INTO MEM_NOTNULL 
VALUES (2, 'user01', 'pass01' ,NULL,'��','010-1111-1111','aksrydaks@naver.com');
-- DDL ������ MEM_NOTNULL���̺� NOTNULL���������� �ο��� Į���鿡 NULL���� �������
-- ������ �߻���.
INSERT INTO MEM_NOTNULL 
VALUES (1, 'user01', 'pass01' ,'���',NULL,NULL,NULL);

/* 
    2. UNIQUE ��������
       Į���� �ߺ����� �����ϴ� ��������
       ����/ ���� �� ������ �ش� �÷��� �߿� �ߺ����� �������
       �߰� , ������ �����ʰ� ����
       
       Į��/���̺������ �� �� ����    
*/

CREATE TABLE MEM_UNIQUE(
    MEM_NO NUMBER NOT NULL,
    MEM_ID VARCHAR2(20) NOT NULL UNIQUE, -- �÷��������
    MEM_PWD VARCHAR2(20) NOT NULL,
    MEM_NAME VARCHAR2(20) NOT NULL,
    GENDER CHAR(3),
    PHONE VARCHAR2(15),
    EMAIL VARCHAR2(30) 
);

DROP TABLE MEM_UNIQUE;

-- ���̺� ������� : ��� Į���� �� ����ϰ�, �� ���Ŀ� ���������� ����
CREATE TABLE MEM_UNIQUE(
    MEM_NO NUMBER NOT NULL,
    MEM_ID VARCHAR2(20) NOT NULL, 
    MEM_PWD VARCHAR2(20) NOT NULL,
    MEM_NAME VARCHAR2(20) NOT NULL,
    GENDER CHAR(3),
    PHONE VARCHAR2(15),
    EMAIL VARCHAR2(30) ,
    UNIQUE(MEM_ID) -- ���̺� ���� ���
);

INSERT INTO MEM_UNIQUE
VALUES(1,'user02','pass01','rudals','ska','010-1111-2222','abc@naver.com');

/* 
    UNIQUE �������ǿ� ����Ǿ����Ƿ� INSERT ����
    ����÷��� ��� �������ִ��� ��ü������ �˷����� ����
    DDL.SYS_C007062 : ���������� �̸����θ� �����������踦 �˷��ش�.
    �������ǽ� �ο��� ���� �������Ǹ��� ���������������� �ý��ۿ��� ������ �������Ǹ��� �ο�����.
*/
COMMIT;
/* 
    * �������� �ο��� �������Ǹ� �����ϴ� ǥ���
    
    > �÷��������
    CREATE TABLE ���̺��(
        �÷��� �ڷ��� ��������1 ��������2,
        �÷��� �ڷ��� [CONSTRAINT �������Ǹ�] ��������,
        ...
    );
    
    > ���̺������
    CREATE TABLE ���̺��(
        �÷��� �ڷ��� ,
        ...
        
        [CONSTRAINT ���������̸�] ��������(Į����)
    );
    => �ι�� ��� CONSTRAINT ���������̸��� ���������޾���(�ý����� ������ �̸��� �ο�����)
*/

CREATE TABLE MEM_CON_NM(
    MEM_NO NUMBER NOT NULL,
    MEM_ID VARCHAR2(20) NOT NULL, 
    MEM_PWD VARCHAR2(20) NOT NULL,
    MEM_NAME VARCHAR2(20) CONSTRAINT MEM_NAME_NN NOT NULL, -- �÷�������� �������Ǹ� �ο�
    GENDER CHAR(3),
    PHONE VARCHAR2(15),
    EMAIL VARCHAR2(30) ,
    CONSTRAINT MEM_ID_UQ UNIQUE(MEM_ID) -- ���̺� ���� ���
);

INSERT INTO MEM_CON_NM
VALUES(1,'user01','pass01','�ΰ��',NULL,NULL,NULL);

INSERT INTO MEM_CON_NM
VALUES(2,'user03','pass02','�ΰ��2','D',NULL,NULL);
-- � �÷��� ������� ������������ �ѹ��� Ȯ�ΰ���

INSERT INTO MEM_CON_NM
VALUES(1,'user02','pass02',NULL,NULL,NULL,NULL);

-- GENDERĮ���� '��', '��'��� ���� ���� �ϰ� ����

/* 
    3. CHECK ��������
       �÷��� ��ϵ� �� �ִ� ���� ���� ������ ������ �� �ִ�.
       ��) ���� '��' Ȥ�� '��'�� �����Բ� �ϰ� �ʹ�.
       
       [ǥ����]
       CHECK (���ǽ�)
*/

CREATE TABLE MEM_CHECK(
    MEM_NO NUMBER NOT NULL,
    MEM_ID VARCHAR2(20) NOT NULL, 
    MEM_PWD VARCHAR2(20) NOT NULL,
    MEM_NAME VARCHAR2(20) NOT NULL, -- �÷�������� �������Ǹ� �ο�
    GENDER CHAR(3) CHECK( GENDER IN ('��','��')),
    PHONE VARCHAR2(15),
    EMAIL VARCHAR2(30),
    MEM_DATE DATE NOT NULL,
    UNIQUE(MEM_ID) -- ���̺� ���� ���
);
INSERT INTO MEM_CHECK
VALUES(1,'user01','pass01','�ΰ��','��',null,null,SYSDATE);

INSERT INTO MEM_CHECK
VALUES(1,'user02','pass01','�ΰ��',NULL,null,null,SYSDATE);
-- �߰������� NULL���� �� ������ �ϰ�ʹٸ� NOT NULL �������ǵ� ���� �ɾ��ָ� ��

/* 
    * DEFAULT ����
      Ư�� Į���� ���� ���� ���� �⺻�� ���� ����(���������� �ƴ�)
      
      EX) ȸ�������� �÷��� ȸ�������� ���Ե� ������ �ð��� ����ϰ�ʹ�
        => DEFAULT �������� SYSDATE�� �־��ָ��
*/

-- ȸ���������� �׻� SYSDATE�� �ް� �������

DROP TABLE MEM_CHECK;

CREATE TABLE MEM_CHECK(
    MEM_NO NUMBER NOT NULL,
    MEM_ID VARCHAR2(20) NOT NULL, 
    MEM_PWD VARCHAR2(20) NOT NULL,
    MEM_NAME VARCHAR2(20) NOT NULL, -- �÷�������� �������Ǹ� �ο�
    GENDER CHAR(3) CHECK( GENDER IN ('��','��')),
    PHONE VARCHAR2(15),
    EMAIL VARCHAR2(30),
    MEM_DATE DATE DEFAULT SYSDATE NOT NULL, -- DEFAULT�� ���� �;���
    UNIQUE(MEM_ID) -- ���̺� ���� ���
);

INSERT INTO MEM_CHECK
VALUES(1,'user01','pass01','�ΰ��','��',null,null,NULL);

INSERT INTO MEM_CHECK(MEM_NO, MEM_ID, MEM_PWD,MEM_NAME)
VALUES(1,'user01','passo1','�ΰ��');
-- ������ �ȵ� Į������ �⺻������ NULL���� ����
-- ���� DEFAULT���� �ο��Ǿ��ִٸ� NULL���� �ƴ� DEFAULT������ ���Եȴ�.

SELECT * FROM MEM_CHECK;
/* 
    4. PRIMARY KEY(�⺻Ű) ��������
       ���̺��� �� ����� ������ �����ϰ� �ĺ��� �� �ִ� Į���� �ο��ϴ� ��������
       -> �� ����� ������ �� �ִ� �ĺ����� ����
       ��) ���, �μ����̵�, �����ڵ�, �л���ȣ, Ŭ������ȣ...
       => �ĺ����� ���� : �ߺ�X , ���� ��� �ȵ�(NOT NULL + UNIQUE)
       
       ���ǻ��� : �� ���̺�� �Ѱ��� Į���� ��������
*/

CREATE TABLE MEM_PRIMARYKEY1(
    MEM_NO NUMBER CONSTRAINT MEM_PK PRIMARY KEY,
    MEM_ID VARCHAR2(20) NOT NULL, 
    MEM_PWD VARCHAR2(20) NOT NULL,
    MEM_NAME VARCHAR2(20) NOT NULL, -- �÷�������� �������Ǹ� �ο�
    GENDER CHAR(3) CHECK( GENDER IN ('��','��')),
    PHONE VARCHAR2(15),
    EMAIL VARCHAR2(30),
    MEM_DATE DATE DEFAULT SYSDATE NOT NULL, -- DEFAULT�� ���� �;���
    UNIQUE(MEM_ID) -- ���̺� ���� ���
);

INSERT INTO MEM_PRIMARYKEY1
VALUES(NULL,'user21', 'pass01','�ΰ��',null,null,null,DEFAULT);

CREATE TABLE MEM_PRIMARYKEY2(
    MEM_NO NUMBER ,
    MEM_ID VARCHAR2(20) NOT NULL PRIMARY KEY, 
    MEM_PWD VARCHAR2(20) NOT NULL,
    MEM_NAME VARCHAR2(20) NOT NULL, -- �÷�������� �������Ǹ� �ο�
    GENDER CHAR(3) CHECK( GENDER IN ('��','��')),
    PHONE VARCHAR2(15),
    EMAIL VARCHAR2(30),
    MEM_DATE DATE DEFAULT SYSDATE NOT NULL, -- DEFAULT�� ���� �;���
    UNIQUE(MEM_ID), -- ���̺� ���� ���
    CONSTRAINT MEM_PK2 PRIMARY KEY(MEM_NO) -- ���̺������ 
);

CREATE TABLE MEM_PRIMARYKEY2(
    MEM_NO NUMBER ,
    MEM_ID VARCHAR2(20) NOT NULL, 
    MEM_PWD VARCHAR2(20) NOT NULL,
    MEM_NAME VARCHAR2(20) NOT NULL, -- �÷�������� �������Ǹ� �ο�
    GENDER CHAR(3) CHECK( GENDER IN ('��','��')),
    PHONE VARCHAR2(15),
    EMAIL VARCHAR2(30),
    MEM_DATE DATE DEFAULT SYSDATE NOT NULL, -- DEFAULT�� ���� �;���    
    CONSTRAINT MEM_PK2 PRIMARY KEY(MEM_NO,MEM_ID) -- ���̺������ 
);
-- PRIMARY KEY�� �����̺� 2���̻� ���ɼ� ����. ��, �� �÷��� �ϳ��ι�� �ϳ��� PRIMARY KEY�δ� ���� ����.
-- �ΰ��� �÷��� ��� PRIMARY KEY�� ����������� => ����Ű

DROP TABLE MEM_PRIMARYKEY2;

INSERT INTO MEM_PRIMARYKEY2
VALUES(1,'user01', 'pass01','�ΰ��',null,null,null,DEFAULT);

INSERT INTO MEM_PRIMARYKEY2
VALUES(1,'user02', 'pass01','�ΰ��',null,null,null,DEFAULT);

INSERT INTO MEM_PRIMARYKEY2
VALUES(2,'user02', 'pass01','�ΰ��',null,null,null,DEFAULT);

INSERT INTO MEM_PRIMARYKEY2
VALUES(2,'user02', 'pass01','�ΰ��',null,null,null,DEFAULT);
-- ����Ű�� ��� �� �÷��� ���� ������ �ߺ��Ǿ������ �������ǿ� ����ȴ�.

INSERT INTO MEM_PRIMARYKEY2
VALUES(NULL,'user02', 'pass01','�ΰ��',null,null,null,DEFAULT);
-- ����Ű�ϰ�� ���÷��� ���� NULL�̸� �������ǿ� ����ȴ�.

/* 
    5. FOREIGN KEY(�ܷ�Ű)
       �ش� �÷��� �ٸ� ���̺� �����ϴ� ���� ���;��ϴ� Į���� �ο��ϴ� ��������
       => "�ٸ����̺�(==�θ����̺�)�� �����Ѵ�" ��� ǥ��
          ��, ������ �ٸ� ���̺�(==�θ����̺�)�� �����ϰ� �ִ� ���� ���� �� �ִ�.
          ��) KH��������
          EMPLOYEE���̺�(�ڽ����̺�) <------ DEPARTMENT���̺�(�θ����̺�)
             DEPT_CODE              ---- DEPT_ID
          => DEPT_CODE���� DEPT_ID�� �����ϴ� ���鸸 ���ü� �ִ�.
          
       => FOREIGN KEY ������������ �ٸ����̺�� ���踦 ������ �� �ִ�.(JOIN)
       
       [ǥ����]
       > �÷����� ���
       �÷��� �ڷ��� CONSTRAINT �������Ǹ� REFERENCES ���������̺��(������Į����)
       
       > ���̺������
       CONSTRAINT �������Ǹ� FOREIGN KEY(�÷���) REFERENCES ���������̺��(������Į����)
       
       ���������̺� == �θ����̺�
       ���������Ѻκ� : CONSTRAINT �������Ǹ�, ������ Į����(���̺�,Į������ ��� ��������)
       => ������ Į������ �����Ǵ°�� �ڵ������� ������ ���̺��� PRIMARY KEY�� �ش��ϴ� �÷��� �����÷����� ������
       
       ���ǻ��� : ������ Į���� Ÿ��(�θ����̺�Į��) , �ܷ�Ű�� ������ Į��Ÿ��(�ڽ����̺�Į��)�� ���ƾ��Ѵ�.
*/
-- �θ����̺� �����
-- ȸ�� ��޿� ���� �����͸� �����ϴ� ���̺�
CREATE TABLE MEM_GRADE(
    GRADE_CODE CHAR(2) PRIMARY KEY, -- ����ڵ� / ���ڿ� 'G1', 'G2' ,...
    GRADE_NAME VARCHAR2(20) NOT NULL -- ��޸� / ���ڿ� (�Ϲ�ȸ��,���ȸ��,VIPȸ��)
);

INSERT INTO MEM_GRADE
VALUES('G1','�Ϲ�ȸ��');

INSERT INTO MEM_GRADE
VALUES('G2','���ȸ��');

INSERT INTO MEM_GRADE
VALUES('G3','Ư��ȸ��');

INSERT INTO MEM_GRADE
VALUES('G4','222Ư��ȸ��');
--�ڽ����̺�
--ȸ�������� ��� ���̺�
CREATE TABLE MEM(
    MEM_NO NUMBER PRIMARY KEY,
    MEM_ID VARCHAR2(20) NOT NULL, 
    MEM_PWD VARCHAR2(20) NOT NULL,
    MEM_NAME VARCHAR2(20) NOT NULL, -- �÷�������� �������Ǹ� �ο�
    GRADE_ID CHAR(2),
    -- GRADE_ID CHAR(2) REFERENCES MEM_GRADE, 
    GENDER CHAR(3) CHECK( GENDER IN ('��','��')),
    PHONE VARCHAR2(15),
    EMAIL VARCHAR2(30),
    MEM_DATE DATE DEFAULT SYSDATE NOT NULL, -- DEFAULT�� ���� �;���
    UNIQUE(MEM_ID), -- ���̺� ���� ���
    FOREIGN KEY(GRADE_ID) REFERENCES MEM_GRADE(GRADE_CODE) -- ���̺��� ���
);

INSERT INTO MEM(MEM_NO, MEM_ID, MEM_PWD,MEM_NAME, GRADE_ID)
VALUES(1,'user01','pass01','mkm','G1');

INSERT INTO MEM(MEM_NO, MEM_ID, MEM_PWD,MEM_NAME, GRADE_ID)
VALUES(2,'user02','pass01','mkm','G2');

INSERT INTO MEM(MEM_NO, MEM_ID, MEM_PWD,MEM_NAME, GRADE_ID)
VALUES(3,'user03','pass01','mkm','G3');

INSERT INTO MEM(MEM_NO, MEM_ID, MEM_PWD,MEM_NAME, GRADE_ID)
VALUES(4,'user04','pass01','mkm',NULL);
-- NULLL���� ���� �ȴ�. ��, �θ����̺� �������� �۴� ���� ���� �ȵȴ�.

SELECT MEM_ID , GRADE_NAME
FROM MEM
JOIN MEM_GRADE ON GRADE_ID = GRADE_CODE;

-- ����) �θ����̺��� �����Ͱ��� �����ȴٸ�?
-- MEM_GRADE���̺��� GRADE_CODE�� G3�� �����͸� ��������?
DELETE FROM MEM_GRADE
WHERE GRADE_CODE = 'G3';
-- �ڽ����̺��� ���� G3���� ����ϰ��ֱ� ������ �����Ҽ� ����.
-- ���� �ܷ�Ű �������� �ο��� ������ ���� �ɼ��� ������ �ο����� �������� 
-- => �⺻������ ���� ���� �ɼ��� �ɷ�����

/*
    * �ڽ����̺� ������ �ܷ�Ű ���������� �ο�������
    �θ����̺��� �����Ͱ� �����Ǿ��� �� �ڽ����̺����� ��� ó�������� �ɼ����� ���ص� �� �ִ�.
    
    * FOREIGN KEY ���� �ɼ�
    - ON DELETE SET NULL : �θ����͸� ������ �� �ش� �����͸� ����ϴ� �ڽĵ����͸� NULL�� �ٲٰڴ�.
    - ON DELETE CASCADE  : �θ����͸� ������ �� �ش� �����͸� ����ϴ� �ڽĵ����͸� ���� �����ϰڴ�.
    - ON DELETE RESTRICTED : ������ �����ϰڴ�(�⺻�ɼ�)
*/

DROP TABLE MEM;

CREATE TABLE MEM(
    MEM_NO NUMBER PRIMARY KEY,
    MEM_ID VARCHAR2(20) NOT NULL, 
    MEM_PWD VARCHAR2(20) NOT NULL,
    MEM_NAME VARCHAR2(20) NOT NULL, -- �÷�������� �������Ǹ� �ο�
    GRADE_ID CHAR(2),
    -- GRADE_ID CHAR(2) REFERENCES MEM_GRADE, 
    GENDER CHAR(3) CHECK( GENDER IN ('��','��')),
    PHONE VARCHAR2(15),
    EMAIL VARCHAR2(30),
    MEM_DATE DATE DEFAULT SYSDATE NOT NULL, -- DEFAULT�� ���� �;���
    UNIQUE(MEM_ID), -- ���̺� ���� ���
    FOREIGN KEY(GRADE_ID) REFERENCES MEM_GRADE(GRADE_CODE) ON DELETE SET NULL -- ���̺��� ���
);


INSERT INTO MEM(MEM_NO, MEM_ID, MEM_PWD,MEM_NAME, GRADE_ID)
VALUES(1,'user01','pass01','mkm','G1');

INSERT INTO MEM(MEM_NO, MEM_ID, MEM_PWD,MEM_NAME, GRADE_ID)
VALUES(2,'user02','pass01','mkm','G2');

INSERT INTO MEM(MEM_NO, MEM_ID, MEM_PWD,MEM_NAME, GRADE_ID)
VALUES(3,'user03','pass01','mkm','G3');

SELECT * FROM MEM;

-- �θ����̺��� GRADE_CODE�� G1�� ������ �����ϱ�
DELETE FROM MEM_GRADE
WHERE GRADE_CODE = 'G1';

SELECT * FROM MEM_GRADE;
SELECT * FROM MEM;
-- �������� �����ߵǰ�, G1�� �����ϴ� �ڽ� ���̺��� GRADE_ID���� G1��� NULL���� ����.
DROP TABLE MEM;

CREATE TABLE MEM(
    MEM_NO NUMBER PRIMARY KEY,
    MEM_ID VARCHAR2(20) NOT NULL, 
    MEM_PWD VARCHAR2(20) NOT NULL,
    MEM_NAME VARCHAR2(20) NOT NULL, -- �÷�������� �������Ǹ� �ο�
    GRADE_ID CHAR(2),
    -- GRADE_ID CHAR(2) REFERENCES MEM_GRADE, 
    GENDER CHAR(3) CHECK( GENDER IN ('��','��')),
    PHONE VARCHAR2(15),
    EMAIL VARCHAR2(30),
    MEM_DATE DATE DEFAULT SYSDATE NOT NULL, -- DEFAULT�� ���� �;���
    UNIQUE(MEM_ID), -- ���̺� ���� ���
    FOREIGN KEY(GRADE_ID) REFERENCES MEM_GRADE(GRADE_CODE) ON DELETE CASCADE -- ���̺��� ���
);

INSERT INTO MEM(MEM_NO, MEM_ID, MEM_PWD,MEM_NAME, GRADE_ID)
VALUES(1,'user01','pass01','mkm','G2');

INSERT INTO MEM(MEM_NO, MEM_ID, MEM_PWD,MEM_NAME, GRADE_ID)
VALUES(2,'user02','pass01','mkm','G2');

INSERT INTO MEM(MEM_NO, MEM_ID, MEM_PWD,MEM_NAME, GRADE_ID)
VALUES(3,'user03','pass01','mkm','G3');


SELECT * FROM MEM;

DELETE FROM MEM_GRADE
WHERE GRADE_CODE ='G2';

SELECT * FROM MEM_GRADE;
SELECT * FROM MEM;
-- �������� �� �����Ǿ���, �ڽ����̺��� GRADE_ID�� G2�� ����� �Բ� �����Ǿ����.

-- ���ι���
-- ��ü ȸ���� ȸ����ȣ , ���̵�, ��й�ȣ, �̸�, ��޸��� || ����Ŭ���뱸��, ANSI�������� ������ �ۼ�
SELECT MEM_NO, MEM_ID, MEM_PWD, MEM_NAME, GRADE_NAME
FROM MEM
JOIN MEM_GRADE ON GRADE_ID = GRADE_CODE;

SELECT MEM_NO, MEM_ID, MEM_PWD, MEM_NAME, GRADE_NAME
FROM MEM , MEM_GRADE
WHERE GRADE_ID = GRADE_CODE;
/* 
    �ܷ�Ű ���������� �ɷ����� �ʴ��� JOIN�� ������. ��, �� �÷��� ������ �ǹ��� �����Ͱ�
    ����־�� ���������� ��ȸ ������.
*/
---------------------------------------------------------------------------------
/*
    ------------------ ���⼭ ���ʹ� ���Ӱ��� KH !!!--------------------------------
    
    * SUBQUERY�� �̿��� ���̺� ����(���̺���)
    
    �������� : ���� SQL���� �����ϴ� ������ ������
    
    [ǥ����]
    CREATE TABLE ���̺��
    AS ��������;
*/

SELECT * FROM EMPLOYEE;

-- EMPLOYEE���̺��� ������ ���ο� ���̺� ����(EMPLOYEE_COPY)
CREATE TABLE EMPLOYEE_COPY
AS SELECT * FROM EMPLOYEE;

SELECT * FROM EMPLOYEE_COPY;
-- �÷���, ��ȸ����� �����͵� ����� �����
-- ��, ���������� NOT NULL �������Ǹ� �����
-- ���������� ���� ���̺��� ������ ��� ���������� NOT NULL�� �������Ǹ� �����

SELECT *
FROM EMPLOYEE
WHERE EMP_ID=0;
-- Ư�����̺��� �÷��� ������ �ʿ��ϰ�, �����ʹ� �ʿ���°�� ���ǽ������� Į������ ���ü��ֵ�.
SELECT *
FROM EMPLOYEE
WHERE 1 = 0; -- 1 = 0 == FALSE

SELECT *
FROM EMPLOYEE
WHERE 1 = 1; -- 1 = 1 == TRUE

CREATE TABLE EMPLOYEE_COPY2
AS SELECT * FROM EMPLOYEE WHERE 1=0;

SELECT * FROM EMPLOYEE_COPY2;

-- ��ü ������� �޿��� 300�����̻��� ������� ���, �̸� ,�μ��ڵ� , �޿� Į���� �����͸� �����Ͻÿ�
-- ���̺�� : EMPLOYEE_COPY3
CREATE TABLE EMPLOYEE_COPY3
AS SELECT EMP_ID , EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY>= 3000000;

SELECT * FROM EMPLOYEE_COPY3;
-- ��ü ����� ���, �޿�, ���� ��ȸ�� ����� ������ ���̺� ����(���빰����)
-- ���̺�� : EMPLOYEE_COPY4
CREATE TABLE EMPLOYEE_COPY4
AS SELECT EMP_ID, EMP_NAME , SALARY * 12 AS SALARY
FROM EMPLOYEE;
-- ���������� SELECT���� ������� �Ǵ� �Լ����� ����Ȱ�� �ݵ�� ��Ī�� �ο�������Ѵ�..!

SELECT * FROM EMPLOYEE_COPY4;





