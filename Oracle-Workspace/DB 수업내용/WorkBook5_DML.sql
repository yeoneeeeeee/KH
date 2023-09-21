--1 
INSERT INTO TB_CLASS_TYPE VALUES('01','�����ʼ�');
INSERT INTO TB_CLASS_TYPE VALUES('02','��������');
INSERT INTO TB_CLASS_TYPE VALUES('03','�����ʼ�');
INSERT INTO TB_CLASS_TYPE VALUES('04','���缱��');
INSERT INTO TB_CLASS_TYPE VALUES('05','������');

-- 2
CREATE TABLE TB_�л��Ϲ�����
AS SELECT STUDENT_NO, STUDENT_NAME, STUDENT_ADDRESS
FROM TB_STUDENT;

SELECT * FROM TB_�л��Ϲ�����;

-- 3
CREATE TABLE TB_������а�
AS 
SELECT STUDENT_NO, 
        STUDENT_NAME, 
        EXTRACT(YEAR FROM TO_DATE(SUBSTR(STUDENT_SSN,1,2),'RR')) ����⵵,
        PROFESSOR_NAME
FROM TB_STUDENT T
LEFT JOIN TB_PROFESSOR ON COACH_PROFESSOR_NO = PROFESSOR_NO
WHERE T.DEPARTMENT_NO = (SELECT DEPARTMENT_NO 
                          FROM TB_DEPARTMENT
                          WHERE DEPARTMENT_NAME = '������а�'
                          );
                          
SELECT * FROM TB_������а�;
-- 4 
UPDATE TB_DEPARTMENT
SET CAPACITY = ROUND(CAPACITY*1.1);

-- 5
UPDATE TB_STUDENT
SET STUDENT_ADDRESS = '����� ���α� ���ε� 181-21'
WHERE STUDENT_NO = 'A413042';

-- 6
UPDATE TB_STUDENT
SET STUDENT_SSN = SUBSTR(STUDENT_SSN,1,6);

-- 7
UPDATE TB_GRADE
SET POINT = 3.5
WHERE STUDENT_NO = (
                        SELECT STUDENT_NO
                        FROM TB_STUDENT
                        JOIN TB_DEPARTMENT USING(DEPARTMENT_NO)
                        WHERE STUDENT_NAME='�����' AND
                        DEPARTMENT_NAME = '���а�'
                    ) AND
     CLASS_NO = (
                    SELECT CLASS_NO
                    FROM TB_CLASS
                    WHERE CLASS_NAME = '�Ǻλ�����'
                ) AND
    TERM_NO = '200501';
                    
DELETE FROM TB_GRADE
WHERE STUDENT_NO IN (
                        SELECT STUDENT_NO
                        FROM TB_STUDENT
                        WHERE ABSENCE_YN = 'Y'
                    );
COMMIT;








