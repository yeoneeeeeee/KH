-- 3_1.
-- CREATE TABLE ���� �ο��ޱ� ������
CREATE TABLE TEST(
    TEST_ID NUMBER
);
-- "insufficient privileges"
-- ������� ���� ���� : SAMPLE������ ���̺��� �����Ҽ� �ִ� ������ �ο����� ����

-- 3_2
-- CREATE TABLE ������ �ο����� ��.
CREATE TABLE TEST(
    TEST_ID NUMBER
);
-- no privileges on tablespace 'SYSTEM'
-- TableSpace : ���̺���� ���ִ� ����
-- sample������ tablespace�� ���� �Ҵ���� �ʾƼ� ���� �߻�

-- TABLESPACE�� �Ҵ���� �� 
CREATE TABLE TEST(
    TEST_ID NUMBER
);
-- ���̺� ���� �Ϸ�

-- ���� ���̺� ���� ������ �ο��ް� �Ǹ�
-- ������ �����ϰ� �ִ� ���̺���� �����ϴ°͵� ��������(DML)
INSERT INTO TEST VALUES(1);
SELECT * FROM TEST;

-- 4. �� ������
CREATE VIEW V_TEST
AS SELECT * FROM TEST;
-- ������� ���� ����.

-- CREATE VIEW ���� �ο�������
CREATE VIEW V_TEST
AS SELECT * FROM TEST;
-- �� ���� �Ϸ�

--5 SAMPLE�������� KH������ ���̺� �����ؼ� ��ȸ�غ���
SELECT * FROM KH.EMPLOYEE;
-- KH ������ ���̺� �����ؼ� ��ȸ�� �� �ִ� ������ ���� ������ ���� �߻�

-- SELECT ON ���� �ο� ��
SELECT * FROM KH.EMPLOYEE;

SELECT * FROM KH.DEPARTMENT;
-- DEPARTMENT���̺� �����Ҽ��ִ� ������ ���⶧���� ����

-- 6. SAMPLE �������� KH������ ���̺� �����ؼ� �� �����غ���.
INSERT INTO KH.DEPARTMENT VALUES('D0','ȸ���','L2');


INSERT INTO KH.DEPARTMENT VALUES('D0','ȸ���','L2');

COMMIT;

-- 7 ���̺� ������
CREATE TABLE TEST2(
    TEST_ID NUMBER
);
-- SAMPLE �������� ���̺��� ������ �� ������ ������ ȸ���߱� ������ ���� �߻�









