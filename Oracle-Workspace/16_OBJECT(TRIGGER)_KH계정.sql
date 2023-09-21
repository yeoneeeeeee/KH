/* 
    <Ʈ����>
    ���� ������ ���̺� INSERT, UPDATE, DELETE���� DML���� ���� ��������� ���涧(���̺� �̺�Ʈ�� �߻�������)
    �ڵ����� �Ź� ������ ������ �̸� �����صѼ� �ִ� ��ü
    
    EX) 
    ȸ��Ż��� ������ ȸ�����̺� ������ DELETE�� ��ٷ� Ż��� ȸ���鸸 ���� �����ϴ� ���̺� �ڵ����� INSERTó���ؾߵɶ�
    
    �Ű�Ƚ���� �������� �Ѿ����� ���������� �ش� ȸ���� ������Ʈ ó���ǰԲ� �Ѵٰų�
    
    ��������� �����Ͱ� ���(INSERT)�ɶ����� �ش� ��ǰ�� ���� �������� �Ź� ����(UPDATE)�ؾߵ� ��
    
    * Ʈ���� ����
    SQL���� ����ñ⿡ ���� �з�
     > BEFORE TRIGGER : ���� ������ ���̺� �̺�Ʈ(INSERT, UPDATE, DELETE)�� �߻��Ǳ����� Ʈ���� ����
     > AFTER  TRIGGER : ���� ������ ���̺� �̺�Ʈ�� �߻��� �� Ʈ���� ����
     
    SQL���� ���� ������ �޴� �� �࿡ ���� �з�
     > STATEMENT TRIGGER(����Ʈ����) : �̺�Ʈ�� �߻��� SQL���� ���� �� �ѹ��� Ʈ���� ����
     > ROW TRIGGER(�� Ʈ����)        : �ش� SQL�� �����Ҷ����� �Ź� Ʈ���� ����
                   > :OLD - BEFORE UPDATE(������ �ڷ�), BEFORE DELETE(������ �ڷ�)
                   > :NEW - AFTER INSERT(�߰����ڷ�)  , AFTER UPDATE(������ �ڷ�)
    
    * Ʈ���� ��������
    [ǥ����]
    CREATE OR REPLACE TRIGGER Ʈ���Ÿ�
    BEFORE|AFTER INSERT|DELETE|UPDATE ON ���̺��
    [FOR EACH ROW] -- ��Ʈ���ŷ� ����
    DECLARE
        ��������;
    BEGIN
        ���೻��(�ش� ���� ������ �̺�Ʈ �߻��� �ڵ����� ������ ����)
    EXCEPTION
    END;
    /
*/
-- EMPLOYEE ���̺� ���ο� ���� INSERT�ɶ����� �ڵ����� �޼����� ��µǴ� Ʈ���� ����.
CREATE OR REPLACE TRIGGER TRG_01
AFTER INSERT ON EMPLOYEE
BEGIN
    DBMS_OUTPUT.PUT_LINE('���Ի���� ȯ���մϴ�');
END;
/
-----------------------------------------------------------------------------------
-- ��ǰ �԰� �� ��� ���� ����
-- > �ʿ��� ���̺� �� ������ ����.

-- 1. ��ǰ�� ���� �����͸� ������ ���̺�(TB_PRODUCT)
CREATE TABLE TB_PRODUCT(
    PCODE NUMBER PRIMARY KEY, -- ��ǰ��ȣ
    PNAME VARCHAR2(30) NOT NULL, -- ��ǰ��
    BRAND VARCHAR2(30) NOT NULL, -- �귣���
    PRICE NUMBER, -- ����
    STOCK NUMBER DEFAULT 0 -- ������
);
-- ��ǰ��ȣ �ߺ� �ȵǰԲ� �Ź� ���ο� ��ȣ�� �߻���Ű�� ������ ����(SEQ_PCODE)
CREATE SEQUENCE SEQ_PCODE
START WITH 200
INCREMENT BY 5
NOCACHE;

-- TB_PRODUCT�� ���õ����� �߰��ϱ�
INSERT INTO TB_PRODUCT VALUES(SEQ_PCODE.NEXTVAL, '������ Z�ø� 4', '�Ｚ', 1000000, DEFAULT);
INSERT INTO TB_PRODUCT VALUES(SEQ_PCODE.NEXTVAL, '������ �º�', '�Ｚ', 170000, 10);
INSERT INTO TB_PRODUCT VALUES(SEQ_PCODE.NEXTVAL, '������14', '����', 1500000, 20);

SELECT * FROM  TB_PRODUCT;

COMMIT;

-- 2. ��ǰ ����� �� �̷� ���̺�(TB_PRODETAIL)
--    � ��ǰ�� � ��¥�� ��� �԰� �Ǵ� ��� �Ǿ������� ���� �����͸� ����ϴ� ���̺�
CREATE TABLE TB_PRODETAIL(
    DCODE NUMBER PRIMARY KEY, -- �̷¹�ȣ
    PCODE NUMBER REFERENCES TB_PRODUCT, -- ��ǰ��ȣ
    PDATE DATE NOT NULL, -- ��ǰ ��,�����
    AMOUNT NUMBER NOT NULL, -- ����� ����
    STATUS CHAR(6) CHECK(STATUS IN ('�԰�','���')) -- ����(�԰�,���)
);
-- �̷¹�ȣ�� �ڵ����� �߻������ִ� ������ ����(SEQ_DCODE)
CREATE SEQUENCE SEQ_DCODE;

-- 200�� ��ǰ�� ���ó�¥�� 10�� �԰� 
INSERT INTO TB_PRODETAIL
VALUES(SEQ_DCODE.NEXTVAL, 200, SYSDATE, 10, '�԰�');

-- 200�� ��ǰ�� ���� �������� 10 ����
UPDATE TB_PRODUCT
  SET STOCK = STOCK +10
WHERE PCODE = 200;

SELECT * FROM TB_PRODUCT;

COMMIT;

-- 210�� ��ǰ�� ���ó�¥�� 5���� ���
INSERT INTO TB_PRODETAIL
VALUES(SEQ_DCODE.NEXTVAL, 210, SYSDATE, 5 , '���');

-- 210�� ��ǰ�� �������� 5 ����
UPDATE TB_PRODUCT
SET STOCK = STOCK -5
WHERE PCODE = 210;

COMMIT;

-- TB_PRODETAIL���̺� INSERT �̺�Ʈ �߻��� ��
-- TB_PRODUCT���̺� �Ź� �ڵ����� �������� �������ְԲ� Ʈ���Ÿ� �����ϱ�
/* 
    - ��ǰ�� �԰�� ��� -> �ش� ��ǰ�� ã�Ƽ� ������ +(����) UPDATE
      UPDATE TB_PRODUCT
        SET STOCK = STOCK + ���� �԰�� ����(TB_PRODETAIL���̺� INSERT�� AMOUNT��)
      WHERE PCODE = �԰�� ��ǰ��ȣ(INSERT�� PCODE��)
    
    - ��ǰ�� ���� ��� -> �ش� ��ǰ�� ã�Ƽ� ������ -(����) UPDATE
     UPDATE TB_PRODUCT
        SET STOCK = STOCK - ���� �԰�� ����(TB_PRODETAIL���̺� INSERT�� AMOUNT��)
      WHERE PCODE = �԰�� ��ǰ��ȣ(INSERT�� PCODE��)
*/
CREATE OR REPLACE TRIGGER TRG_02
AFTER INSERT ON TB_PRODETAIL
FOR EACH ROW
BEGIN
    -- ��ǰ�� �԰�� ��� => ������ ����
    IF (:NEW.STATUS = '�԰�')
        THEN
        UPDATE TB_PRODUCT
        SET STOCK = STOCK + :NEW.AMOUNT -- :NEW Ű���带 ���� �μ�Ʈ�� ���� Ȱ���Ҽ� �ִ�.
        WHERE PCODE = :NEW.PCODE;
    ELSE
        UPDATE TB_PRODUCT
        SET STOCK = STOCK - :NEW.AMOUNT -- :NEW Ű���带 ���� �μ�Ʈ�� ���� Ȱ���Ҽ� �ִ�.
        WHERE PCODE = :NEW.PCODE;
    END IF;
END; 
/

-- 210����ǰ�� ���� ��¥�� 7�� ���
INSERT INTO TB_PRODETAIL
VALUES (SEQ_DCODE.NEXTVAL, 210, SYSDATE , 7 ,'���');

SELECT * FROM TB_PRODUCT;

INSERT INTO TB_PRODETAIL
VALUES (SEQ_DCODE.NEXTVAL, 200, SYSDATE , 10 ,'�԰�');

/* 
    Ʈ����������
    1. ������ �߰� , ����, ������ �ڵ����� �����Ͱ����� �������ν� ���Ἲ����
    2. �����ͺ��̽� ������ �ڵ�ȭ
    
    Ʈ�����Ǵ���
    1. ����� �߰�, ���� , ������ ROW�� ����,�߰�,������ �Բ� ����ǹǷ� ���ɻ� ���� ���ϴ�.
    ��2. ������ ���鿡�� ��������� �Ұ����ϱ� ������ �����ϱⰡ �����ϴ�.
    3. Ʈ���Ÿ� �����ϰԵǴ°�� ����ġ ���� ���°� �߻��Ҽ� ������, ���������� �����.
*/


























