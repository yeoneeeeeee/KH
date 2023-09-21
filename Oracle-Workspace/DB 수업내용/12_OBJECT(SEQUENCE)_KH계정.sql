/* 
    <������ SEQUENCE>
    
    �ڵ����� ��ȣ�� �߻������ִ� ������ �ϴ� ��ü(�ڵ���ȣ �ο���)
    �������� �ڵ����� ���������� �߻�������
    
    EX) ������ȣ, ȸ����ȣ, ���, �Խñ۹�ȣ��
    => ���������� ��ġ���ʴ� ���ڷ� ä���� �� ����� ����
    
    1. ��������ü ���� ����
    
    [ǥ����]
    CREATE SEQUENCE ��������
    START WITH ���� ���� => ���� ����, ó���߻���ų ���۰� �⺻���� 1
    INCREMENT BY ������  => ���� ���� �⺻���� 1�� ����, �ѹ� ������ �����Ҷ����� � �����Ұ��� ����
    MAXVALUE �ִ밪 => ��������, �ִ밪 ����
    MINVALUE �ּҰ� => ��������, �ּҰ� ����
    CYCLE/NOCYCLE  => ��������, ���� ��ȯ���θ� ����
    CACHE ����Ʈũ��/NOCACHE => ��������, ĳ�ø޸� ���� ����
                               �⺻ ĳ�� ������� 20BYTE
    * ĳ�ø޸�
    �������κ��� �̸� �߻��� ������ �����ؼ� �����صδ� ����
    �Ź� ȣ���Ҷ����� ������ ��ȣ�� �����ϴ°ͺ���
    ĳ�ø޸� ������ �̸� ������ ������ ������ ���� �Ǹ� �ξ� �ӵ��� ����
    ��, ������ ����� ���� ������ �� ������ �����Ǿ��ֶ� ������ ���󰡰� ����
*/

CREATE SEQUENCE SEQ_TEST;

-- ���� ������ ������ �����ϰ� �ִ� �������� ���� ���� ��ȸ�� ������ ��ųʸ�
SELECT * FROM USER_SEQUENCES;

CREATE SEQUENCE SEQ_EMPNO
START WITH 300
INCREMENT BY 5
MAXVALUE 310
NOCYCLE
NOCACHE;

/*
    2. ������ ��� ����
    
    ��������.CURRVAL : ���� �������� ��(���������� ���������� �߻��� NEXTVAL�� ��)
    ��������.NEXTVAL : ���� �������� ���� ������Ű��, �� ������ �������ǰ� 
                      == ��������.CURRVAL + INCREMENT_BY ����ŭ ������ ��
    
    ��, ������ ���� �� ù��° NEXTVAL�� START WITH���� ������ ���۰����� �߻��ȴ�.
        ������ ���� �� NEXTVAL�� ȣ����� ���� �������� CURRVAL�� ������ �Ұ�����.
*/
SELECT SEQ_EMPNO.CURRVAL FROM DUAL;
-- ORA-08002: sequence SEQ_EMPNO.CURRVAL is not yet defined in this session
-- �������� �����ǰ� ���� NEXTVAL�� �ѹ��̶󵵼������� �ʴ� �̻� CURRVAL�� �����Ҽ� ���⶧���� �߻��� ����
-- CURRVAL�� ���������� ���������� ����� NEXTVAL�� ���� �����ؼ� �����ִ� �ӽð��̱� ����.

SELECT SEQ_EMPNO.NEXTVAL FROM DUAL; -- 300
SELECT SEQ_EMPNO.CURRVAL FROM DUAL; -- 300

SELECT SEQ_EMPNO.NEXTVAL FROM DUAL; -- 305

SELECT * FROM USER_SEQUENCES;
-- LAST_NUMBER : ������ NEXTVAL�� �ѹ� ������ ��� ���ü� �ִ� ������.

SELECT SEQ_EMPNO.NEXTVAL FROM DUAL;
SELECT SEQ_EMPNO.CURRVAL FROM DUAL;

-- CURRVAL == 310 == MAXVALUE
SELECT SEQ_EMPNO.NEXTVAL FROM DUAL;
-- ORA-08004: sequence SEQ_EMPNO.NEXTVAL exceeds MAXVALUE and cannot be instantiated
-- ������ MAXVALUE���� �ʰ��߱⶧���� ���� �߻�

SELECT SEQ_EMPNO.CURRVAL FROM DUAL;
-- ���������� ����� NEXTVAL��

/*
    3. ������ ����
    
    [ǥ����]
    ALTER SEQUENCE ��������
    INCREMENT BY ������  => ���� ���� �⺻���� 1�� ����, �ѹ� ������ �����Ҷ����� � �����Ұ��� ����
    MAXVALUE �ִ밪 => ��������, �ִ밪 ����
    MINVALUE �ּҰ� => ��������, �ּҰ� ����
    CYCLE/NOCYCLE  => ��������, ���� ��ȯ���θ� ����
    CACHE ����Ʈũ��/NOCACHE => ��������, ĳ�ø޸� ���� ����
                               �⺻ ĳ�� ������� 20BYTE
    
    => START WITH�� ���� �Ұ� : �� �ٲٰ�ʹٸ� �������� �����ߴٰ� ����� �������.
*/
ALTER SEQUENCE SEQ_EMPNO
INCREMENT BY 10
MAXVALUE 400;

SELECT * FROM USER_SEQUENCES;

SELECT SEQ_EMPNO.CURRVAL FROM DUAL; -- 310
SELECT SEQ_EMPNO.NEXTVAL FROM DUAL; -- 320 == 310 + 10
-- �߰��� �������� ����Ǵ��� CURRVAL���� �����ȴ�.

DROP SEQUENCE SEQ_EMPNO;

-- �Ź� ���ο� ����� �߻��Ǵ� ������ ����(�������� : SEQ_EID)
CREATE SEQUENCE SEQ_EID
START WITH 300
INCREMENT BY 1
MAXVALUE 400;

-- ����� �߰��ɶ� ������ INSERT��
INSERT INTO EMPLOYEE(EMP_ID, EMP_NAME, EMP_NO, JOB_CODE, SAL_LEVEL, HIRE_DATE)
VALUES (SEQ_EID.NEXTVAL , '�ΰ�','123456-1234567','J2','S3',SYSDATE);

INSERT INTO EMPLOYEE(EMP_ID, EMP_NAME, EMP_NO, JOB_CODE, SAL_LEVEL, HIRE_DATE)
VALUES (SEQ_EID.NEXTVAL , ?, ?, ?, ?,SYSDATE);

SELECT * FROM EMPLOYEE;
-- �������� ���帹�� ���Ǵ� ��ġ�� INSERT���� PK���� ������

-- ����Ҽ� ���� ����
-- VIEW�� SELECT��
-- DISTINCT�� ���Ե� SELECT��
-- GROUP BY HAVING ORDER BY�� �ִ� SELECT�� 
-- ���������ȿ��� X
-- CREATE TABLE, ALTER TABLE�� DEFAULT�����ε� ����� �Ұ�����



















