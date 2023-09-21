/*
    <GROUP BY ��>
    �׷��� ������ ������ �����Ҽ� �ִ� ���� => �׷��Լ��� ���� ����.
    �ش� ���õ� ���غ��� �׷��� ���� �� ����
    �������� ������ �ϳ��� �׷����� ��� ó���� �������� ���
    
    [ǥ����]
    GROUP BY ������ ������ �� �÷�
*/
-- �� �μ����� �� �޿��� �հ�
SELECT DEPT_CODE , SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE; -- �μ����� �׷��� ���ٴ�

-- �� �μ��� �����
SELECT DEPT_CODE, COUNT(*)
FROM EMPLOYEE
GROUP BY DEPT_CODE;

-- �� �μ��� �� �޿� ���� �μ��� ������������ �����ؼ� ��ȸ
SELECT DEPT_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE
ORDER BY DEPT_CODE ASC;

-- �� �μ��� �� �޿� ���� �޿����� �������� �����ؼ� ��ȸ.-->  ����μ��� ���� �޿��� ���̹޳�?
SELECT DEPT_CODE, SUM(SALARY) -- 3.
FROM EMPLOYEE -- 1.
GROUP BY DEPT_CODE -- 2.
ORDER BY 2 DESC; -- 4.

-- �� ���޺� �����ڵ�, �� �޿��� ��, �����, ���ʽ��� �޴� ����Ǽ�, ��ձ޿�, �ְ�޿�, �ּұ޿�
SELECT JOB_CODE �����ڵ�,
       SUM(SALARY) �ѱ޿���,
       COUNT(*) �����,
       COUNT(BONUS) ���ʽ��޴»����,
       ROUND(AVG(SALARY)) ��ձ޿�,
       MAX(SALARY) �ְ�޿�,
       MIN(SALARY) �ּұ޿�
FROM EMPLOYEE
GROUP BY JOB_CODE
ORDER BY 1;

-- ���� �� ����� ��
-- ���� : SUBSTR(EMP_NO, 8, 1)
SELECT 
    DECODE(SUBSTR(EMP_NO,8,1), '1' ,'��','2','��') "����",
    COUNT(*) �����
FROM EMPLOYEE
GROUP BY SUBSTR(EMP_NO,8,1)
ORDER BY 1 DESC;

-- �� �μ��� ��� �޿��� 300���� �̻��� �μ��鸸 ��ȸ
SELECT DEPT_CODE, ROUND(AVG(SALARY))
FROM EMPLOYEE
WHERE ROUND(AVG(SALARY)) >= 3000000
GROUP BY DEPT_CODE; -- ������. ������ �׷��Լ��� WHERE���� ���� ����.

/*
    <HAVING ��>
    
    �׷쿡 ���� ������ �����ϰ����Ҷ� ���Ǵ� ����
    (�ַ� �׷��Լ��� ������ ��������) => GROUP BY���� �Բ� ���δ�(�ڿ�)
*/
SELECT DEPT_CODE, ROUND(AVG(SALARY))
FROM EMPLOYEE
GROUP BY DEPT_CODE
HAVING ROUND(AVG(SALARY)) >= 3000000;

-- �� ���޺� �޿� ����� 300���� �̻���  �����ڵ�, ��ձ޿�, �����, �ְ�޿� ,�ּұ޿�
SELECT JOB_CODE , ROUND(AVG(SALARY)) , COUNT(*), MAX(SALARY), MIN(SALARY)
FROM EMPLOYEE
GROUP BY JOB_CODE
HAVING AVG(SALARY) >= 3000000;
-- �� �μ��� ���ʽ��� �޴� ����� ���� �μ����� ��ȸ
SELECT DEPT_CODE
FROM EMPLOYEE
GROUP BY DEPT_CODE
HAVING COUNT(BONUS) = 0;
-- �� �μ��� ��ձ޿��� 350���� ������ �μ����� ��ȸ
SELECT DEPT_CODE
FROM EMPLOYEE
GROUP BY DEPT_CODE
HAVING AVG(SALARY) <= 3500000;
----------------------------------------------------------------------------------
/*
    <ROLLUP ,CUBE>
    - �׷캰 ������ ���� "����"�� ����ϴ� �Լ�
    
    ROLLUP(�׷���ؿ� �ش��ϴ� Į�� , �׷���ؿ� �ش��ϴ� Į��) : 
    ���ڷ� ���޹��� �׷��� ���� ���� ������ �׷��� �������� �߰����� ����� ��ȯ����.
    
    CUBE(�׷���ؿ� �ش��ϴ� Į�� , �׷���ؿ� �ش��ϴ� Į��) : 
    ���ڷ� ���޹��� �׷��� ������ ��� ���պ� ���踦 ��ȯ����
*/

SELECT DEPT_CODE, JOB_CODE ,SUM(SALARY)
FROM EMPLOYEE
GROUP BY ROLLUP(DEPT_CODE , JOB_CODE)
ORDER BY 1;

-- ������պ� ���
SELECT DEPT_CODE, JOB_CODE ,SUM(SALARY)
FROM EMPLOYEE
GROUP BY CUBE(DEPT_CODE , JOB_CODE)
ORDER BY 1;

/* 
    <SELECT �� ���� �� �������>
    5. SELECT ��ȸ�ϰ����ϴ� �÷���, *, ���ͷ�, ��������,�Լ���
    1. FROM ��ȸ�ϰ����ϴ� ���̺��/DUAL
    2. WHERE ���ǽ�(�׷��Լ�X)
    3. GROUP BY �׷���ؿ� �ش��ϴ� �÷��� / �Լ���
    4. HAVING �׷��Լ��Ŀ����� ���ǽ�
    6. ORDER BY �÷���/��Ī/���� [ASC/DESC] [NULLS FIRST/NULLS LAST]
*/
/* 
    <���� ������ SET OPERATOR>
    
    �������� �������� ������ �ϳ��� ���������� ����� ������
    
    -UNION(������) : �� �������������� ������� ���� �� �ߺ��Ǵ� �κ��� �ѹ��� ���� �ߺ��� �����Ѱ�
    
    -UNION ALL : �� �������� ������ ������� ���� �� �ߺ����� �������� �ʰ� �״�εа�
        
    -INTERSECT(������) : �� �������� ������ ������� �ߺ��� �κи� �����°�
    
    -MINUS(������) : ���� ������ ��������� ���� ������ ������� �� ������ �κ�
    
    �����ؾ����� : �� �������� ����� ���ļ� �Ѱ��� ���̺�� ��������ϱ� ������
                 �� �������� SELECT�� �κ��� ���ƾ��Ѵ�(��ȸ�� �÷����� ��ġ�ؾ���)
*/
-- 1. UNION(������) : �� �������� ������ ������� ����������, �ߺ����� ����
-- �μ��ڵ尡 D5�̰ų�(OR), �Ǵ� �޿��� 300���� �ʰ��� ����� ��ȸ(���, �����, �μ��ڵ�, �޿�)

SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE 
WHERE DEPT_CODE = 'D5' --> 6�� ��ȸ
UNION
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY > 3000000; -- 8����ȸ


-- �����ڵ尡 J6�̰ų� �μ��ڵ尡 D1�� ������� ��ȸ(���,�����,�μ��ڵ�,�޿�)
-- OR������ ����
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE JOB_CODE ='J6' OR DEPT_CODE='D1';
-- UNION ������ ����
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE JOB_CODE ='J6'
UNION
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE='D1';


-- 2. UNION ALL : �������� ��������� ���ؼ� �����ִ� ������(�ߺ����� ����)
-- �����ڵ尡 J6�̰ų� �Ǵ� �μ��ڵ尡 D1�� ����� ��ȸ
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE JOB_CODE ='J6' -- 6��
UNION ALL
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE='D1'; -- 3��

-- 3. INTERSECT : ������ , ��������� �ߺ��� ������� ��ȸ 
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE JOB_CODE ='J6' -- 6��
INTERSECT
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE='D1';

-- AND ������ ����
SELECT EMP_ID, EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE DEPT_CODE ='D1' AND JOB_CODE ='J6'; -- 2��

-- 4. MINUS : ������, ������������ ����� ���� ��������� �� ������
-- �����ڵ尡 J6�� ������߿��� �μ��ڵ尡 D1�� ������� ������ ������ ����� ��ȸ�� ����
SELECT 
    EMP_ID, EMP_NAME, DEPT_CODE, JOB_CODE
FROM EMPLOYEE
WHERE JOB_CODE ='J6' -- 6��
MINUS
SELECT
    EMP_ID, EMP_NAME, DEPT_CODE, 'DD' 
FROM EMPLOYEE
WHERE DEPT_CODE = 'D1'; -- 3��





