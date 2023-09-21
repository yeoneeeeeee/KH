/*
    * DDL(DATA DEFINISTION LANGUAGE)
    데이터 정의 언어
    
    객체들을 새롭게 생성(CREATE)하고, 수정(ALTER)하고, 삭제(DROP)하는 명령어
    
    1. ALTER
    객체 구조를 수정해주는 구문
    
    <테이블 수정>
    [표현법]
    ALTER 객체명(TABLE, INDEX, USER...) 테이블명 수정할내용;
    
    - 수정할 내용
    1) 칼럼 추가/ 수정 / 삭제
    2) 제약조건 추가 / 삭제 => 수정 XX
    (수정하고자 한다면 삭제후 새롭게 추가해야함)
    3) 테이블명/ 컬럼명 /제약조건명 수정가능.
*/

-- 1) 컬럼 추가/수정/삭제
-- 1_1) 칼럼 추가 (ADD) : ADD 추가할칼럼명 자료형 [DEFAULT 기본값] 
SELECT * FROM DEPT_COPY;

-- CNAME 칼럼 추가하기
ALTER TABLE DEPT_COPY ADD CNAME VARCHAR2(20);
-- 새로운 칼럼이 추가되고, NULL값으로 채워졌다

-- LNAME칼럼 추가 DEFAULT값으로 '한국' 이라고 지저하기.
ALTER TABLE DEPT_COPY ADD LNAME VARCHAR2(20) DEFAULT '한국';

-- 1_2) 칼럼 수정(MODIFY)
--      컬럼의 자료형 수정 : MODIFY 수정할 칼럼명 바꾸고자하는 자료형
--      DEFAULT값 수정시  : MODIFY 수정할 칼럼명 DEFAULT 바꾸고자하는 기본값

-- DEPT_COPY테이블의 DEPT_ID의 자료형을 CHAR(3)로 변경
ALTER TABLE DEPT_COPY MODIFY DEPT_ID CHAR(3);

-- 현재 변경하고자하는 칼럼에 이미 담겨있는 값과 완전히 다른 타입으로 변경해보기(불가능X)
-- "column to be modified must be empty to change datatype"
ALTER TABLE DEPT_COPY MODIFY DEPT_ID NUMBER;

-- 현재 변경하고자하는 칼럼에 이미 담겨있는 값보다 더 작은 크기로 변경해보기(불가능X)
-- cannot decrease column length because some value is too big 
ALTER TABLE DEPT_COPY MODIFY DEPT_ID CHAR(1);

--> 문자 -> 숫자(X) / 사이즈 축소(X) / 사이즈 확대 (0)

-- 한번에 여러개의 칼럼 변경 가능
-- DEPT_TITLE칼럼의 데이터 타입을 VARCHAR2(4)으로 , 
-- LOCATION_ID 컬럼의 데이터타입을 VARCHAR2(2)로
-- LNAME컬럼의 기본값을 '미국'으로
ALTER TABLE DEPT_COPY
MODIFY DEPT_TITLE VARCHAR2(40)
MODIFY LOCATION_ID VARCHAR2(2)
MODIFY LNAME DEFAULT '미국';

-- 1_3) 컬럼 삭제(DROP COLUMN) : DROP COLUMN 삭제하고자하는 칼럼명
CREATE TABLE DEPT_COPY2
AS SELECT * FROM DEPT_COPY; 

-- DEPT_COPY2테이블에 DEPT_ID칼럼 지우기.
ALTER TABLE DEPT_COPY2 DROP COLUMN DEPT_ID;

SELECT * FROM DEPT_COPY2;

-- ROLLBACK으로 복구가 안됨.(모든 DDL문 전체)
ROLLBACK;

-- 모든컬럼지워보기
ALTER TABLE DEPT_COPY2 DROP COLUMN DEPT_TITLE;
ALTER TABLE DEPT_COPY2 DROP COLUMN LOCATION_ID;
ALTER TABLE DEPT_COPY2 DROP COLUMN CNAME;

ALTER TABLE DEPT_COPY2 DROP COLUMN LNAME;
-- "cannot drop all columns in a table"
-- 마지막 칼럼은 삭제할수 없다.

SELECT * FROM DEPT_COPY2;

-- 2) 제약조건 추가 / 삭제
/* 
    2_2) 제약조건 추가
    
    - PRIMAKRY KEY : ADD PRIMARY KEY(컬럼명);
    - FOREIGN  KEY : ADD FOREIGN KEY(컬럼명) REFERENCES 참조할테이블명[(참조할칼럼명)]
    - UNIQUE       : ADD UNIQUE(칼럼명);
    - CHECK        : ADD CHECK(컬럼에 대한 조건);
    ==============================================
    - NOT NULL     : MODIFY 컬럼명 NOT NULL;
    
    나만의 제약조건명을 부여하고자 한다면, CONSTRAINT 제약조건명 앞에다가 붙이기    
*/

/*
    DEPT_COPY테이블로부터
    - DEPT_ID칼럼에 PRIMARY KEY 제약조건 추가
    - DEPT_TITLE칼럼에 UNIQUE 제약조건 추가
    - LNAME컬럼에 NOT NULL 제약조건 추가
*/
ALTER TABLE DEPT_COPY
ADD CONSTRAINT DCOPY_PK PRIMARY KEY(DEPT_ID)
ADD CONSTRAINT DCOPY_UQ UNIQUE(DEPT_TITLE)
MODIFY LNAME CONSTRAINT DCOPY_NN NOT NULL;

/*
    2_2) 제약조건 삭제
    PRIMARY KEY , FORIGEN KEY ,UNIQUE, CHECK : DROP CONSTRAINT 제약조건명
    NOT NULL : MODIFY 칼럼명 NULL;
*/

-- DEPT_COPY테이블로부터 DCOPY_PK 제약조건 지우기
ALTER TABLE DEPT_COPY DROP CONSTRAINT DCOPY_PK;

-- 나머지 제약조건 삭제
ALTER TABLE DEPT_COPY
DROP CONSTRAINT DCOPY_UQ
MODIFY LNAME NULL;

-- 3) 컬럼명 / 제약조건명/ 테이블명 변경(RENAME)
-- 3_1) 칼럼명 변경 : RENAME COLUMN 기존컬럼명 TO 바꿀컬럼명
-- DEPT_COPY 테이블에서 DEPT_TITLE을 DEPT_NAME으로 바꾸기
ALTER TABLE DEPT_COPY RENAME COLUMN DEPT_TITLE TO DEPT_NAME;

-- 3_2) 제약조건명 변경 : REANME CONSTRAINT 기존제약조건명 TO 바꿀제약조건명
-- DEPT_COPY테이블에서 SYS_C007149를 DCOPY_DID_NN로 바꾸기
ALTER TABLE DEPT_COPY RENAME CONSTRAINT SYS_C007149 TO DCOPY_DID_NN;

-- 3_3) 테이블명 변경 : RENAME [기존테이블명] TO 바꿀테이블명
-- DEPT_COPY테이블 이름을 DEPT_TEST로 변경
ALTER TABLE DEPT_COPY RENAME TO DEPT_TEST; -- 기존 테이블 이름이 이미 나왔으므로 생략 가능.

SELECT * FROM DEPT_TEST;
----------------------------------------------------------------------------------------
/*
    2. DROP
    객체를 삭제하는 구문
    
    [표현법]
    DROP TABLE 삭제하고자하는 테이블이름.
*/
--EMP_NEW 삭제
DROP TABLE EMP_NEW;

-- 부모테이블을 삭제할경우는? 테스트 환경 만들기
-- 1) DEPT_TEST테이블에 DEPT_ID컬럼을 먼저 PRIMARY KEY 제약조건 추가시키기
ALTER TABLE DEPT_TEST
ADD CONSTRAINT DCOPY_PK PRIMARY KEY(DEPT_ID);
-- EMPLOYEE_COPY3에 외래키(DEPT_CODE)를 추가(외래키 이름 : ECOPY_FK)
-- 2) 이때 부모테이블은 DEPT_TEST테일브의 DEPT_ID칼럼을 참조시킬것.
ALTER TABLE EMPLOYEE_COPY3
ADD CONSTRAINT ECOPY_FK FOREIGN KEY(DEPT_CODE) REFERENCES DEPT_TEST;

-- 부모테이블 삭제
DROP TABLE DEPT_TEST;
-- ORA-02449: unique/primary keys in table referenced by foreign keys

-- 단, 어디선가에 참조되고 있는 부모테이블들은 삭제되지 않는다.
-- 만약에 부모테이블을 삭제하고싶다면?
-- 방범1) 자식테이블을 먼저 삭제한후 부모테이블을 삭제한다면 OK
DROP TABLE 자식테이블;
DROP TABLE 부모테이블;

-- 방법2) 부모테이블만 삭제하되, 맞물려있는 외래키 제약조건도 함께 삭제하는 방법
-- DROP TABLE 부모테이블명 CASCADE CONSTRAINT;
DROP TABLE DEPT_TEST CASCADE CONSTRAINT;







