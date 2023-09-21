/* 
    <JOIN>
    
    두 개 이상의 테이블에서 데이터를 같이 조회하고자 할 때 사용되는 구문 => SELECT문 이용
    조회 결과는 하나의 결과물(RESULTSET)으로 나옴
    
    JOIN을 해야하는 이유?
    관계형 데이베이스에서는 최소한의 데이터로 각각의 테이블에 데이터를 보관하고 있음
    사원정보는 사원테이블, 직급정보는 직급테이블, ..등 => 중복을 최소하 해서 저장함
    => 즉 JOIN구문을 이용해서 여러테이블간의 "관계"를 맺어서 같이 조회해야함
    => 단, 무작정 JOIN을 하는것이 아니라 테이블간에 "연결고리"에 해당하는 칼럼을 매칭시켜서 조회해야한다.
    
    문법상 분류 : JOIN은 크게 "오라클전용구문" "ANSI(미국 국립 표준 협회)구문"으로 나뉘어짐
    
    
    
    오라클 전용구문                              |           ANSI구문(오라클+ 기타 DBMS)
    ==================================================================================
            등가조인(EQUAL JOIN)                |   내부조인(INNER JOIN) -> JOIN USING/ON
    ==================================================================================
             포괄 조인                          |    외부조인(OUTERJOIN) -> JOIN USING
             (LEFT OUTER JOIN)                 |    왼쪽 외부조인(LEFT OUTER JOIN)
             (RIGHT OUTER JOIN)                |   오른쪽 외부조인(RIGHT OUTER JOIN)
                                               | 전체 외부조인(FULL OUTER JOIN)
    =====================================================================================
        카테시안의 곱                            |    교차조인(CROSS JOIN)
    -----------------------------------------------------------------------------------------
        자체조인
        비등가조인
        다중조인(테이블3개이상조인)
*/
-- JOIN을 사용하지 않는 예
-- 전체 사원들의 사번, 사원명, 부서코드, 부서명까지 알아내고자 한다면?
SELECT EMP_ID, EMP_NAME, DEPT_CODE
FROM EMPLOYEE;

SELECT DEPT_ID, DEPT_TITLE
FROM DEPARTMENT;

--> 조인을 통해서 연결고리에 해당되는 칼럼들만 제대로 매칭시키면 하나의 결과물로 조회 가능.
/* 
    1. 등가조인(EQUAL JOIN) / 내부조인(INNER JOIN)
    연결시키고자하는 칼럼의 값이 일치하는 행들만 조인되서 조회
    (일치하지 않는경우 결과에서 제외)
    => 동등비교연산자 = (일치한다라는 조건을 제시함)
    
    [표현법]
    등가조인 (오라클 구문)
    SELECT 칼럼1,칼럼2....
    FROM 조인하고자하는 테이블명들 나열
    WHERE 연결할 컬럼에 대한 조건을 제시 (=)
    
    내부조인 (ANSI구문)
    SELECT 칼럼1,칼럼2,...
    FROM 기준으로삼을 테이블명 1개만제시
    JOIN 조인할 테이블명 1개만 제시 ON(연결할 컬럼에 대한 조건을 제시 (=))
    
    내부조인 (ANSI구문)
    SELECT 칼럼1,칼럼2,...
    FROM 기준으로삼을 테이블명 1개만제시
    JOIN 조인할 테이블명 1개만 제시 USING(연결할 칼람명 1개만 제시) -- 연결할 칼럼명이 동일할때만 쓴다
    
    + 만약에 연결할 컬럼명이 동일하다면(EMPLOYEE의 JOB_CODE, JOB의 JOB_CODE) USING구문을 제외하고
    명시적으로 어느테이블로부터 온 컬럼명인지 적어줘야한다(테이블명이나 별칭을 활요해서)
*/
-->> 오라클 전용 구문
-- FROM절에 조회하고자한느 테이블들을 나열( , 를 사용해서)
-- WHERE절에 매칭시킬 칼럼명에 대한 조건을 제시

--전체 사원들에대한 사번, 사원명, 부서코드 , 부서명

--1) 연결항 칼럼명이 다른케이스(EMPLOYE - "DEPT_CODE" , DEPARTMENT - "DEPT_ID")
SELECT EMP_ID, EMP_NAME, DEPT_CODE, DEPT_TITLE
FROM EMPLOYEE, DEPARTMENT
WHERE DEPT_CODE = DEPT_ID; -- DEPT_CODE와 DEPT_ID가 동일하다면 하나로 합쳐서 조회하겠다
--> 일치하지 않는 값은 조회되지 않음(NULL, D3,D4,D7데이터는 조회 않는다)
--> 두개 이상의 테이블을 조인할때 일치하는 값이 없는 행들은 결과에서 제외가 되었다

-- 전체 사원들의 사번, 사원명, 직급코드 , 직급명까지 알아내고자한다
-- 2) 연결할 칼럼명이 동일한경우 (EMPLOYEE - "JOB_CODE" / JOB - "JOB_CODE")
SELECT EMP_ID, EMP_NAME, JOB_CODE, JOB_NAME
FROM EMPLOYEE , JOB
WHERE JOB_CODE = JOB_CODE; --에러발생
-- ambiguously : 애매하다, 모호하다 => 조회하고자는 칼럼이 어떤 테이블의 칼럼이 다 명시해줘야함.

-- 방법1) 테이블 명을 이용하는 방법 => 테이블명.칼럼명 (JOB.JOB_CODE)
SELECT EMP_ID, EMP_NAME, EMPLOYEE.JOB_CODE, JOB_NAME
FROM EMPLOYEE , JOB
WHERE EMPLOYEE.JOB_CODE = JOB.JOB_CODE;

-- 방법2) 테이블에 별칭을 붙여서 사용하는 방법 (별칭.칼럼명)
SELECT EMP_ID, EMP_NAME, E.JOB_CODE, JOB_NAME
FROM EMPLOYEE E, JOB J -- 테이블 별칭에는 AS를 붙일수 없음.
WHERE E.JOB_CODE = J.JOB_CODE;

-->> ANSI구문
-- FROM절에 기준테이블을 "하나"만 기술 한 뒤
-- 그 뒤에 JOIN절에서 같이 조회하고자 하는 테이블 기술, 또한 매칭시킬 컬럼에 대한 조건도 같이 기술
-- USING, ON 구문

--전체 사원들에대한 사번, 사원명, 부서코드 , 부서명
--1) 연결항 칼럼명이 다른케이스(EMPLOYE - "DEPT_CODE" , DEPARTMENT - "DEPT_ID")
--   무조건 ON 구문만 사용가능함.
SELECT EMP_NAME, EMP_ID, DEPT_CODE, DEPT_TITLE
FROM EMPLOYEE
/* INNER */ JOIN DEPARTMENT ON DEPT_CODE = DEPT_ID; -- INNER 생략 가능.


-- 전체 사원들의 사번, 사원명, 직급코드 , 직급명까지 알아내고자한다
-- 2) 연결할 칼럼명이 동일한경우 (EMPLOYEE - "JOB_CODE" / JOB - "JOB_CODE")
-- => ON구문, USING구문 가능함
-- 2-1) ON 구문 
SELECT EMP_ID, EMP_NAME, E.JOB_CODE, JOB_NAME
FROM EMPLOYEE E
JOIN JOB J ON E.JOB_CODE = J.JOB_CODE;

-- 2-2) USING 구문 : 컬럼명이 동일한 경우만 사용가능, 동일한 컬럼명을 하나로 써주면 알아서 매칭이 된다.
SELECT EMP_ID,EMP_NAME,JOB_CODE,JOB_NAME
FROM EMPLOYEE 
JOIN JOB USING(JOB_CODE);

-- [참고] 자연조인(NATURAL JOIN) : 등가조인 방법중하나
-- => 동일한 타입과 이름을 가진 칼럼을 조인 조건으로 이용하는 
SELECT EMP_ID , EMP_NAME, JOB_CODE, JOB_NAME
FROM EMPLOYEE
NATURAL JOIN JOB;
-- 운좋게도 두개의 테이블에 일치하는 칼럼이 유일하게 딱 한개만 존재했다..(JOB_CODE)
--============================================-=================
-- 1. 직급이 대리인 사원들의 정보를 조회(사번, 사원명, 월급, 직급명)
--ORACLE전용구문
SELECT EMP_ID, EMP_NAME, SALARY , JOB_NAME
FROM EMPLOYEE E , JOB J
WHERE E.JOB_CODE = J.JOB_CODE AND JOB_NAME ='대리';

--ANSI구문
SELECT EMP_ID, EMP_NAME, SALARY , JOB_NAME
FROM EMPLOYEE
JOIN JOB USING(JOB_CODE)
WHERE JOB_NAME='대리';
-- 2. 부서가 인사관리부인 사원들의 사번, 사원명 보너스를 조회(오라클전용구문1, ANSI1)
SELECT EMP_ID, EMP_NAME, BONUS 
FROM EMPLOYEE , DEPARTMENT
WHERE DEPT_CODE = DEPT_ID  AND DEPT_TITLE = '인사관리부';

SELECT EMP_ID, EMP_NAME, BONUS 
FROM EMPLOYEE
JOIN DEPARTMENT ON DEPT_CODE = DEPT_ID 
WHERE DEPT_TITLE = '인사관리부';
-- 3. 부서가 총무부가 아닌 사원들의 사원명, 급여, 입사일조회(1,1)
SELECT EMP_NAME,SALARY, HIRE_DATE
FROM EMPLOYEE , DEPARTMENT
WHERE DEPT_ID = DEPT_CODE AND DEPT_TITLE <> '총무부';

SELECT EMP_NAME,SALARY, HIRE_DATE
FROM EMPLOYEE 
JOIN DEPARTMENT ON DEPT_ID = DEPT_CODE 
WHERE DEPT_TITLE ^= '총무부';
-- 4. 보너스를 받는 사원들의 사번, 사원명, 보너스 , 부서명 조회
SELECT EMP_ID, EMP_NAME, BONUS , DEPT_TITLE
FROM EMPLOYEE , DEPARTMENT 
WHERE DEPT_ID = DEPT_CODE AND BONUS IS NOT NULL;

SELECT EMP_ID, EMP_NAME, BONUS , DEPT_TITLE
FROM EMPLOYEE
JOIN DEPARTMENT ON DEPT_ID = DEPT_CODE 
WHERE BONUS IS NOT NULL;
-- 5. 아래의 두 테이블을 참고해서 부서코드 , 부서명, 지역코드, 지역명(LOCAL_NAME)조회하시오(1,1)
-- DEPARTMENT, LOCATION 참고.
SELECT DEPT_ID , DEPT_TITLE, LOCAL_CODE, LOCAL_NAME
FROM DEPARTMENT, LOCATION
WHERE LOCATION_ID = LOCAL_CODE;

SELECT DEPT_ID , DEPT_TITLE, LOCAL_CODE, LOCAL_NAME
FROM DEPARTMENT
JOIN LOCATION ON LOCATION_ID = LOCAL_CODE;

-- 등가조인/ 내부(이너)조인 : 일치하지 않는 행들은 제외되고 조회가 됨.
-----------------------------------------------------------------------------
-- 전체 사원들의 사원명, 급여 ,부서명
SELECT EMP_NAME, SALARY, DEPT_TITLE
FROM EMPLOYEE
JOIN DEPARTMENT ON DEPT_ID = DEPT_CODE;
-- DEPT_CODE가 NULL값인 2명의 사원은 조회되지 않음.
-- 즉, 부서배정받지 않은 사원들은 조회되지 않았다.
-- 아무도 존재하지 않는부서인 D3, D4, D7에 대해서도 조회되지 않았다.


/*
    2. 포괄조인 / 외부조인(OUTER JOIN)
    
    테이블간의 JOIN시에 "일치하지 않는 행도"포함시켜서 조회 가능
    단, 반드시 LEFT/RIGHT를 지정해야함 => 기준이되는 테이블이 왼쪽이라면 LEFT, 오른쪽이라면 RIGHT
    
    일치하는행 + 기준이 되는 테이블 기준으로 일치하지 않는 행도 포함시켜서 조회
*/

-- 전체 사원들의 사원명, 급여, 부서명
-- 1) LEFT OUTER JOIN : 두 테이블 중왼편에 기술된 테이블을 기준으로 JOIN
--                      즉, 뭐가 되었뜬간에 왼쪽에 기술된 테이블의 데이터는 무조건 다 조회하게 된다.
--                      (일치하는 것을 찾지 못하더라도 조회하겠다.)

-->> ANSI구문
SELECT EMP_NAME , SALARY , DEPT_TITLE
FROM EMPLOYEE 
LEFT /*OUTER*/ JOIN DEPARTMENT ON DEPT_CODE = DEPT_ID; 
--> EMPLOYEE테이블을 기준으로 조회했기 때문에 EMPLOYEE에 존재하는 데이터는 뭐가 되었뜬가네 다 조회되게끔 한다.

--> 오라클전용구문
SELECT EMP_NAME , SALARY , DEPT_TITLE
FROM EMPLOYEE , DEPARTMENT
WHERE DEPT_CODE = DEPT_ID(+);
-- 내가 기준으로 삼을 테이블의 컬럼명이 아닌 반대 테이블의 컬럼명에 +를 붙여주면 된다.

-- 2) RIGHT OUTER JOIN : 두 테이블중 오른쪽에 기술된 테이블을 기준으로 JOIN
--                       뭐가 되었든 간에 오른쪽에 기술된 테이블의 데이터는 무조건 조회되게한다
--> ANSI 구문
SELECT EMP_NAME, SALARY , DEPT_TITLE
FROM EMPLOYEE
RIGHT JOIN DEPARTMENT ON DEPT_CODE = DEPT_ID;

SELECT EMP_NAME , SALARY , DEPT_TITLE
FROM EMPLOYEE , DEPARTMENT
WHERE DEPT_CODE(+) = DEPT_ID;

--3) FULL OUTER JOIN : 두 테이블이 가진 모든행을 조회
-- 일치하는 행들 + LEFT OUTER JOIN 기준 새롭게 추가된 행들 + RIGHT OUTER JOIN 기준 새롭게 추가된 행들
--ANSI 
SELECT 
    EMP_NAME, SALARY , DEPT_TITLE
FROM EMPLOYEE 
FULL OUTER JOIN DEPARTMENT ON DEPT_ID = DEPT_CODE;

--> 오라클 전용 구문은 사용불가 
SELECT EMP_NAME , SALARY , DEPT_TITLE
FROM EMPLOYEE , DEPARTMENT
WHERE DEPT_CODE(+) = DEPT_ID(+);
/* 
    3. 카테시안의 곱(CARTESIAN PRODUCT) / 교차조인(CROSS JOIN)
    모든 테이블의 각 행들이 서로서로 매핑된 데이터가 조회됨(곱집함) N * M 
    두 테이블의 행들이 모두 곱해진 행들의 조합이 출력
    
    ==> 각각 N개, M개의 행을 가진 테이블들의 카테시안 곱의 결과행은 N*M행
    ==> 모든 경우의 수를 다 따져서 조회하겠따
    ==> 방대한 데이터를 출력(과부하 위험이 발생할 수 있다.)
*/

--> 오라클 전용구문 (카테시안의곱)
-- 사원명 ,부서명
SELECT EMP_NAME,  DEPT_TITLE
FROM EMPLOYEE , DEPARTMENT
WHERE DEPT_CODE = DEPT_CODE
; -- 23 * 9 = 207행 출력

--> ANSI구문
SELECT EMP_NAME,  DEPT_TITLE
FROM EMPLOYEE
CROSS JOIN DEPARTMENT;

-- 카테시안 곱의 경우 : WHERE절에 기술하는 조인 조건이 잘못되었거나, 없을경우 발생

/*
    4. 비등가조인(non equal join)
    
    '=' 를 사용하지 않는 조인문 => 다른 비교연산자를 써서 조인하겠다.( > , < >= , <= , BETWEEN A AND B)
    => 지정한 칼럼값들이 일치하는 경우가아니라 범위에 포함되는경우 매칭해서 조회하겠다.
    
    등가조인 => =를 통해 일치하는 경우만 조회
    비등가조인=> =가 아닌 다른 비교연산자들로 범위에 포함되는 경우를 조회
*/

SELECT EMP_NAME, SALARY
FROM EMPLOYEE;

SELECT *
FROM SAL_GRADE;

-- 사원명, 급여, 급여등급(SAL_LEVEL)
SELECT EMP_NAME, SALARY , SAL_GRADE.SAL_LEVEL
FROM EMPLOYEE, SAL_GRADE
-- WHERE SALARY >= MIN_SAL AND SALARY < MAX_SAL;
WHERE SALARY BETWEEN MIN_SAL AND MAX_SAL;

--ANSI구문
SELECT EMP_NAME, SALARY, SAL_GRADE.SAL_LEVEL
FROM EMPLOYEE 
JOIN SAL_GRADE ON (SALARY BETWEEN MIN_SAL AND MAX_SAL);

/* 
    5. 자체조인(SELF JOIN)
    같은 테이블끼리 조인하는 경우 
    즉, 자기 자신의 테이블과 다시 조인을 맺겠다.
    => 자체조인의 경우 테이블에 반드시 별칭을 부여해야한다.
*/

-- 사원의 사번, 사원명, 사수의 사번, 사수명
--> 오라클
SELECT E.EMP_ID , E.EMP_NAME, E.MANAGER_ID, M.EMP_NAME
FROM EMPLOYEE E, EMPLOYEE M
WHERE E.MANAGER_ID = M.EMP_ID(+); -- LEFT OUTER JOIN

-- ANSI구문
SELECT E.EMP_ID , E.EMP_NAME, E.MANAGER_ID, M.EMP_NAME
FROM EMPLOYEE E
LEFT JOIN EMPLOYEE M ON (E.MANAGER_ID = M.EMP_ID);

/*
    <다중 JOIN>
    3개 이상의 테이블을 조인해서 조회하겠다.
    => 조인 순서가 중요하다.
*/
-- 사번 ,사원명, 부서명 , 직급명
SELECT EMP_ID, EMP_NAME, DEPT_TITLE, JOB_NAME
FROM EMPLOYEE E , DEPARTMENT D, JOB J
WHERE E.DEPT_CODE = D.DEPT_ID(+)
  AND E.JOB_CODE = J.JOB_CODE;
  
  
--> ANSI구문
SELECT EMP_ID, EMP_NAME, DEPT_TITLE, JOB_NAME
FROM EMPLOYEE E 
LEFT JOIN DEPARTMENT D ON E.DEPT_CODE = D.DEPT_ID
JOIN JOB J ON E.JOB_CODE = J.JOB_CODE;

  










