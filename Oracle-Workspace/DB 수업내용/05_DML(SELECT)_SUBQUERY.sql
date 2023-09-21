/* 
    <SUBQUERY(서브쿼리)>
    
    하나의 주된 SQL(SELECT , CREATE , INSERT, UPDATE...) 안에 포함된 또하나의 SELECT문
    
    메인 SQL문을 위해서 보조 역할을 하는 SELECT문    
*/

-- 노옹철 사원과 같은 부서인 사원들
-- 1)먼저 노옹철 사원의 부서코드를 조회
SELECT DEPT_CODE
FROM EMPLOYEE
WHERE EMP_NAME = '노옹철'; -- 'D9';

--2) 부서코드가 D9인 사원들 조회
SELECT EMP_NAME
FROM EMPLOYEE
WHERE DEPT_CODE = 'D9';

-- 위의 두 단계를 합치기 ==> 서브쿼리
SELECT EMP_NAME
FROM EMPLOYEE 
WHERE DEPT_CODE = (SELECT DEPT_CODE
                    FROM EMPLOYEE
                    WHERE EMP_NAME = '노옹철');                   
-- 전체 사원의 평균 급여보다 더 많은 급여를 받고있는 사원들의 사번, 이름 ,직급코드 조회(서브쿼리활용)
--1) 전체사원의 평균급여구하기
SELECT AVG(SALARY)
FROM EMPLOYEE;

--2) 급여가 3047662.0000000 큰 사원들 조회
SELECT EMP_ID, EMP_NAME, JOB_CODE
FROM EMPLOYEE
WHERE SALARY >= (SELECT AVG(SALARY)
                 FROM EMPLOYEE);
                 
/* 
    서브쿼리 구분
    서브쿼리를 수행한 결과값이 몇행 몇열이냐에따라서 분류됨.
    
    - 단일행 (단일열) 서브쿼리 : 서브쿼리를 수행한 결과값이 오로지 1개일때 (한칸의 컬럽값으로 나올때)
    - 다중행 (단일열) 서브쿼리 : 서브쿼리를 수행한 결고값이 여러 행일때
    - (단일행) 다중열 서브쿼리 : 서브쿼리를 수행한 결과값이 여러 열일때
    - 다중행 다중열 서브쿼리   : 서브쿼리를 수행한 결과값이 여러행, 여러 열일때 
    
    => 서브쿼리를 수행한 결과가 몇행 몇열이냐에 따라서 사용가능한 연산자가 달라짐
*/

/* 
    1. 단일행 (단일열) 서브쿼리 (SINGLE ROW SUBQUERY)
    서브쿼리의 조회 결과값이 오로지 1개일때
    
    일반 연산자 사용 가능(=, != , >= <= > < ...)
*/
-- 전 직원의 평균 급여보다 더 적게 받는 사원들의 사원명 , 직급코드 , 급여 조회 (서브쿼리를 활용)
SELECT *
FROM EMPLOYEE
WHERE SALARY < (SELECT AVG(SALARY) FROM EMPLOYEE); -- > 결과값은 1행 1열, 오로지 1개의값
-- 전 직원중 최저급여를 받는 사원의 사원명 , 직급코드 , 급여 조회 (서브쿼리를 활용)
SELECT *
FROM EMPLOYEE
WHERE SALARY = (SELECT MIN(SALARY) FROM EMPLOYEE);

-- 노옹철 사원의 급여보다 더 많이 받는사원들의 사번, 이름,  부서명 급여 조회.
SELECT EMP_ID, EMP_NAME, DEPT_TITLE,SALARY 
FROM EMPLOYEE , DEPARTMENT
WHERE SALARY > (SELECT SALARY FROM EMPLOYEE WHERE EMP_NAME='노옹철') AND
  DEPT_CODE = DEPT_ID(+);
  
SELECT EMP_ID, EMP_NAME, DEPT_TITLE,SALARY 
FROM EMPLOYEE
LEFT JOIN DEPARTMENT ON DEPT_ID = DEPT_CODE 
WHERE SALARY > (SELECT SALARY FROM EMPLOYEE WHERE EMP_NAME ='노옹철');
-------------------------------------------------------------------------------
-- 부서별 급여 합이 가장 큰 부서 하나만을 조회, 부서코드, 부서명 ,급여의 합
--1) 각 부서별 급여합 구하기 , 가장 큰합찾기
SELECT DEPT_CODE, SUM(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE;
-- 가장 큰 합찾기
SELECT MAX(SUM(SALARY))
FROM EMPLOYEE
GROUP BY DEPT_CODE;
--2)서브쿼리만들기
SELECT DEPT_CODE, DEPT_TITLE, SUM(SALARY)
FROM EMPLOYEE LEFT JOIN DEPARTMENT ON DEPT_CODE = DEPT_ID
GROUP BY DEPT_CODE , DEPT_TITLE
HAVING SUM(SALARY) = (SELECT MAX(SUM(SALARY))
                        FROM EMPLOYEE
                        GROUP BY DEPT_CODE);
/* 
    2.  다중행 서브쿼리 (MULTI ROW SUBQUERY)
    서브쿼리의 조회 결과값이 여러 행일 경우
    
    - IN (10,20,30) 서브쿼리 : 여러개의 결과값 중에서 하나라도 일치하는것이 있다면
    
    - (> OR <) ANY(10,20,30) 서브쿼리 : 여러개의 결과값 중에서 "하나라도"클 경우
                              즉, 여러개의 결과값 중에서 가장 작은 값보다 클경우나 작을경우
                              
    - (> OR < )ALL(10,20,30): 여러개의 결과값의 모든 값보다 클경우 혹은 작을경우    
*/
-- 각 부서별 최고급여를 받는 사원의 이름, 직급코드 , 급여 조회
SELECT MAX(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE;

-- 위의 급여를 받는 사원들 조회
SELECT EMP_NAME, JOB_CODE, SALARY
FROM EMPLOYEE 
WHERE SALARY IN (2890000,3660000,8000000,3760000,3900000,2490000,2550000);

-- 두 코드를 합치기
SELECT EMP_NAME, JOB_CODE, SALARY
FROM EMPLOYEE 
WHERE SALARY IN (SELECT MAX(SALARY)
                    FROM EMPLOYEE
                    GROUP BY DEPT_CODE);
------
-- 이오리 또는 하동운 사원과 같은 직급인 사원들을 조회하시오(사원명, 직급코드, 부서코드, 급여)
SELECT EMP_NAME, JOB_CODE, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE JOB_CODE IN ( SELECT JOB_CODE
                    FROM EMPLOYEE
                    WHERE EMP_NAME IN ('이오리','하동운')
                    );
-- 사원 < 대리 < 과장 < 차장 < 부장
-- 대리 직급임에도 불구하고 과장 직급의 급여보다 많이 받는 사원들 조회(사번, 이름, 직급명, 급여)
-- 1) 과장직급인 사원들의 급여를 조회
SELECT SALARY
FROM EMPLOYEE E, JOB J
WHERE E.JOB_CODE = J.JOB_CODE 
  AND JOB_NAME='과장';

-- 2) 위의 급여들보다 "하나라도 " 높은 급여를 받는 직원들을 조회
SELECT EMP_ID, EMP_NAME, JOB_NAME, SALARY
FROM EMPLOYEE
JOIN JOB USING(JOB_CODE)
WHERE SALARY >= ANY(2200000,2500000,3760000)
AND JOB_NAME ='대리';

-- 3) 위 내용물들을 하나의 쿼리문으로 합치기
SELECT EMP_ID, EMP_NAME, JOB_NAME, SALARY
FROM EMPLOYEE
JOIN JOB USING(JOB_CODE)
WHERE SALARY >= ANY(SELECT SALARY
                    FROM EMPLOYEE E, JOB J
                    WHERE E.JOB_CODE = J.JOB_CODE 
                      AND JOB_NAME='과장')
AND JOB_NAME ='대리';

-- 과장직급임에도 불구하고 "모든" 차장직급의 급여보다도 더 많이 받는 직원 조회(사번,이름,직급명,급여)
-- ANSI구문
SELECT EMP_ID, EMP_NAME, JOB_NAME, SALARY
FROM EMPLOYEE
JOIN JOB USING(JOB_CODE)
WHERE SALARY > ALL ( SELECT SALARY
                     FROM EMPLOYEE
                     JOIN JOB USING(JOB_CODE)
                     WHERE JOB_NAME='차장'
                    )
AND JOB_NAME= '과장';
/* 
    3. (단일행) 다중열 서브쿼리
    
    서브쿼리 조회결과가 값은 한행지만, 나열된 컬럼의 갯수가 여러개일 경우
    
*/
-- 하이유사원과 같은 부서코드, 같은 직급코드에 해당되는 사원들 조회(사원명, 부서코드,직급코두,고용일)
--1) 하이유 사원의 부서코드와, 직급코드를 먼저 조회 => 다중열서브쿼리
SELECT DEPT_CODE, JOB_CODE -- D5 | J5
FROM EMPLOYEE
WHERE EMP_NAME ='하이유';

--2) 부서코드가 D5이면서 직급코드도 J5인 사원들 조회
SELECT *
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5' AND JOB_CODE = 'J5';

--3) 위 내용물을 하나의 쿼리문으로 합치기.
SELECT *
FROM EMPLOYEE
WHERE DEPT_CODE = (SELECT DEPT_CODE
                    FROM EMPLOYEE
                    WHERE EMP_NAME ='하이유') 
AND JOB_CODE = (SELECT JOB_CODE -- D5 | J5
                FROM EMPLOYEE
                WHERE EMP_NAME ='하이유');

-- 다중열 서브쿼리
-- (비교대상칼럼1, 비교대상칼럼2 ,...) =  (비교할값1, 비교할값2, ... => 서브쿼리형식으로 제시해야함)
SELECT *
FROM EMPLOYEE
WHERE (DEPT_CODE, JOB_CODE) = (SELECT DEPT_CODE, JOB_CODE FROM EMPLOYEE WHERE EMP_NAME = '하이유' );

-- 박나라 사원과 같은 직급코드, 같은 사수사번을 가진 사원들의 사번, 이름, 직급코드, 사수사번 조회
-- 단일행 다중열서브쿼리로작성!!?????????????
--
SELECT JOB_CODE, MANAGER_ID
FROM EMPLOYEE
WHERE EMP_NAME='박나라';

SELECT EMP_ID, EMP_NAME, JOB_CODE, MANAGER_ID
FROM EMPLOYEE
WHERE (JOB_CODE, MANAGER_ID) = (SELECT JOB_CODE, MANAGER_ID
                                FROM EMPLOYEE
                                WHERE EMP_NAME='박나라');

/* 
    4. 다중행, 다중열 서브쿼리
    
    서브쿼리 조회 결과가 여러행, 여러 컬럼일 경우
*/
-- 각 직급별 최소급여를 받는 사원들 조회(사번, 이름, 직급코드, 급여)
-- 1) 각 직급별 최소 급여를 조회
SELECT JOB_CODE , MIN(SALARY)
FROM EMPLOYEE
GROUP BY JOB_CODE;

-- 2) 위의 목록들 중에서 일치하는 사원
-- 2-1) 조건 나열 (IN연산자사용)
SELECT EMP_ID, EMP_NAME, JOB_CODE, SALARY
FROM EMPLOYEE
WHERE (JOB_CODE, SALARY) IN (('J2',3700000), ('J7',1380000));

--3) 위 내용을 가지고 쿼리문으로 합치기
SELECT EMP_ID, EMP_NAME, JOB_CODE, SALARY
FROM EMPLOYEE
WHERE (JOB_CODE, SALARY) IN (SELECT JOB_CODE , MIN(SALARY)
                            FROM EMPLOYEE
                            GROUP BY JOB_CODE);
---------------------------------------------
-- 각 부서별 최고급여를 받는 사원들 조회(사번, 이름, 부서코드, 급여)
--1) 각 부서별 최고 급여 조회
SELECT DEPT_CODE, MAX(SALARY)
FROM EMPLOYEE
GROUP BY DEPT_CODE;
--2)위 조건을 만족하는 사원들만 추리기( IN연산자 사용)
SELECT EMP_ID, EMP_NAME,  NVL(DEPT_CODE , '없음') , SALARY
FROM EMPLOYEE
WHERE ( NVL(DEPT_CODE , '없음'), SALARY) IN (SELECT  NVL(DEPT_CODE , '없음'), MAX(SALARY)
                                FROM EMPLOYEE
                                GROUP BY DEPT_CODE);
---------------------------------------------------------------------------------------------------
/* 
    5. 인라인뷰(INLINE VIEW)
    FROM 절에 서브쿼리를 제시하면
    
    서브쿼리를 실행한 결과값인 RESULT SET을 테이블을 대신해서 사용하겠다
*/

-- 보너스 포함 연봉이 3000만원 이상인 사원들의 사번, 이름, 보너스포함연봉 , 부서코드를 조회
SELECT EMP_ID, EMP_NAME, (SALARY + SALARY* NVL(BONUS,0) ) * 12 "보너스 포함 연봉", DEPT_CODE
FROM EMPLOYEE
WHERE (SALARY + SALARY* NVL(BONUS,0) ) * 12 >= 30000000;

--> 인라인 뷰를 사용 : 사원명만 골라내기(보너스 포함 연봉이 3000만원 이상인 사원들의 이름만)
SELECT "보너스 포함 연봉"
FROM (
        SELECT EMP_ID , EMP_NAME, (SALARY + SALARY* NVL(BONUS,0) ) * 12 AS "보너스 포함 연봉" , DEPT_CODE
        FROM EMPLOYEE
        WHERE (SALARY + SALARY* NVL(BONUS,0) ) * 12 >= 30000000
)
WHERE DEPT_CODE IS NULL;

-- 인라인뷰를 주로 사용하는 예
-- TOP-N분석: 데이터베이스 상에 존재하는 자료중 최상위 N개의 자료를 보기위해 사용하는 기능

-- 전 직원중 급여가 가장 높은상위 5명(순위, 사윈명, 급여)
-- *ROWNUM : 오라클에서 제공해주는 칼럼, 조회된 순선대로 1부터 순서를 부여해주는 칼럼
SELECT ROWNUM , EMP_NAME, SALARY -- ROWNUM으로 순번 부여하기
FROM (
        SELECT *
        FROM EMPLOYEE
        ORDER BY SALARY DESC -- ORDER BY로 정렬먼저시키고, 
    )
WHERE ROWNUM <= 5;

-- 각 부서별 평균급여가 높은 3개의 부서의 부서코드, 평균급여 조회
-- 1) 각 부서별 평균 급여 => 높은순서대로 추려서
SELECT DEPT_CODE, ROUND(AVG(SALARY)) AS "평균"
FROM EMPLOYEE
GROUP BY DEPT_CODE
ORDER BY 평균 DESC;
-- 2) 순번 부여, 상위 3개만 추리기
-- SELECT ROWNUM "순위", S.*
SELECT ROWNUM "순위", DEPT_CODE , "ROUND(AVG(SALARY))"
FROM (SELECT DEPT_CODE, ROUND(AVG(SALARY)) 
        FROM EMPLOYEE
        GROUP BY DEPT_CODE
        ORDER BY 2 DESC) S
WHERE ROWNUM <= 3;

-- ROWNUM칼럼을 이용해서 순위를 매길 수있다.
-- 다만, 정렬이되지 않은 상태에서는 순위를 매기면 의미가 없으므로 정렬을 먼저 시키고 순위를 나중에 매겨야한다
-- 우선적으로 인라인뷰로 ORDER BY를 정렬을하고, 메인쿼리에서 순서를 붙인다.

-- 가장 최근에 입사한 사원 5명 조회(사원명,급여,입사일)
-- 입사일 기준 미래 ~ 과거(내림차순), 순번 부여후 5명
SELECT ROWNUM , E.*
FROM (
        SELECT EMP_NAME, SALARY, HIRE_DATE
        FROM EMPLOYEE
        ORDER BY HIRE_DATE DESC
        ) E
WHERE ROWNUM <= 5;
/* 
    6. 순위 매기는 함수(WINDOW FUNCTION)
    RANK() OVER(정렬기준)
    DENSE_RANK() OVER(정렬기준)
    
    - RANK() OVER(정렬기준): 공동1위가 3명이라고 한다면 그다음순위는 4위로하겠다
    - DENSE_RANK() OVER(정렬기준) : 공동1위가 3명이라고 한다면 그 다음순위는 무조건 2위로 하겠다.
    
    정렬 기준 : ORDER BY절(정렬기준 칼럼이름, 오름차순/내림차순), NULL FIRST/NULL LAST옵션은 기술이 불가능.
    
    SELECT 절에서만 기술 가능함.
*/
-- 사원들의 급여가 높은 순서대로 매겨서 사원명, 급여, 순위 조회 : RANK() OVER()
SELECT EMP_NAME, SALARY, RANK() OVER(ORDER BY SALARY DESC) "순위"
FROM EMPLOYEE; -- 공동 19위 2명, 다음순위는 21위.

SELECT EMP_NAME, SALARY, DENSE_RANK() OVER(ORDER BY SALARY DESC) "순위"
FROM EMPLOYEE; -- 공동 19위 2명, 그 다음순위는 20위.

-- 5위까지만 출력하겠다.
SELECT EMP_NAME, SALARY, DENSE_RANK() OVER(ORDER BY SALARY DESC) "순위"
FROM EMPLOYEE
WHERE DENSE_RANK() OVER (ORDER BY SALARY DESC) <= 5; -- 윈도우 함수를 WHERE 조건절에 기술할수 없다. 

-->> 인라인뷰로 전환
--1) rank함수로 순위를 매기고(정렬까지 완료시키기)
SELECT EMP_NAME, SALARY, RANK() OVER(ORDER BY SALARY DESC) "순위"
FROM EMPLOYEE;

-- 2) 1) 1번 결과물을 토대로 조회하기(5위까지만)

SELECT E.*
FROM (SELECT EMP_NAME, SALARY, RANK() OVER(ORDER BY SALARY DESC) "순위"
        FROM EMPLOYEE) E
WHERE "순위" <= 5;
