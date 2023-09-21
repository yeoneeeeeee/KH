/* 
    <PL/SQL>
    PROCEDURE LANGUAGE EXTENSION TO SQL
    
    오라클자체에 내장되어있는 절차적 언어
    SQL문장 내에서 변수의 정의, 조건처리(IF), 반복처리(LOOP,FOR,WHILE), 예외처리등을 지원하여
    SQL의 단점을 보완.
    다수의 SQL문을 한번에 실행가능(BLOCK구조)
    
    * PL/SQL구조
    - [선언부 (DECLARE SECTION)] : DECLARE로 시작, 변수나 상수를 선언 및 초기화하는 부분
    - 실행부 (EXECUTABLE SECTION) : BEGIN으로 시작 END로끝, SQL문(SELECT,UPDATE,DELETE..) 또는 제어문(조건문,반복문)
    등의 로직을 기술하는 부분 
    - [예외처리부 (EXCEPTION SECTION)] : EXCEPTION로 시작, 예외발생시 해결하기 위한 구문을 미리 기술해둘수 있는 부분.
*/

-- 서버 아웃풋 옵션 켜주기
SET SERVEROUTPUT ON;

BEGIN
    DBMS_OUTPUT.PUT_LINE('HELLO_ORACLE');
END;
/

/*
    1. DECLARE 선언부
        변수 및 상수 선언하는 공간(선언과 동시에 초기화도 가능)
        일반타입 변수, 레퍼런스 변수, ROW타입 변수
        
        1_1) 일반타입 변수 선언 및 초기화
        [표현법]
        변수명 [CONSTANT] 자료형 [:=값];
*/

DECLARE
    EID NUMBER;
    ENAME VARCHAR2(20);
    PI CONSTANT NUMBER := 3.14;
BEGIN
    --EID := 800;
    EID := &번호;
    -- 내가 값을 입력
    
    --ENAME := '민경민';
    ENAME := &이름;
    
    DBMS_OUTPUT.PUT_LINE('EID : ' || EID);
    DBMS_OUTPUT.PUT_LINE('ENAME : ' || ENAME);
    DBMS_OUTPUT.PUT_LINE('PI : ' || PI);
END;
/ 
-- 이게 있어야 블록종결로 가준되어서 다음 PL문 실행 가능함.
-- 1_2) 래퍼런스 타입 변수 선언 및 초기화(어떤테이블의 어떤칼럼의 데이터타입을 참조해서 그 타입으로 지정)
-- [표현법]
-- 변수명 테이블명.컬럼명%TYPE;
DECLARE
    EID EMPLOYEE.EMP_ID%TYPE;
    ENAME EMPLOYEE.EMP_NAME%TYPE;
    SAL EMPLOYEE.SALARY%TYPE;
BEGIN
    EID := '300';
    ENAME := '민경민';
    SAL := 3000000;
    
    -- 사번이 200번인 각 사원의 사번, 사원명, 연봉을 대입해보기
    SELECT
        EMP_ID ,EMP_NAME, SALARY
        INTO EID, ENAME, SAL
    FROM EMPLOYEE
    -- WHERE EMP_ID = 200;
    WHERE EMP_ID = &사번;    
    
    DBMS_OUTPUT.PUT_LINE('EID : ' || EID);
    DBMS_OUTPUT.PUT_LINE('ENAME : ' || ENAME);
    DBMS_OUTPUT.PUT_LINE('SAL : ' || SAL);
END;
/
------------------------------------- 실습문제----------------------------------------------------
/* 
    레퍼런스 타입 변수로 EID, ENAME, JCODE, SAL, DTITLE을선언하고
    각 자료형 EMPLOYEE(EMP_ID, EMP_NAME, JOB_CODE, SALARY)
             DEPARTMENT(DEPT_TITLE)들을 참조하도록
             
    사용자가 입력한 사번인 사원의 사번, 사원명, 직급코드, 급여, 부서명 조회후 변수에 담아서 출력    
*/
DECLARE
    EID EMPLOYEE.EMP_ID%TYPE;
    ENAME EMPLOYEE.EMP_NAME%TYPE;
    JCODE EMPLOYEE.JOB_CODE%TYPE;
    SAL EMPLOYEE.SALARY%TYPE;
    DTITLE DEPARTMENT.DEPT_TITLE%TYPE;
BEGIN
    
    SELECT EMP_ID, EMP_NAME, JOB_CODE, SALARY, DEPT_TITLE
      INTO EID, ENAME, JCODE, SAL, DTITLE
      FROM EMPLOYEE
      JOIN DEPARTMENT ON DEPT_CODE = DEPT_ID
    WHERE EMP_ID = &사번;    
    DBMS_OUTPUT.PUT_LINE(EID || ', ' || ENAME || ', ' || JCODE || ', ' || SAL || ', ' || DTITLE);    
END;
/
----------------------------------------------------------------------------------
--1-3) ROW타입 변수 선언
--     테이블의 한 행에 대한 모든 칼럼값을 한꺼번에 담을수 있는 변수
--     [표현식] 변수명 테이블명%ROWTYPE
DECLARE
    E EMPLOYEE%ROWTYPE;
BEGIN
    SELECT *
      INTO E
      FROM EMPLOYEE
    WHERE EMP_ID = &사번;
    
    DBMS_OUTPUT.PUT_LINE('사원명 : ' || E.EMP_NAME);
    DBMS_OUTPUT.PUT_LINE('급여   : ' || E.SALARY);
    DBMS_OUTPUT.PUT_LINE('보너스  : ' || NVL(E.BONUS,0));

END;
/
-----------------------------------------------------------
-- 2. BEGIN 실행부

-- <조건문>

-- 1) IF 조건신 THEN 실행내용 END IF;
-- 사번 입력받은 후 해당 사원의 사번, 이름, 급여, 보너스율을 출력
-- 단, 보너스를 받지 않는 사원은 보너스율 출력전 '보너스를지급받지 않는 사원입니다' 출력
DECLARE
    EID EMPLOYEE.EMP_ID%TYPE;
    ENAME EMPLOYEE.EMP_NAME%TYPE;
    SALARY EMPLOYEE.SALARY%TYPE;
    BONUS EMPLOYEE.BONUS%TYPE;
BEGIN

    SELECT EMP_ID , EMP_NAME , SALARY , NVL(BONUS,0)
      INTO EID , ENAME, SALARY, BONUS
    FROM EMPLOYEE
    WHERE EMP_ID = &사번;
    
    DBMS_OUTPUT.PUT_LINE('사번 : ' || EID);
    DBMS_OUTPUT.PUT_LINE('이름 : ' || ENAME);
    DBMS_OUTPUT.PUT_LINE('급여 : ' || SALARY);
    
    IF BONUS = 0
       THEN DBMS_OUTPUT.PUT_LINE('보너스를 지급받지 않는 사원입니다.');
    END IF;
    
    DBMS_OUTPUT.PUT_LINE('보너스 : ' || BONUS*100 || '%');    
END;
/

-- 2) IF 조건식 THEN 실행내용 ELSE 실행내용 END IF;
DECLARE
    EID EMPLOYEE.EMP_ID%TYPE;
    ENAME EMPLOYEE.EMP_NAME%TYPE;
    SALARY EMPLOYEE.SALARY%TYPE;
    BONUS EMPLOYEE.BONUS%TYPE;
BEGIN

    SELECT EMP_ID , EMP_NAME , SALARY , NVL(BONUS,0)
      INTO EID , ENAME, SALARY, BONUS
    FROM EMPLOYEE
    WHERE EMP_ID = &사번;
    
    DBMS_OUTPUT.PUT_LINE('사번 : ' || EID);
    DBMS_OUTPUT.PUT_LINE('이름 : ' || ENAME);
    DBMS_OUTPUT.PUT_LINE('급여 : ' || SALARY);
    
    IF BONUS = 0
       THEN DBMS_OUTPUT.PUT_LINE('보너스를 지급받지 않는 사원입니다.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('보너스 : ' || BONUS*100 || '%');    
    END IF;
END;
/
-----------------------------실습문제--------------------------------------------
DECLARE
    -- 레퍼런스타입변수 (EID, ENAME, DTITLE,NCODE) 
    EID EMPLOYEE.EMP_ID%TYPE;
    ENAME EMPLOYEE.EMP_NAME%TYPE;
    DTITLE DEPARTMENT.DEPT_TITLE%TYPE;
    NCODE KH.NATIONAL.NATIONAL_CODE%TYPE;
    TEAM VARCHAR2(10);
    --   참조할 컬럼   (EMP_ID, EMP_NAME, DEPT_TITLE, NATIONAL_CODE)
    -- 일반타입 변수 TEAM 문자열 : 국내팀, 해외팀
BEGIN
    -- 사용자가 입력한 사번의 사원이 사번, 이름, 부서명, 근무국가코드 조회후 각 변수에 대입
    SELECT EMP_ID, EMP_NAME, DEPT_TITLE, NATIONAL_CODE
      INTO EID, ENAME, DTITLE, NCODE
    FROM EMPLOYEE
    JOIN DEPARTMENT ON DEPT_CODE = DEPT_ID 
    JOIN LOCATION ON LOCATION_ID = LOCAL_CODE
    JOIN NATIONAL USING(NATIONAL_CODE)
    WHERE EMP_ID = &사번;
    -- NCODE의 값이 KO이 경우 TEAM변수에 한국팀 대입
    IF NCODE = 'KO'
       THEN TEAM := '한국팀';
    ELSE 
        TEAM := '해외팀';
    END IF;
    -- 그게 아닐경우 TEAM에 해외팀 대입    
    -- 사번, 이름, 부서, 소속(TEAM)을 출력
    DBMS_OUTPUT.PUT_LINE('사번 : ' || EID);
    DBMS_OUTPUT.PUT_LINE('이름 : ' || ENAME);
    DBMS_OUTPUT.PUT_LINE('부서 : ' || DTITLE);
    DBMS_OUTPUT.PUT_LINE('소속 : ' || TEAM);
END;
/
-- 3) IF 조건식 1 THEN 실행내용 ELSIF 조건식2 THEN 실행내용2 [ELSE 실행내용 N] END IF;
-- 급여가 500만원 이상이면 고급
-- 급여가 300만원 이상이면 중급
-- 그 외 초급
-- 출력문 : 해당 사원의 급여등급은 XX입니다.
DECLARE
    SAL EMPLOYEE.SALARY%TYPE;
    GRADE VARCHAR2(10);
BEGIN
    SELECT SALARY
      INTO SAL
    FROM EMPLOYEE
    WHERE EMP_ID = &사번;
    
    IF SAL >= 5000000 THEN GRADE := '고급';
    ELSIF SAL >= 3000000 THEN GRADE := '중급';
    ELSE GRADE := '초급';
    END IF;

    DBMS_OUTPUT.PUT_LINE('해당사원의 급여등급은 ' || GRADE || '입니다.');
END;
/
-- 4) CASE 비교대상자 WHEN 동등비교값1 THEN 결과값1 WHEN 비교값2 THEN 결과값2 ELSE 결과값3 END;
DECLARE
    EMP EMPLOYEE%ROWTYPE;
    DNAME VARCHAR2(10);
BEGIN
    SELECT *
      INTO EMP
    FROM EMPLOYEE
    WHERE EMP_ID = &사번;
    
    DNAME := CASE EMP.DEPT_CODE
               WHEN 'D1' THEN '인사팀'
               WHEN 'D2' THEN '회계팀'
               WHEN 'D3' THEN '마케팅팀'
               WHEN 'D4' THEN '국내영업팀'
               WHEN 'D9' THEN '총무팀'
               ELSE '해외팀'
              END;
    DBMS_OUTPUT.PUT_LINE(EMP.EMP_NAME || '은 ' || DNAME || '입니다.');
END;
/
---------------------------------------------------------------------------------------
-- 반복문
/* 
    1) BASIC LOOP문
    [표현식]
    LOOP
        반복적으로 실행한 구문;
        
        * 반복문을 빠져나갈수 있는 구문
    END LOOP;
    
    * 반복문을 빠져나갈수 있는 구문
    1) IF 조건식 THEN EXIT; END IF;
    2) EXIT WHEN 조건식;
*/
-- 1~5까지 순차적으로 1씩 증가하는 값을 출력
DECLARE
    I NUMBER := 1;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE(I);
        I := I +1;
        
        -- IF I = 6 THEN EXIT; END IF;
        EXIT WHEN I = 6;
    END LOOP;
END;
/
/* 
    2) FOR LOOP문
    FOR 변수 IN [REVERSE] 초기값 .. 최종값
    LOOP
        반복적으로 수행할 구문;
    END LOOP;
*/
BEGIN
    FOR I IN 10..15
    LOOP
        DBMS_OUTPUT.PUT_LINE(I);
    END LOOP;
END;
/

DROP TABLE TEST;

CREATE TABLE TEST(
    TNO NUMBER PRIMARY KEY,
    TDATE DATE
);

CREATE SEQUENCE SEQ_TNO
INCREMENT BY 2
MAXVALUE 10000;

BEGIN    
    FOR I IN 1..1000
    LOOP
        INSERT INTO TEST VALUES(SEQ_TNO.NEXTVAL , SYSDATE);
    END LOOP;    
END;
/

SELECT * FROM TEST;

-- 3) WHILE LOOP문
/* 
    [표현식]
    WHILE 반복문이 수행될 조건
    LOOP
        반복적으로 실행시킬 구문
    END LOOP;    
*/
DECLARE 
    I NUMBER := 1;
BEGIN
    WHILE I<6
    LOOP
        DBMS_OUTPUT.PUT_LINE(I);
        I := I + 1;
    END LOOP;    
END;
/
--- 실습문제 -----
-- LOOP문을 활용하여 구구단 짝수단 출력
-- 1-1) FOR LOOP문 활용
DECLARE
    RESULT NUMBER;
BEGIN    
    FOR DAN IN 2..9
    LOOP
        IF MOD(DAN ,2) = 0 -- 2로나누었을때 0이라면 == 짝수 dan%2 == 0
            THEN
                FOR SU IN 1..9
                LOOP
                    RESULT := DAN * SU;
                    DBMS_OUTPUT.PUT_LINE(DAN || ' * ' || SU || ' = ' || RESULT);
                END LOOP;
        END IF;        
    END LOOP;    
END;
/
-- 1-2) WHILE LOOP문 활용
DECLARE
    RESULT NUMBER;
    DAN NUMBER := 2;
    SU NUMBER := 1;
BEGIN
    WHILE DAN <= 9
    LOOP  
        SU := 1;
        WHILE SU <= 9
        LOOP 
            RESULT := SU*DAN;
            DBMS_OUTPUT.PUT_LINE(DAN || ' * ' || SU || ' = ' || RESULT);
            SU := SU+1;
        END LOOP;
        DAN := DAN+2;
    END LOOP;
END;
/

-- 4) 예외처리부
/* 
    예외(EXCEPTION) : 실행중 발생하는 오류
    
    [표현식]
    EXCEPTION 
        WHEN 예외명1 THEN 예외처리구문;
        WHEN 예외명2 THEN 예외처리구문;
        ...
        WHEN OTHERS THEN 예외처리구무;
        
        * 시스템예외(오라클에서 미리 정의해둔 예외)
        - NO_DATA_FOUND : SELECT 한 결과가 한 행도 없는 경우
        - TOO_MANY_ROWS : SELECT 한 결과가 여러 행인 경우
        - ZERO_DIVIDE   : 0으로 나눌때 발생하는 에러
        - DUP_VAL_ON_INDEX : UNIQUE 제약조건에 위배되었을때
        ...
*/
-- 사용자가 입력한 수로 나눗셈 연산한 결과 출력
DECLARE
    RESULT NUMBER;
BEGIN
    RESULT := 10 / &숫자;
    DBMS_OUTPUT.PUT_LINE('결과 : ' || RESULT);
EXCEPTION    
    -- WHEN ZERO_DIVIDE THEN DBMS_OUTPUT.PUT_LINE('나누기 연산시 0으로 나눌수 없습니다.');
    WHEN OTHERS THEN DBMS_OUTPUT.PUT_LINE('나누기 연산시 0으로 나눌수 없습니다.');
END;
/
-- UNIQUEW 제약조건 위배
BEGIN
    UPDATE EMPLOYEE
    SET EMP_ID = &사번
    WHERE EMP_NAME = '노옹철';
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN DBMS_OUTPUT.PUT_LINE('이미존재하는 사번입니다..');
END;
/
-- 데이터가 없거나, 너무많은 케이스
DECLARE
    EID EMPLOYEE.EMP_ID%TYPE;
    ENAME EMPLOYEE.EMP_NAME%TYPE;
BEGIN
    SELECT EMP_ID, EMP_NAME
      INTO EID, ENAME
    FROM EMPLOYEE
    WHERE MANAGER_ID = &사수사번;
    
    DBMS_OUTPUT.PUT_LINE('사번 : ' || EID || '이름 : ' || ENAME);
EXCEPTION
    WHEN TOO_MANY_ROWS THEN DBMS_OUTPUT.PUT_LINE('너무많은 행이 조회되었습니다');
    WHEN NO_DATA_FOUND THEN DBMS_OUTPUT.PUT_LINE('조회된 데이터가 없습니다');
END;
/

DECLARE
    DUP_EMPNO EXCEPTION;
    PRAGMA EXCEPTION_INIT(DUP_EMPNO, -00001);
    -- 유니크제약조건에 위배된경우 ORA-00001에러가 발생한다.
    -- ORA-00001에러를 저장하기위해서 위쪽에  -00001을 써줫는데 ORA는 자동으로 인식하기때문에 생략되었다.
BEGIN
    UPDATE EMPLOYEE
    SET EMP_ID = &사번
    WHERE EMP_ID = 200;
EXCEPTION
    WHEN DUP_EMPNO
    THEN DBMS_OUTPUT.PUT_LINE('이미존재하는 사번입니다.');
END;
/








