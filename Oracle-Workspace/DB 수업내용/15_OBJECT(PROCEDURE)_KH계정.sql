/* 
    <PROCEDURE>
    PL/SQL구문을 "저장"해서 이용하게 하는 객체
    필요할떄마다 내가 작성한 PL/SQL문을 편하게 호출 가능하다.
    [표현식]
    CREATE [OR REPLACE] PROCEDURE 프로시저명[(매개변수)]
    IS
    BEGIN
        실행부분
    END;
    
    *프로시져 실행방법*
    EXEC 프로시저명;
*/
-- EMPLOYEE테이블을 복사한 COPY테이블 생성
CREATE TABLE PRO_TEST
AS SELECT * FROM EMPLOYEE;

SELECT * FROM PRO_TEST;

-- 프로시저 생성하기
CREATE PROCEDURE DEL_DATA
IS
BEGIN
    DELETE FROM PRO_TEST;
    COMMIT;
END;
/

-- 생성된 프로시져 조회
SELECT * FROM USER_PROCEDURES;

-- 프로시져 실행
EXEC DEL_DATA;

SELECT * FROM PRO_TEST;

-- 매개변수 있는 프로시져 만들기
-- IN  : 프로시져 실행시 필요한 값을 받는 변수(일반적인 매개변수와 동일한 개념)
-- OUT : 호출한곳으로 되돌려주는 변수(결과값)
CREATE OR REPLACE PROCEDURE PRO_SELECT_EMP(
                                            V_EMP_ID IN EMPLOYEE.EMP_ID%TYPE,
                                            V_EMP_NAME OUT EMPLOYEE.EMP_NAME%TYPE,
                                            V_SALARY OUT EMPLOYEE.SALARY%TYPE,
                                            V_BONUS OUT EMPLOYEE.BONUS%TYPE)
IS
BEGIN
    SELECT EMP_NAME, SALARY , BONUS
      INTO V_EMP_NAME, V_SALARY, V_BONUS
      FROM EMPLOYEE
    WHERE EMP_ID = V_EMP_ID;    
END;
/

--매개변수가 있는 프로시져 실행하기
VAR EMP_NAME VARCHAR2(20);
VAR SALARY NUMBER;
VAR BONUS NUMBER;

EXEC PRO_SELECT_EMP(201, :EMP_NAME , :SALARY , :BONUS);

PRINT EMP_NAME;
PRINT SALARY;
PRINT BONUS;

/* 
    프로시저의 장점
    1. 처리속도가 빠름
    2. 대용량 자료처리시 유리함.
    EX) DB에서 대용량의 데이터를 SELECT문으로 받아와서 자바에서 처리하는 CASE 
                                  VS 
        DB에서 대용량의 데이터를 SELECT한 후 자바로 넘기지 않고 직접처리하는 CASE
        
        DB에서 처리하는게 성능이 좋다(데이터를 넘길때마다 자원이 소비됨)
    
    프로시져 단점
    1. DB자원을 직접 사용하기때문에 DB에 부하를 주게됨
    2. 관리적 측면에서 자바소스코드, 오라클 소스코드 두개를 동시에 관리하기 어렵다.
    
    정리)
    한번에 처리되는 데이터량이 많고, 성능을 요구하는 처리는 대체로 자바보다 DB상에서 처리하는것이 성능측면에서 나을것이고    
    소스관리(유지보수)측면에서는 자바에서 작업하는게 더 좋다.    
*/
--------------------------------------------------------------------------------------------
/*
    <FUNCTION>
    프로시져와 거의 유사하지만 실행 결과를 반환받을수 있음.
    
    FUNCTION 생성방법
    [표현식]
    CREATE [OR REPLACE] FUNCTION 펑션명[(매개변수)]
    RETURN 자료형
    IS
    BEGIN
        실행부분
    END;
    
    펑션이름(인수)    
*/
CREATE OR REPLACE FUNCTION MYFUNC(V_STR VARCHAR2)
RETURN VARCHAR2
IS
    RESULT VARCHAR2(1000);
BEGIN
    DBMS_OUTPUT.PUT_LINE(V_STR);
    RESULT := '*'|| V_STR || '*';    
    RETURN RESULT;
END;
/

SELECT MYFUNC('민경민') FROM DUAL;

-- EMP_ID를 전달받아서 연봉(보너스 포함연봉)을 계산해서 출력해주는 함수 만들기.
-- CALC_SALARY
CREATE OR REPLACE FUNCTION CALC_SALARY(V_EMP_ID EMPLOYEE.EMP_ID%TYPE)
RETURN NUMBER
IS
    RESULT NUMBER;
    E EMPLOYEE%ROWTYPE;
BEGIN
    SELECT *
      INTO E
    FROM EMPLOYEE
    WHERE EMP_ID = V_EMP_ID;    
    RESULT := (E.SALARY + E.SALARY * NVL(E.BONUS,0)) * 12 ;    
    RETURN RESULT;
END;
/

SELECT EMP_ID , CALC_SALARY(EMP_ID)
FROM EMPLOYEE;












