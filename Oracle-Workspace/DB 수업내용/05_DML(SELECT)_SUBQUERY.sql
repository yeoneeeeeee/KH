/* 
    <SUBQUERY(��������)>
    
    �ϳ��� �ֵ� SQL(SELECT , CREATE , INSERT, UPDATE...) �ȿ� ���Ե� ���ϳ��� SELECT��
    
    ���� SQL���� ���ؼ� ���� ������ �ϴ� SELECT��    
*/

-- ���ö ����� ���� �μ��� �����
-- 1)���� ���ö ����� �μ��ڵ带 ��ȸ
SELECT DEPT_CODE
FROM EMPLOYEE
WHERE EMP_NAME = '���ö'; -- 'D9';

--2) �μ��ڵ尡 D9�� ����� ��ȸ
SELECT EMP_NAME
FROM EMPLOYEE
WHERE DEPT_CODE = 'D9';

-- ���� �� �ܰ踦 ��ġ�� ==> ��������
SELECT EMP_NAME
FROM EMPLOYEE 
WHERE DEPT_CODE = (SELECT DEPT_CODE
                    FROM EMPLOYEE
                    WHERE EMP_NAME = '���ö');                   
-- ��ü ����� ��� �޿����� �� ���� �޿��� �ް��ִ� ������� ���, �̸� ,�����ڵ� ��ȸ(��������Ȱ��)
--1) ��ü����� ��ձ޿����ϱ�
SELECT AVG(SALARY)
FROM EMPLOYEE;

--2) �޿��� 3047662.0000000 ū ����� ��ȸ
SELECT EMP_ID, EMP_NAME, JOB_CODE
FROM EMPLOYEE
WHERE SALARY >= (SELECT AVG(SALARY)
                 FROM EMPLOYEE);
                 
/* 
    �������� ����
    ���������� ������ ������� ���� ��̳Ŀ����� �з���.
    
    - ������ (���Ͽ�) �������� : ���������� ������ ������� ������ 1���϶� (��ĭ�� �÷������� ���ö�)
    - ������ (���Ͽ�) �������� : ���������� ������ ����� ���� ���϶�
    - (������) ���߿� �������� : ���������� ������ ������� ���� ���϶�
    - ������ ���߿� ��������   : ���������� ������ ������� ������, ���� ���϶� 
    
    => ���������� ������ ����� ���� ��̳Ŀ� ���� ��밡���� �����ڰ� �޶���
*/

/* 
    1. ������ (���Ͽ�) �������� (SINGLE ROW SUBQUERY)
    ���������� ��ȸ ������� ������ 1���϶�
    
    �Ϲ� ������ ��� ����(=, != , >= <= > < ...)
*/
-- �� ������ ��� �޿����� �� ���� �޴� ������� ����� , �����ڵ� , �޿� ��ȸ (���������� Ȱ��)
SELECT *
FROM EMPLOYEE
WHERE SALARY < (SELECT AVG(SALARY) FROM EMPLOYEE); -- > ������� 1�� 1��, ������ 1���ǰ�
-- �� ������ �����޿��� �޴� ����� ����� , �����ڵ� , �޿� ��ȸ (���������� Ȱ��)
SELECT *
FROM EMPLOYEE
WHERE SALARY = (SELECT MIN(SALARY) FROM EMPLOYEE);

-- ���ö ����� �޿����� �� ���� �޴»������ ���, �̸�,  �μ��� �޿� ��ȸ.
SELECT EMP_ID, EMP_NAME, DEPT_TITLE,SALARY 
FROM EMPLOYEE , DEPARTMENT
WHERE SALARY > (SELECT SALARY FROM EMPLOYEE WHERE EMP_NAME='���ö') AND
  DEPT_CODE = DEPT_ID(+);
  
SELECT EMP_ID, EMP_NAME, DEPT_TITLE,SALARY 
FROM EMPLOYEE
LEFT JOIN DEPARTMENT ON DEPT_ID = DEPT_CODE 
WHERE SALARY > (SELECT SALARY FROM EMPLOYEE WHERE EMP_NAME ='���ö');
-------------------------------------------------------------------------------
-- �μ��� �޿� ���� ���� ū �μ� �ϳ����� ��ȸ, �μ��ڵ�, �μ��� ,�޿��� ��
--1) �� �μ��� �޿��� ���ϱ� , ���� ū��ã��
SELECT DEPT_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE;
-- ���� ū ��ã��
SELECT MAX(SUM(SALARY))
FROM EMPLOYEE
GROUP BY DEPT_CODE;
--2)�������������
SELECT DEPT_CODE, DEPT_TITLE, SUM(SALARY)
FROM EMPLOYEE LEFT JOIN DEPARTMENT ON DEPT_CODE = DEPT_ID
GROUP BY DEPT_CODE , DEPT_TITLE
HAVING SUM(SALARY) = (SELECT MAX(SUM(SALARY))
                        FROM EMPLOYEE
                        GROUP BY DEPT_CODE);
/* 
    2.  ������ �������� (MULTI ROW SUBQUERY)
    ���������� ��ȸ ������� ���� ���� ���
    
    - IN (10,20,30) �������� : �������� ����� �߿��� �ϳ��� ��ġ�ϴ°��� �ִٸ�
    
    - (> OR <) ANY(10,20,30) �������� : �������� ����� �߿��� "�ϳ���"Ŭ ���
                              ��, �������� ����� �߿��� ���� ���� ������ Ŭ��쳪 �������
                              
    - (> OR < )ALL(10,20,30): �������� ������� ��� ������ Ŭ��� Ȥ�� �������    
*/
-- �� �μ��� �ְ�޿��� �޴� ����� �̸�, �����ڵ� , �޿� ��ȸ
SELECT MAX(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE;

-- ���� �޿��� �޴� ����� ��ȸ
SELECT EMP_NAME, JOB_CODE, SALARY
FROM EMPLOYEE 
WHERE SALARY IN (2890000,3660000,8000000,3760000,3900000,2490000,2550000);

-- �� �ڵ带 ��ġ��
SELECT EMP_NAME, JOB_CODE, SALARY
FROM EMPLOYEE 
WHERE SALARY IN (SELECT MAX(SALARY)
                    FROM EMPLOYEE
                    GROUP BY DEPT_CODE);
------
-- �̿��� �Ǵ� �ϵ��� ����� ���� ������ ������� ��ȸ�Ͻÿ�(�����, �����ڵ�, �μ��ڵ�, �޿�)
SELECT EMP_NAME, JOB_CODE, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE JOB_CODE IN ( SELECT JOB_CODE
                    FROM EMPLOYEE
                    WHERE EMP_NAME IN ('�̿���','�ϵ���')
                    );
-- ��� < �븮 < ���� < ���� < ����
-- �븮 �����ӿ��� �ұ��ϰ� ���� ������ �޿����� ���� �޴� ����� ��ȸ(���, �̸�, ���޸�, �޿�)
-- 1) ���������� ������� �޿��� ��ȸ
SELECT SALARY
FROM EMPLOYEE E, JOB J
WHERE E.JOB_CODE = J.JOB_CODE 
  AND JOB_NAME='����';

-- 2) ���� �޿��麸�� "�ϳ��� " ���� �޿��� �޴� �������� ��ȸ
SELECT EMP_ID, EMP_NAME, JOB_NAME, SALARY
FROM EMPLOYEE
JOIN JOB USING(JOB_CODE)
WHERE SALARY >= ANY(2200000,2500000,3760000)
AND JOB_NAME ='�븮';

-- 3) �� ���빰���� �ϳ��� ���������� ��ġ��
SELECT EMP_ID, EMP_NAME, JOB_NAME, SALARY
FROM EMPLOYEE
JOIN JOB USING(JOB_CODE)
WHERE SALARY >= ANY(SELECT SALARY
                    FROM EMPLOYEE E, JOB J
                    WHERE E.JOB_CODE = J.JOB_CODE 
                      AND JOB_NAME='����')
AND JOB_NAME ='�븮';

-- ���������ӿ��� �ұ��ϰ� "���" ���������� �޿����ٵ� �� ���� �޴� ���� ��ȸ(���,�̸�,���޸�,�޿�)
-- ANSI����
SELECT EMP_ID, EMP_NAME, JOB_NAME, SALARY
FROM EMPLOYEE
JOIN JOB USING(JOB_CODE)
WHERE SALARY > ALL ( SELECT SALARY
                     FROM EMPLOYEE
                     JOIN JOB USING(JOB_CODE)
                     WHERE JOB_NAME='����'
                    )
AND JOB_NAME= '����';
/* 
    3. (������) ���߿� ��������
    
    �������� ��ȸ����� ���� ��������, ������ �÷��� ������ �������� ���
    
*/
-- ����������� ���� �μ��ڵ�, ���� �����ڵ忡 �ش�Ǵ� ����� ��ȸ(�����, �μ��ڵ�,�����ڵ�,�����)
--1) ������ ����� �μ��ڵ��, �����ڵ带 ���� ��ȸ => ���߿���������
SELECT DEPT_CODE, JOB_CODE -- D5 | J5
FROM EMPLOYEE
WHERE EMP_NAME ='������';

--2) �μ��ڵ尡 D5�̸鼭 �����ڵ嵵 J5�� ����� ��ȸ
SELECT *
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5' AND JOB_CODE = 'J5';

--3) �� ���빰�� �ϳ��� ���������� ��ġ��.
SELECT *
FROM EMPLOYEE
WHERE DEPT_CODE = (SELECT DEPT_CODE
                    FROM EMPLOYEE
                    WHERE EMP_NAME ='������') 
AND JOB_CODE = (SELECT JOB_CODE -- D5 | J5
                FROM EMPLOYEE
                WHERE EMP_NAME ='������');

-- ���߿� ��������
-- (�񱳴��Į��1, �񱳴��Į��2 ,...) =  (���Ұ�1, ���Ұ�2, ... => ���������������� �����ؾ���)
SELECT *
FROM EMPLOYEE
WHERE (DEPT_CODE, JOB_CODE) = (SELECT DEPT_CODE, JOB_CODE FROM EMPLOYEE WHERE EMP_NAME = '������' );

-- �ڳ��� ����� ���� �����ڵ�, ���� �������� ���� ������� ���, �̸�, �����ڵ�, ������ ��ȸ
-- ������ ���߿������������ۼ�!!?????????????
--
SELECT JOB_CODE, MANAGER_ID
FROM EMPLOYEE
WHERE EMP_NAME='�ڳ���';

SELECT EMP_ID, EMP_NAME, JOB_CODE, MANAGER_ID
FROM EMPLOYEE
WHERE (JOB_CODE, MANAGER_ID) = (SELECT JOB_CODE, MANAGER_ID
                                FROM EMPLOYEE
                                WHERE EMP_NAME='�ڳ���');

/* 
    4. ������, ���߿� ��������
    
    �������� ��ȸ ����� ������, ���� �÷��� ���
*/
-- �� ���޺� �ּұ޿��� �޴� ����� ��ȸ(���, �̸�, �����ڵ�, �޿�)
-- 1) �� ���޺� �ּ� �޿��� ��ȸ
SELECT JOB_CODE , MIN(SALARY)
FROM EMPLOYEE
GROUP BY JOB_CODE;

-- 2) ���� ��ϵ� �߿��� ��ġ�ϴ� ���
-- 2-1) ���� ���� (IN�����ڻ��)
SELECT EMP_ID, EMP_NAME, JOB_CODE, SALARY
FROM EMPLOYEE
WHERE (JOB_CODE, SALARY) IN (('J2',3700000), ('J7',1380000));

--3) �� ������ ������ ���������� ��ġ��
SELECT EMP_ID, EMP_NAME, JOB_CODE, SALARY
FROM EMPLOYEE
WHERE (JOB_CODE, SALARY) IN (SELECT JOB_CODE , MIN(SALARY)
                            FROM EMPLOYEE
                            GROUP BY JOB_CODE);
---------------------------------------------
-- �� �μ��� �ְ�޿��� �޴� ����� ��ȸ(���, �̸�, �μ��ڵ�, �޿�)
--1) �� �μ��� �ְ� �޿� ��ȸ
SELECT DEPT_CODE, MAX(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE;
--2)�� ������ �����ϴ� ����鸸 �߸���( IN������ ���)
SELECT EMP_ID, EMP_NAME,  NVL(DEPT_CODE , '����') , SALARY
FROM EMPLOYEE
WHERE ( NVL(DEPT_CODE , '����'), SALARY) IN (SELECT  NVL(DEPT_CODE , '����'), MAX(SALARY)
                                FROM EMPLOYEE
                                GROUP BY DEPT_CODE);
---------------------------------------------------------------------------------------------------
/* 
    5. �ζ��κ�(INLINE VIEW)
    FROM ���� ���������� �����ϸ�
    
    ���������� ������ ������� RESULT SET�� ���̺��� ����ؼ� ����ϰڴ�
*/

-- ���ʽ� ���� ������ 3000���� �̻��� ������� ���, �̸�, ���ʽ����Կ��� , �μ��ڵ带 ��ȸ
SELECT EMP_ID, EMP_NAME, (SALARY + SALARY* NVL(BONUS,0) ) * 12 "���ʽ� ���� ����", DEPT_CODE
FROM EMPLOYEE
WHERE (SALARY + SALARY* NVL(BONUS,0) ) * 12 >= 30000000;

--> �ζ��� �並 ��� : ����� ��󳻱�(���ʽ� ���� ������ 3000���� �̻��� ������� �̸���)
SELECT "���ʽ� ���� ����"
FROM (
        SELECT EMP_ID , EMP_NAME, (SALARY + SALARY* NVL(BONUS,0) ) * 12 AS "���ʽ� ���� ����" , DEPT_CODE
        FROM EMPLOYEE
        WHERE (SALARY + SALARY* NVL(BONUS,0) ) * 12 >= 30000000
)
WHERE DEPT_CODE IS NULL;

-- �ζ��κ並 �ַ� ����ϴ� ��
-- TOP-N�м�: �����ͺ��̽� �� �����ϴ� �ڷ��� �ֻ��� N���� �ڷḦ �������� ����ϴ� ���

-- �� ������ �޿��� ���� �������� 5��(����, ������, �޿�)
-- *ROWNUM : ����Ŭ���� �������ִ� Į��, ��ȸ�� ������� 1���� ������ �ο����ִ� Į��
SELECT ROWNUM , EMP_NAME, SALARY -- ROWNUM���� ���� �ο��ϱ�
FROM (
        SELECT *
        FROM EMPLOYEE
        ORDER BY SALARY DESC -- ORDER BY�� ���ĸ�����Ű��, 
    )
WHERE ROWNUM <= 5;

-- �� �μ��� ��ձ޿��� ���� 3���� �μ��� �μ��ڵ�, ��ձ޿� ��ȸ
-- 1) �� �μ��� ��� �޿� => ����������� �߷���
SELECT DEPT_CODE, ROUND(AVG(SALARY)) AS "���"
FROM EMPLOYEE
GROUP BY DEPT_CODE
ORDER BY ��� DESC;
-- 2) ���� �ο�, ���� 3���� �߸���
-- SELECT ROWNUM "����", S.*
SELECT ROWNUM "����", DEPT_CODE , "ROUND(AVG(SALARY))"
FROM (SELECT DEPT_CODE, ROUND(AVG(SALARY)) 
        FROM EMPLOYEE
        GROUP BY DEPT_CODE
        ORDER BY 2 DESC) S
WHERE ROWNUM <= 3;

-- ROWNUMĮ���� �̿��ؼ� ������ �ű� ���ִ�.
-- �ٸ�, �����̵��� ���� ���¿����� ������ �ű�� �ǹ̰� �����Ƿ� ������ ���� ��Ű�� ������ ���߿� �Űܾ��Ѵ�
-- �켱������ �ζ��κ�� ORDER BY�� �������ϰ�, ������������ ������ ���δ�.

-- ���� �ֱٿ� �Ի��� ��� 5�� ��ȸ(�����,�޿�,�Ի���)
-- �Ի��� ���� �̷� ~ ����(��������), ���� �ο��� 5��
SELECT ROWNUM , E.*
FROM (
        SELECT EMP_NAME, SALARY, HIRE_DATE
        FROM EMPLOYEE
        ORDER BY HIRE_DATE DESC
        ) E
WHERE ROWNUM <= 5;
/* 
    6. ���� �ű�� �Լ�(WINDOW FUNCTION)
    RANK() OVER(���ı���)
    DENSE_RANK() OVER(���ı���)
    
    - RANK() OVER(���ı���): ����1���� 3���̶�� �Ѵٸ� �״��������� 4�����ϰڴ�
    - DENSE_RANK() OVER(���ı���) : ����1���� 3���̶�� �Ѵٸ� �� ���������� ������ 2���� �ϰڴ�.
    
    ���� ���� : ORDER BY��(���ı��� Į���̸�, ��������/��������), NULL FIRST/NULL LAST�ɼ��� ����� �Ұ���.
    
    SELECT �������� ��� ������.
*/
-- ������� �޿��� ���� ������� �Űܼ� �����, �޿�, ���� ��ȸ : RANK() OVER()
SELECT EMP_NAME, SALARY, RANK() OVER(ORDER BY SALARY DESC) "����"
FROM EMPLOYEE; -- ���� 19�� 2��, ���������� 21��.

SELECT EMP_NAME, SALARY, DENSE_RANK() OVER(ORDER BY SALARY DESC) "����"
FROM EMPLOYEE; -- ���� 19�� 2��, �� ���������� 20��.

-- 5�������� ����ϰڴ�.
SELECT EMP_NAME, SALARY, DENSE_RANK() OVER(ORDER BY SALARY DESC) "����"
FROM EMPLOYEE
WHERE DENSE_RANK() OVER (ORDER BY SALARY DESC) <= 5; -- ������ �Լ��� WHERE �������� ����Ҽ� ����. 

-->> �ζ��κ�� ��ȯ
--1) rank�Լ��� ������ �ű��(���ı��� �Ϸ��Ű��)
SELECT EMP_NAME, SALARY, RANK() OVER(ORDER BY SALARY DESC) "����"
FROM EMPLOYEE;

-- 2) 1) 1�� ������� ���� ��ȸ�ϱ�(5��������)

SELECT E.*
FROM (SELECT EMP_NAME, SALARY, RANK() OVER(ORDER BY SALARY DESC) "����"
        FROM EMPLOYEE) E
WHERE "����" <= 5;
