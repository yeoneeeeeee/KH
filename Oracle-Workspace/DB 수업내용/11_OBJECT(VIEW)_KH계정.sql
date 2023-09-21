/*
    * OBJECT
    데이터베이스를 이루는 논리적인 구조물들
    
    * OBJECT의 종류
    - TABLE, USER, VIEW, SEQUENCE, INDEX, PACAKGAE, TRIGGER, FUNCTION ...
    
    <VIEW 뷰>    
    SELECT문을 저장해 둘 수 있는 객체
    (자주쓰일 긴 SELECT문을 VIEW에 저장해두면 매번 긴 SELECT문을 다시 기술할 필요가 없음)
    => 조회용 임시테이블 같은 존재(실제 데이터가 담겨있는것은 아님)    
*/
---------------- 실습문제--------------------------
-- '한국'에서 근무하는 사원들의 사번, 이름, 부서명, 급여, 근무국가명, 직급명을 조회하시오
SELECT 
    EMP_ID, EMP_NAME, DEPT_TITLE, SALARY, NATIONAL_NAME, JOB_NAME
FROM EMPLOYEE E 
JOIN DEPARTMENT D ON (E.DEPT_CODE = D.DEPT_ID)
JOIN LOCATION L ON (D.LOCATION_ID = L.LOCAL_CODE)
JOIN NATIONAL N USING(NATIONAL_CODE)
JOIN JOB USING(JOB_CODE)
WHERE NATIONAL_NAME = '한국';

/* 
    1. VIEW 생성 방법
    [ 표현법 ]
    CREATE VIEW 뷰명 AS 서브쿼리;
    
    CREATE OR REPLACE VIEW 뷰명 AS 서브쿼리;
    => 뷰 생성시 기존에 중복된 이름의 뷰가 없다면 새롭게 뷰가 생성되고
       기존에 중복된 이름의 뷰가 있다면 그 이름의 뷰를 변경한다.
       OR REPLACE는 생략 가능
*/

CREATE VIEW VW_EMPLOYEE
AS SELECT 
    EMP_ID, EMP_NAME, DEPT_TITLE, SALARY, NATIONAL_NAME, JOB_NAME
FROM EMPLOYEE E 
JOIN DEPARTMENT D ON (E.DEPT_CODE = D.DEPT_ID)
JOIN LOCATION L ON (D.LOCATION_ID = L.LOCAL_CODE)
JOIN NATIONAL N USING(NATIONAL_CODE)
JOIN JOB USING(JOB_CODE)
WHERE NATIONAL_NAME = '한국';

-- 연결계정 관리자계정으로 변경
GRANT CREATE VIEW TO KH;
-- KH계정으로 복귀

SELECT * FROM VW_EMPLOYEE;

SELECT * FROM (SELECT 
    EMP_ID, EMP_NAME, DEPT_TITLE, SALARY, NATIONAL_NAME, JOB_NAME
FROM EMPLOYEE E 
JOIN DEPARTMENT D ON (E.DEPT_CODE = D.DEPT_ID)
JOIN LOCATION L ON (D.LOCATION_ID = L.LOCAL_CODE)
JOIN NATIONAL N USING(NATIONAL_CODE)
JOIN JOB USING(JOB_CODE)
WHERE NATIONAL_NAME = '한국');

-- 위와같이 복잡한 서브쿼리를 이용하여 그때그때 필요한 데이터들을 조회하는것 보다
-- 한번 뷰를 생성 한후 뷰의 이름으로 간단하게 조회하는게 효율이 더 좋다.

-- 보너스 컬럼이 없는 뷰에서 보너스도 조회하고 싶을경우 새롭게 뷰를 생성해줘야하는데,
-- 삭제하고 다시 생성하는것보다 CREATE OR REPLACE VIEW를 사용하면 좀거 간편하게 생성 가능
CREATE OR REPLACE VIEW VW_EMPLOYEE
AS SELECT 
    EMP_ID, EMP_NAME, DEPT_TITLE, SALARY, NATIONAL_NAME, JOB_NAME, BONUS
FROM EMPLOYEE E 
JOIN DEPARTMENT D ON (E.DEPT_CODE = D.DEPT_ID)
JOIN LOCATION L ON (D.LOCATION_ID = L.LOCAL_CODE)
JOIN NATIONAL N USING(NATIONAL_CODE)
JOIN JOB USING(JOB_CODE);

SELECT * FROM VW_EMPLOYEE;
-----------------------------------------------------
/*
    뷰는 논리적인 가상테이블 => 실질적으로 데이터를 저장하고 있지는 않음
    쿼리문이 text문구로 저장되어있음
    해당 계정이 가지고 있는 VIEW들에 대한 내용을 조회하고자 한다면 USER_VIEWS 데이터 딕셔너리를
    이용하면 된다.
*/
SELECT * FROM USER_VIEWS;

/*
    뷰 컬럼에 별칭 부여
    서브쿼리 부분에 SELECT절에 함수 OR 산술연산식이 기술되어있는 경우 "반드시" 별칭으로 지정해줘야함
*/
-- 사원의 사번, 이름, 직급명, 성별, 근무년수를 조회할 수 있는 SELECT문을 VIEW로 정의
CREATE OR REPLACE VIEW VW_EMP_JOB
AS SELECT EMP_ID, EMP_NAME, JOB_NAME , 
          DECODE(SUBSTR(EMP_NO,8,1),'1','남','2','여' ) ,
          EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM HIRE_DATE)
   FROM EMPLOYEE
   JOIN JOB USING(JOB_CODE);
-- 오류발생 : "must name this expression with a column alias"
CREATE OR REPLACE VIEW VW_EMP_JOB
AS SELECT EMP_ID, EMP_NAME, JOB_NAME , 
          DECODE(SUBSTR(EMP_NO,8,1),'1','남','2','여' ) "성별" ,
          EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM HIRE_DATE) "근무년수"
   FROM EMPLOYEE
   JOIN JOB USING(JOB_CODE);
-- 뷰 생성 성공

SELECT EMP_NAME, 성별, 근무년수 
FROM VW_EMP_JOB;

-- 또 다른 방법으로 별칭 부여하기(단, 모든 칼럼에대해서 모두 별칭을 기술해야함)
CREATE OR REPLACE VIEW VW_EMP_JOB(사번, 사원명, 직급명, 성별, 근무년수)
AS SELECT EMP_ID, EMP_NAME, JOB_NAME , 
          DECODE(SUBSTR(EMP_NO,8,1),'1','남','2','여' ) ,
          EXTRACT(YEAR FROM SYSDATE) - EXTRACT(YEAR FROM HIRE_DATE)
   FROM EMPLOYEE
   JOIN JOB USING(JOB_CODE);
   
SELECT * FROM VW_EMP_JOB;

SELECT 사원명, 직급명
FROM VW_EMP_JOB
WHERE 성별 = '여';
-- 뷰에서 생성할때 붙인 별칭, 리터럴값들을 SELECT시 활용 가능하다.

-- 뷰를 삭제하고자 한다면
DROP VIEW VW_EMP_JOB;

SELECT * FROM USER_VIEWS;
/* 
    * 생성된 뷰를 이용해서 DML(INSERT, UPDATE , DELETE)사용 가능
    
    주의사항 : 뷰를 통해서 조작하게 된다면 실제 데이터가 담겨있는 테이블에도 변경사항이 적용된다.
*/
CREATE VIEW VW_JOB
AS SELECT * FROM JOB;

SELECT * FROM VW_JOB;
SELECT * FROM JOB;

-- 뷰에 INSERT
INSERT INTO VW_JOB
VALUES('J8','인턴');

SELECT * FROM VW_JOB;
SELECT * FROM JOB;
-- JOB테이블에도 값이 INSERT된것을 확인 가능하다.

-- VW_JOB이란 뷰에서 JOB_CODE J8인 JOB_NAME을 '알바'로 변경
UPDATE VW_JOB
SET JOB_NAME ='알바'
WHERE JOB_CODE = 'J8';

SELECT * FROM JOB;

-- VW_JOB뷰로부터 JOB_CODE가 J8인 행을 삭제
DELETE FROM VW_JOB
WHERE JOB_CODE = 'J8';

SELECT * FROM JOB;
/* 
    * DML이 가능한 경우 : 서브쿼리를 이용해서 기존의 테이블을 별도의 처리 없이 복제하고자 할 경우
    
    * 하지만 뷰를 가지고 DML이 불가능한 케이스가 더 많다. => 한번의 처리가 들어간 경우에는 불가능함.
    1) 뷰에 정의되어 있지 않은 컬럼을 조작하는 경우
    2) 뷰에 정의되어 있지 않은 컬럼 중에 베이스테이블 상에 NOT NULL 제약조건이 지정된 경우
    3) 산술연산식 또는 함수를 통해서 정의되어 있는 경우
    4) 그룹함수나 GROUP BY절이 포함된 경우
    5) DISTINCT 구문이 포함된 경우
    6) JOIN을 이용해서 여러 테이블을 매칭시켜놓은 경우
*/
-- 1) 뷰에 정의되어 있지 않은 칼럼을 조작하는 경우
CREATE OR REPLACE VIEW VW_JOB
AS SELECT JOB_NAME FROM JOB;

SELECT * FROM VW_JOB;

INSERT  INTO VW_JOB(JOB_CODE, JOB_NAME)
VALUES('J8','인턴'); -- 에러

UPDATE VW_JOB 
SET JOB_NAME='인턴'
WHERE JOB_CODE = 'J7';

-- 2) 뷰에 정의되어 있지 않은 컬럼중에 베이스테이블 상에 NOT NULL 제약조건이 지정된 경우
INSERT  INTO VW_JOB(JOB_NAME)
VALUES('인턴');

UPDATE VW_JOB
SET    JOB_NAME = '인턴'
WHERE JOB_NAME = '사원';

ROLLBACK;

DELETE FROM VW_JOB
WHERE JOB_NAME='사원';

ROLLBACK;

--3) 산술연산식 또는 함수를 통해서 정의되어있는 경우
CREATE OR REPLACE VIEW VW_EMP_SAL
AS SELECT EMP_ID , EMP_NAME, SALARY, SALARY * 12 연봉
FROM EMPLOYEE;

SELECT * FROM VW_EMP_SAL;

INSERT INTO VW_EMP_SAL
VALUES(400,'민경민',5000000, 60000000);-- 실제 테이블에 존재하지 않는 값을 추가할수 없음.

DELETE FROM VW_EMP_SAL
WHERE 연봉 = 96000000;
-- 해당 칼럼을 조건절에서는 사용이 가능하다.

SELECT * FROM VW_EMP_SAL;

ROLLBACK;

-- 4) 그룹함수나 GROUP BY 절이 포함된경우
CREATE OR REPLACE VIEW VW_GROUPDEPT
AS SELECT DEPT_CODE, SUM(SALARY) 합계, FLOOR(AVG(SALARY)) 평균급여
FROM EMPLOYEE
GROUP BY DEPT_CODE;

SELECT * FROM VW_GROUPDEPT;

INSERT INTO VW_GROUPDEPT VALUES('D3',8000000,4000000);

UPDATE VW_GROUPDEPT
SET 합계 = 8000000
WHERE DEPT_CODE = 'D1';

DELETE FROM VW_GROUPDEPT
WHERE 합계 = 5210000;
-- 5) DISTNCT 구문이 포함된 경우 X
-- 6) JOIN을 이용해서 여러테이블을 매칭시켜놓은 경우
CREATE OR REPLACE VIEW VW_JOINEMP
AS SELECT EMP_ID, EMP_NAME, DEPT_TITLE
   FROM EMPLOYEE
   JOIN DEPARTMENT ON DEPT_CODE = DEPT_ID;

SELECT * FROM VW_JOINEMP;

INSERT INTO VW_JOINEMP VALUES(300,'민경민','총무부');

-- 이름변경시
UPDATE VW_JOINEMP
SET EMP_NAME = '서동일'
WHERE EMP_ID = 200;

-- 회계부로 변경시
UPDATE VW_JOINEMP
SET DEPT_TITLE = '회계부'
WHERE EMP_ID=200;

DELETE FROM VW_JOINEMP 
WHERE EMP_ID =200;

ROLLBACK;
-- VIEW에서 사용가능한 옵션들
-- 1. OR REPLACE
CREATE OR REPLACE VIEW V_EMP_SALARY
AS SELECT * FROM EMPLOYEE;

-- 2. FORCE/NOFORCE옵션 : 실제 테이블이 업어도 VIEW를 먼저 생성할 수 있게 해주는 옵션
-- CREATE OR REPLACE NOFORCE : 기본값임.
CREATE FORCE VIEW V_FORCETEST
AS SELECT A,B,C FROM NOTEXIST;

SELECT * FROM V_FORCETEST; -- 에러발생

CREATE TABLE NOTEXIST(
    A NUMBER,
    B NUMBER,
    C NUMBER
);

-- 3. WITCH CHECK OPTION
-- SELECT문의 WHERE절에서 사용한 칼럼을 수정하지 못하게 하는 옵션
CREATE OR REPLACE VIEW V_CHECKOPTION
AS SELECT EMP_ID, EMP_NAME, SALARY, DEPT_CODE
   FROM EMPLOYEE 
   WHERE DEPT_CODE = 'D5' WITH CHECK OPTION;

SELECT * FROM V_CHECKOPTION;

UPDATE V_CHECKOPTION SET DEPT_CODE = 'D6' WHERE EMP_ID=206;

UPDATE V_CHECKOPTION SET SALARY = 6000000 WHERE EMP_ID=206;

ROLLBACK;

-- 4. WITH READ ONLY
--  VIEW 자체를 수정 못하게 차단하는 옵션
CREATE OR REPLACE VIEW V_READ
AS SELECT 
    EMP_ID, EMP_NAME, SALARY, DEPT_CODE
    FROM EMPLOYEE 
    WHERE DEPT_CODE = 'D5' WITH READ ONLY;

UPDATE V_READ SET EMP_NAME = 5000000;
-- "cannot perform a DML operation on a read-only view"








