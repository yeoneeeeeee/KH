/* 
    *DDL(DATA DEFINITION LANGUAGE) : 데이터 정의 언어
    
    오라클에서 제공하는 객체(OBJECT)를
    새로이 만들고(CREATE) 구조를 변경하고(ALTER) 구조를 삭제(DROP)하는 명령문
    즉, 구조자체를 정의하는 언어로 DB관리자, 설계자가 사용함.
    
    오라클에서의 객체(DB를 이루는 구조물들)
    테이블(TABLE), 사용자(USER), 함수(FUNCTION) , 뷰(VIEW), 시퀀스(SEQUENCE), 인덱스 등등...        
*/
/*
    <CREATE TABLE>
    
    테이블 : 행(ROW) , 열(COLUMN)로 구성되는 가장 기본적인 데이터베이스 객체 종류중 하나
            모든 데이터는 테이블을 통해서 저장됨(데이터를 조작하고자하려면 무조건 테이블을 만들어야한다)
            
    [표현법]
    CREATE TABLE 테이블명 (
    컬럼명 자료형,
    컬럼명 자료형,
    컬럼명 자료형,
    ...
    )
    
    <자료형>
    - 문자 (CHAR(크기)/VARCHAR2(크기)) : 크기는 BYTE수
                                    (숫자, 영문자 ,특수문자 => 1글자당 1BYTE)
                                    (한글 => 1글자당 2/3BYTE)
           CHAR(바이트수) : 최대 2000BYTE까지 지정가능
                           고정길이(아무리 적은값이 들어와도 공백으로 채워서 처음 할당한 크기를 유지하겠다.)
                           주로 들어올 값의 글자수가 정해져 있을경우 사용
                           EX) 성별 : 남/여 , M/F
                            주민번호 : 6-7 => 14글자 => 14BYTE
          VARCHAR2(바이트수) : 최대 4000BYTE까지 지정가능
                              가변길이(적은 값이 들어올 경우 그 담긴 값에 ㅁ자춰서 크기가 줄어든다.)
                              주로 들어올 값의 글자수가 정해져있은 않은경우 사용
                              예) 이름, 아이디, 비밀번호, 이메일..
          숫자 (NUMBER) : 정수/실수 상관없이 NUMBER
          날짜 (DATE)   : 년/월/일/시/분/초 형식으로 시간을 지정
*/
-->> 회원들의 데이터를 담기위한 테이블 생성 
CREATE TABLE MEMBER(
    MEMBER_ID VARCHAR2(20), -- 대소문자 구분X , 낙타등표기법을 쓸수없음 -> 언더바로 구분함.
    MEMBER_PWD VARCHAR2(20),
    MEMBER_NAME VARCHAR2(20),
    MEMBER_BDATE DATE
);
-- 테이블 확인방법1
SELECT * FROM MEMBER;

-- 테이블 확인방법2 : 데이터 딕셔너리 이용
-- 데이터 딕셔너리  : 다양한 객체들의 정보를 저장하고있는 시스템 테이블
SELECT *
FROM USER_TABLES;
-- USER_TABLES: 현재 이 사용자 계정이 가지고 있는 테이블들의 전반적인 구조를 확인할수있는 데이터 딕셔너리.

SELECT *
FROM USER_TAB_COLUMNS; -- 컬럼들 확인하는 방법

/*
    칼럼에 코멘트 달기(칼럼에 대한 설명)
    [표현법]
    COMMENT ON COLUMN 테이블명.컬럼명 IS '주석내용';
*/
COMMENT ON COLUMN MEMBER.MEMBER_ID IS '회원아이디';
-- MEMBER_PWD : 회원비밀번호
COMMENT ON COLUMN MEMBER.MEMBER_PWD IS '회원비밀번호';
-- MEMBEr_NAME : 회원이름
COMMENT ON COLUMN MEMBER.MEMBER_NAME IS '회원이름';
-- MEMBER_BDATE : 생년월일
COMMENT ON COLUMN MEMBER.MEMBER_BDATE IS '생년월일';

-- INSERT(데이터를 추가할 수있는 구문) => DML문
-- 한 행으로 추가(행을 기준으로 추가), 추가할 값을 기술(값의 순서 중요!)
-- INSERT INTO 테이블명 VALUES(첫번째 칼럼의 값, 두번째 칼럼의 값, ... )

INSERT INTO MEMBER VALUES('user01','pass01','홍길동','99/05/10');

INSERT INTO MEMBER VALUES('user02','pass02','김갑생','1980-10-06');

INSERT INTO MEMBER VALUES('user03','pass03','박말똥',SYSDATE);

INSERT INTO MEMBER VALUES(NULL,NULL,NULL,SYSDATE); -- 아이디, 비밀버노,이름에 NULL값이 존재해도 되나?
INSERT INTO MEMBER VALUES('user03','pass03','박말똥',SYSDATE); -- 중복된 아이디가 존재해도 되나? 

-- 위의 NULL값이나 중복된 아이디값은 유효하지 않은 값들이다
-- 유효한 데이터값을 유지하기 위해서 제약조건을 걸어줘야한다.
/*
    <제약조건 CONSTRAINTS>
    
    - 원하는 데이터값만 유지하기 위해서 (보관하기 위해서) 특정 컬럼마다 설정하는 제약
      (데이터 무결설 보장을 목적으로)
    - 제약조건이 부여된 컬럼에 들어올 데이터에 문제가 있는지 없는지 자동으로 검사할 목적
    
    - 종류 : NOT NULL, UNIQUE, CHECK, PRIMARY KEY , FOREIGN KEY
    
    - 컬럼에 제약조건을 부여하는 방식 : 컬럼레벨방식 / 테이블레벨방식
*/

/*
    1. NOT NULL 제약조건
       해당 컬럼에 반드시 값이 존재해야만 할 경우 사용
       => 즉 NULL값이 절대 들어와서는 안되는 컬럼에 부여하는 제약조건
         삽입/수정시 NULL값을 허용하지 않도록 제한하는 제약조건
         
         컬럼레벨 방식으로만 등록 가능.
*/

-- NOT NULL 제약조건을 설정한 테이블 만들기
-- 컬럼레벨방식 : 컬럼명 자료형 제약조건 => 제약조건을 부여하고자하는 컬럼 뒤에 곧바로 기술하는 방법.
CREATE TABLE MEM_NOTNULL(
    MEM_NO NUMBER NOT NULL,
    MEM_ID VARCHAR2(20) NOT NULL,
    MEM_PWD VARCHAR2(20) NOT NULL,
    MEM_NAME VARCHAR2(20) NOT NULL,
    GENDER CHAR(3),
    PHONE VARCHAR2(15),
    EMAIL VARCHAR2(30) 
);

INSERT INTO MEM_NOTNULL 
VALUES (1, 'user01', 'pass01' ,'경민','남','010-1111-1111','aksrydaks@naver.com');

SELECT * FROM MEM_NOTNULL;

INSERT INTO MEM_NOTNULL 
VALUES (2, 'user01', 'pass01' ,NULL,'남','010-1111-1111','aksrydaks@naver.com');
-- DDL 계정에 MEM_NOTNULL테이블에 NOTNULL제약조건이 부여된 칼럼들에 NULL값이 들어갈수없어서
-- 오류가 발생함.
INSERT INTO MEM_NOTNULL 
VALUES (1, 'user01', 'pass01' ,'경민',NULL,NULL,NULL);

/* 
    2. UNIQUE 제약조건
       칼럼에 중복값을 제한하는 제약조건
       삽입/ 수정 시 기존에 해당 컬럼값 중에 중복값이 있을경우
       추가 , 수정이 되지않게 제약
       
       칼럼/테이블레벨방식 둘 다 가능    
*/

CREATE TABLE MEM_UNIQUE(
    MEM_NO NUMBER NOT NULL,
    MEM_ID VARCHAR2(20) NOT NULL UNIQUE, -- 컬럼레벨방식
    MEM_PWD VARCHAR2(20) NOT NULL,
    MEM_NAME VARCHAR2(20) NOT NULL,
    GENDER CHAR(3),
    PHONE VARCHAR2(15),
    EMAIL VARCHAR2(30) 
);

DROP TABLE MEM_UNIQUE;

-- 테이블 레벨방식 : 모든 칼럼을 다 기술하고, 그 이후에 제약조건을 나열
CREATE TABLE MEM_UNIQUE(
    MEM_NO NUMBER NOT NULL,
    MEM_ID VARCHAR2(20) NOT NULL, 
    MEM_PWD VARCHAR2(20) NOT NULL,
    MEM_NAME VARCHAR2(20) NOT NULL,
    GENDER CHAR(3),
    PHONE VARCHAR2(15),
    EMAIL VARCHAR2(30) ,
    UNIQUE(MEM_ID) -- 테이블 레벨 방식
);

INSERT INTO MEM_UNIQUE
VALUES(1,'user02','pass01','rudals','ska','010-1111-2222','abc@naver.com');

/* 
    UNIQUE 제약조건에 위배되었으므로 INSERT 실패
    어느컬럼에 어느 문제가있는지 구체적으로 알려주지 않음
    DDL.SYS_C007062 : 제약조전의 이름으로만 제약조건위배를 알려준다.
    제약조건시 부여시 직접 제약조건명을 지정해주지않으면 시스템에서 임의의 제약조건명을 부여해줌.
*/
COMMIT;
/* 
    * 제약조건 부여시 제약조건명도 지정하는 표기법
    
    > 컬럼레벨방식
    CREATE TABLE 테이블명(
        컬럼명 자료형 제약조건1 제약조건2,
        컬럼명 자료형 [CONSTRAINT 제약조건명] 제약조건,
        ...
    );
    
    > 테이블레벨방식
    CREATE TABLE 테이블명(
        컬럼명 자료형 ,
        ...
        
        [CONSTRAINT 제약조건이름] 제약조건(칼럼명)
    );
    => 두방식 모두 CONSTRAINT 제약조건이름은 생략가능햇었음(시스템이 랜덤한 이름을 부여해줌)
*/

CREATE TABLE MEM_CON_NM(
    MEM_NO NUMBER NOT NULL,
    MEM_ID VARCHAR2(20) NOT NULL, 
    MEM_PWD VARCHAR2(20) NOT NULL,
    MEM_NAME VARCHAR2(20) CONSTRAINT MEM_NAME_NN NOT NULL, -- 컬럼레벨방식 제약조건명 부여
    GENDER CHAR(3),
    PHONE VARCHAR2(15),
    EMAIL VARCHAR2(30) ,
    CONSTRAINT MEM_ID_UQ UNIQUE(MEM_ID) -- 테이블 레벨 방식
);

INSERT INTO MEM_CON_NM
VALUES(1,'user01','pass01','민경민',NULL,NULL,NULL);

INSERT INTO MEM_CON_NM
VALUES(2,'user03','pass02','민경민2','D',NULL,NULL);
-- 어떤 컬럼에 어떤종류의 제약조건인지 한번에 확인가능

INSERT INTO MEM_CON_NM
VALUES(1,'user02','pass02',NULL,NULL,NULL,NULL);

-- GENDER칼럼에 '남', '여'라는 값만 들어가게 하고 싶음

/* 
    3. CHECK 제약조건
       컬럼에 기록될 수 있는 값에 대한 조건을 설정할 수 있다.
       예) 성별 '남' 혹은 '여'만 들어오게끔 하고 싶다.
       
       [표현법]
       CHECK (조건식)
*/

CREATE TABLE MEM_CHECK(
    MEM_NO NUMBER NOT NULL,
    MEM_ID VARCHAR2(20) NOT NULL, 
    MEM_PWD VARCHAR2(20) NOT NULL,
    MEM_NAME VARCHAR2(20) NOT NULL, -- 컬럼레벨방식 제약조건명 부여
    GENDER CHAR(3) CHECK( GENDER IN ('남','여')),
    PHONE VARCHAR2(15),
    EMAIL VARCHAR2(30),
    MEM_DATE DATE NOT NULL,
    UNIQUE(MEM_ID) -- 테이블 레벨 방식
);
INSERT INTO MEM_CHECK
VALUES(1,'user01','pass01','민경민','남',null,null,SYSDATE);

INSERT INTO MEM_CHECK
VALUES(1,'user02','pass01','민경민',NULL,null,null,SYSDATE);
-- 추가적으로 NULL값을 못 들어오게 하고싶다면 NOT NULL 제약조건도 같이 걸어주면 됨

/* 
    * DEFAULT 설정
      특정 칼럼에 들어올 값에 대한 기본값 설정 가능(제약조건은 아님)
      
      EX) 회원가입일 컬럼에 회원정보가 삽입된 순가의 시간을 기록하고싶다
        => DEFAULT 설정으로 SYSDATE를 넣어주면됨
*/

-- 회원가입일을 항상 SYSDATE로 받고 싶은경우

DROP TABLE MEM_CHECK;

CREATE TABLE MEM_CHECK(
    MEM_NO NUMBER NOT NULL,
    MEM_ID VARCHAR2(20) NOT NULL, 
    MEM_PWD VARCHAR2(20) NOT NULL,
    MEM_NAME VARCHAR2(20) NOT NULL, -- 컬럼레벨방식 제약조건명 부여
    GENDER CHAR(3) CHECK( GENDER IN ('남','여')),
    PHONE VARCHAR2(15),
    EMAIL VARCHAR2(30),
    MEM_DATE DATE DEFAULT SYSDATE NOT NULL, -- DEFAULT가 먼저 와야함
    UNIQUE(MEM_ID) -- 테이블 레벨 방식
);

INSERT INTO MEM_CHECK
VALUES(1,'user01','pass01','민경민','남',null,null,NULL);

INSERT INTO MEM_CHECK(MEM_NO, MEM_ID, MEM_PWD,MEM_NAME)
VALUES(1,'user01','passo1','민경민');
-- 지정이 안된 칼럼에는 기본적으로 NULL값이 들어간다
-- 만약 DEFAULT값이 부여되어있다면 NULL값이 아닌 DEFAULT값으로 들어가게된다.

SELECT * FROM MEM_CHECK;
/* 
    4. PRIMARY KEY(기본키) 제약조건
       테이블에서 각 행들의 정보를 유일하게 식별할 수 있는 칼럼에 부여하는 제약조건
       -> 각 행들을 구분할 수 있는 식별자의 역할
       예) 사번, 부서아이디, 직급코드, 학생번호, 클래스번호...
       => 식별자의 조건 : 중복X , 값이 없어도 안됨(NOT NULL + UNIQUE)
       
       주의사항 : 한 테이블당 한개의 칼럼만 지정가능
*/

CREATE TABLE MEM_PRIMARYKEY1(
    MEM_NO NUMBER CONSTRAINT MEM_PK PRIMARY KEY,
    MEM_ID VARCHAR2(20) NOT NULL, 
    MEM_PWD VARCHAR2(20) NOT NULL,
    MEM_NAME VARCHAR2(20) NOT NULL, -- 컬럼레벨방식 제약조건명 부여
    GENDER CHAR(3) CHECK( GENDER IN ('남','여')),
    PHONE VARCHAR2(15),
    EMAIL VARCHAR2(30),
    MEM_DATE DATE DEFAULT SYSDATE NOT NULL, -- DEFAULT가 먼저 와야함
    UNIQUE(MEM_ID) -- 테이블 레벨 방식
);

INSERT INTO MEM_PRIMARYKEY1
VALUES(NULL,'user21', 'pass01','민경민',null,null,null,DEFAULT);

CREATE TABLE MEM_PRIMARYKEY2(
    MEM_NO NUMBER ,
    MEM_ID VARCHAR2(20) NOT NULL PRIMARY KEY, 
    MEM_PWD VARCHAR2(20) NOT NULL,
    MEM_NAME VARCHAR2(20) NOT NULL, -- 컬럼레벨방식 제약조건명 부여
    GENDER CHAR(3) CHECK( GENDER IN ('남','여')),
    PHONE VARCHAR2(15),
    EMAIL VARCHAR2(30),
    MEM_DATE DATE DEFAULT SYSDATE NOT NULL, -- DEFAULT가 먼저 와야함
    UNIQUE(MEM_ID), -- 테이블 레벨 방식
    CONSTRAINT MEM_PK2 PRIMARY KEY(MEM_NO) -- 테이블레벨방식 
);

CREATE TABLE MEM_PRIMARYKEY2(
    MEM_NO NUMBER ,
    MEM_ID VARCHAR2(20) NOT NULL, 
    MEM_PWD VARCHAR2(20) NOT NULL,
    MEM_NAME VARCHAR2(20) NOT NULL, -- 컬럼레벨방식 제약조건명 부여
    GENDER CHAR(3) CHECK( GENDER IN ('남','여')),
    PHONE VARCHAR2(15),
    EMAIL VARCHAR2(30),
    MEM_DATE DATE DEFAULT SYSDATE NOT NULL, -- DEFAULT가 먼저 와야함    
    CONSTRAINT MEM_PK2 PRIMARY KEY(MEM_NO,MEM_ID) -- 테이블레벨방식 
);
-- PRIMARY KEY가 한테이블에 2개이상 사용될수 없다. 단, 두 컬럼을 하나로묶어서 하나의 PRIMARY KEY로는 설정 가능.
-- 두가지 컬럼을 묶어서 PRIMARY KEY로 설정했을경우 => 복합키

DROP TABLE MEM_PRIMARYKEY2;

INSERT INTO MEM_PRIMARYKEY2
VALUES(1,'user01', 'pass01','민경민',null,null,null,DEFAULT);

INSERT INTO MEM_PRIMARYKEY2
VALUES(1,'user02', 'pass01','민경민',null,null,null,DEFAULT);

INSERT INTO MEM_PRIMARYKEY2
VALUES(2,'user02', 'pass01','민경민',null,null,null,DEFAULT);

INSERT INTO MEM_PRIMARYKEY2
VALUES(2,'user02', 'pass01','민경민',null,null,null,DEFAULT);
-- 복합키의 경우 두 컬럼의 값이 완전히 중복되어야지만 제약조건에 위배된다.

INSERT INTO MEM_PRIMARYKEY2
VALUES(NULL,'user02', 'pass01','민경민',null,null,null,DEFAULT);
-- 복합키일경우 한컬럼에 값이 NULL이면 제약조건에 위배된다.

/* 
    5. FOREIGN KEY(외래키)
       해당 컬럼에 다른 테이블에 존재하는 값만 들어와야하는 칼럼에 부여하는 제약조건
       => "다른테이블(==부모테이블)을 참조한다" 라고 표현
          즉, 참조된 다른 테이블(==부모테이블)이 제공하고 있는 값만 들어올 수 있다.
          예) KH계정에서
          EMPLOYEE테이블(자식테이블) <------ DEPARTMENT테이블(부모테이블)
             DEPT_CODE              ---- DEPT_ID
          => DEPT_CODE에는 DEPT_ID에 존재하는 값들만 들어올수 있다.
          
       => FOREIGN KEY 제약조건으로 다른테이블과 관계를 형성할 수 있다.(JOIN)
       
       [표현법]
       > 컬럼레벨 방식
       컬럼명 자료형 CONSTRAINT 제약조건명 REFERENCES 참조할테이블명(참조할칼럼명)
       
       > 테이블레벨방식
       CONSTRAINT 제약조건명 FOREIGN KEY(컬럼명) REFERENCES 참조할테이블명(참조할칼럼명)
       
       참조할테이블 == 부모테이블
       생략가능한부분 : CONSTRAINT 제약조건명, 참조할 칼럼명(테이블,칼럼레벨 모두 생략가능)
       => 참조할 칼럼명이 생략되는경우 자동적으로 참조할 테이블의 PRIMARY KEY에 해당하는 컬럼이 참조컬럼으로 지정됨
       
       주의사항 : 참조할 칼럼의 타입(부모테이블칼럼) , 외래키로 지정할 칼럼타입(자식테이블칼럼)이 같아야한다.
*/
-- 부모테이블 만들기
-- 회원 등급에 대한 데이터를 보관하는 테이블
CREATE TABLE MEM_GRADE(
    GRADE_CODE CHAR(2) PRIMARY KEY, -- 등급코드 / 문자열 'G1', 'G2' ,...
    GRADE_NAME VARCHAR2(20) NOT NULL -- 등급명 / 문자열 (일반회원,우수회원,VIP회원)
);

INSERT INTO MEM_GRADE
VALUES('G1','일반회원');

INSERT INTO MEM_GRADE
VALUES('G2','우수회원');

INSERT INTO MEM_GRADE
VALUES('G3','특별회원');

INSERT INTO MEM_GRADE
VALUES('G4','222특별회원');
--자식테이블
--회원정보를 담는 테이블
CREATE TABLE MEM(
    MEM_NO NUMBER PRIMARY KEY,
    MEM_ID VARCHAR2(20) NOT NULL, 
    MEM_PWD VARCHAR2(20) NOT NULL,
    MEM_NAME VARCHAR2(20) NOT NULL, -- 컬럼레벨방식 제약조건명 부여
    GRADE_ID CHAR(2),
    -- GRADE_ID CHAR(2) REFERENCES MEM_GRADE, 
    GENDER CHAR(3) CHECK( GENDER IN ('남','여')),
    PHONE VARCHAR2(15),
    EMAIL VARCHAR2(30),
    MEM_DATE DATE DEFAULT SYSDATE NOT NULL, -- DEFAULT가 먼저 와야함
    UNIQUE(MEM_ID), -- 테이블 레벨 방식
    FOREIGN KEY(GRADE_ID) REFERENCES MEM_GRADE(GRADE_CODE) -- 테이블레벨 방식
);

INSERT INTO MEM(MEM_NO, MEM_ID, MEM_PWD,MEM_NAME, GRADE_ID)
VALUES(1,'user01','pass01','mkm','G1');

INSERT INTO MEM(MEM_NO, MEM_ID, MEM_PWD,MEM_NAME, GRADE_ID)
VALUES(2,'user02','pass01','mkm','G2');

INSERT INTO MEM(MEM_NO, MEM_ID, MEM_PWD,MEM_NAME, GRADE_ID)
VALUES(3,'user03','pass01','mkm','G3');

INSERT INTO MEM(MEM_NO, MEM_ID, MEM_PWD,MEM_NAME, GRADE_ID)
VALUES(4,'user04','pass01','mkm',NULL);
-- NULLL값은 들어가도 된다. 단, 부모테이블에 존재하지 앟는 값이 들어가면 안된다.

SELECT MEM_ID , GRADE_NAME
FROM MEM
JOIN MEM_GRADE ON GRADE_ID = GRADE_CODE;

-- 문제) 부모테이블에서 데이터값이 삭제된다면?
-- MEM_GRADE테이블에서 GRADE_CODE가 G3인 데이터만 지워보기?
DELETE FROM MEM_GRADE
WHERE GRADE_CODE = 'G3';
-- 자식테이블에서 현재 G3값을 사용하고있기 때문에 삭제할수 없음.
-- 현재 외래키 제약조건 부여시 삭제에 대한 옵션을 별도로 부여하지 않은상태 
-- => 기본값으로 삭제 제한 옵션이 걸려있음

/*
    * 자식테이블 생성시 외래키 제약조건을 부여했을때
    부모테이블의 데이터가 삭제되었을 때 자식테이블에서는 어떻게 처리할지를 옵션으로 정해둘 수 있다.
    
    * FOREIGN KEY 삭제 옵션
    - ON DELETE SET NULL : 부모데이터를 삭제할 때 해당 데이터를 사용하는 자식데이터를 NULL로 바꾸겠다.
    - ON DELETE CASCADE  : 부모데이터를 삭제할 때 해당 데이터를 사용하는 자식데이터를 같이 삭제하겠다.
    - ON DELETE RESTRICTED : 삭제를 제한하겠다(기본옵션)
*/

DROP TABLE MEM;

CREATE TABLE MEM(
    MEM_NO NUMBER PRIMARY KEY,
    MEM_ID VARCHAR2(20) NOT NULL, 
    MEM_PWD VARCHAR2(20) NOT NULL,
    MEM_NAME VARCHAR2(20) NOT NULL, -- 컬럼레벨방식 제약조건명 부여
    GRADE_ID CHAR(2),
    -- GRADE_ID CHAR(2) REFERENCES MEM_GRADE, 
    GENDER CHAR(3) CHECK( GENDER IN ('남','여')),
    PHONE VARCHAR2(15),
    EMAIL VARCHAR2(30),
    MEM_DATE DATE DEFAULT SYSDATE NOT NULL, -- DEFAULT가 먼저 와야함
    UNIQUE(MEM_ID), -- 테이블 레벨 방식
    FOREIGN KEY(GRADE_ID) REFERENCES MEM_GRADE(GRADE_CODE) ON DELETE SET NULL -- 테이블레벨 방식
);


INSERT INTO MEM(MEM_NO, MEM_ID, MEM_PWD,MEM_NAME, GRADE_ID)
VALUES(1,'user01','pass01','mkm','G1');

INSERT INTO MEM(MEM_NO, MEM_ID, MEM_PWD,MEM_NAME, GRADE_ID)
VALUES(2,'user02','pass01','mkm','G2');

INSERT INTO MEM(MEM_NO, MEM_ID, MEM_PWD,MEM_NAME, GRADE_ID)
VALUES(3,'user03','pass01','mkm','G3');

SELECT * FROM MEM;

-- 부모테이블에서 GRADE_CODE가 G1인 데이터 삭제하기
DELETE FROM MEM_GRADE
WHERE GRADE_CODE = 'G1';

SELECT * FROM MEM_GRADE;
SELECT * FROM MEM;
-- 문제없이 삭제잘되고, G1을 참조하던 자식 테이블의 GRADE_ID값에 G1대신 NULL값이 들어갔다.
DROP TABLE MEM;

CREATE TABLE MEM(
    MEM_NO NUMBER PRIMARY KEY,
    MEM_ID VARCHAR2(20) NOT NULL, 
    MEM_PWD VARCHAR2(20) NOT NULL,
    MEM_NAME VARCHAR2(20) NOT NULL, -- 컬럼레벨방식 제약조건명 부여
    GRADE_ID CHAR(2),
    -- GRADE_ID CHAR(2) REFERENCES MEM_GRADE, 
    GENDER CHAR(3) CHECK( GENDER IN ('남','여')),
    PHONE VARCHAR2(15),
    EMAIL VARCHAR2(30),
    MEM_DATE DATE DEFAULT SYSDATE NOT NULL, -- DEFAULT가 먼저 와야함
    UNIQUE(MEM_ID), -- 테이블 레벨 방식
    FOREIGN KEY(GRADE_ID) REFERENCES MEM_GRADE(GRADE_CODE) ON DELETE CASCADE -- 테이블레벨 방식
);

INSERT INTO MEM(MEM_NO, MEM_ID, MEM_PWD,MEM_NAME, GRADE_ID)
VALUES(1,'user01','pass01','mkm','G2');

INSERT INTO MEM(MEM_NO, MEM_ID, MEM_PWD,MEM_NAME, GRADE_ID)
VALUES(2,'user02','pass01','mkm','G2');

INSERT INTO MEM(MEM_NO, MEM_ID, MEM_PWD,MEM_NAME, GRADE_ID)
VALUES(3,'user03','pass01','mkm','G3');


SELECT * FROM MEM;

DELETE FROM MEM_GRADE
WHERE GRADE_CODE ='G2';

SELECT * FROM MEM_GRADE;
SELECT * FROM MEM;
-- 문제없이 잘 삭제되었꼬, 자식테이블의 GRADE_ID가 G2인 행까지 함께 삭제되어버림.

-- 조인문제
-- 전체 회원의 회원번호 , 아이디, 비밀번호, 이름, 등급명을 || 오라클전용구문, ANSI구문으로 나눠서 작성
SELECT MEM_NO, MEM_ID, MEM_PWD, MEM_NAME, GRADE_NAME
FROM MEM
JOIN MEM_GRADE ON GRADE_ID = GRADE_CODE;

SELECT MEM_NO, MEM_ID, MEM_PWD, MEM_NAME, GRADE_NAME
FROM MEM , MEM_GRADE
WHERE GRADE_ID = GRADE_CODE;
/* 
    외래키 제약조건이 걸려있지 않더라도 JOIN은 가능함. 단, 두 컬럼의 동일한 의미의 데이터가
    담겨있어야 정상적으로 조회 가능함.
*/
---------------------------------------------------------------------------------
/*
    ------------------ 여기서 부터는 접속계정 KH !!!--------------------------------
    
    * SUBQUERY를 이용한 테이블 생성(테이블복사)
    
    서브쿼리 : 메인 SQL문을 보조하는 역할의 쿼리문
    
    [표현법]
    CREATE TABLE 테이블명
    AS 서브쿼리;
*/

SELECT * FROM EMPLOYEE;

-- EMPLOYEE테이블을 복제한 새로운 테이블 생성(EMPLOYEE_COPY)
CREATE TABLE EMPLOYEE_COPY
AS SELECT * FROM EMPLOYEE;

SELECT * FROM EMPLOYEE_COPY;
-- 컬럼들, 조회결과의 데이터들 제대로 복사됨
-- 단, 제약조건은 NOT NULL 제약조건만 복사됨
-- 서브쿼리를 통해 테이블을 생성할 경우 제약조건은 NOT NULL인 제약조건만 복사됨

SELECT *
FROM EMPLOYEE
WHERE EMP_ID=0;
-- 특정테이블의 컬럼의 구조만 필요하고, 데이터는 필요없는경우 조건식을통해 칼럼값만 얻어올수있따.
SELECT *
FROM EMPLOYEE
WHERE 1 = 0; -- 1 = 0 == FALSE

SELECT *
FROM EMPLOYEE
WHERE 1 = 1; -- 1 = 1 == TRUE

CREATE TABLE EMPLOYEE_COPY2
AS SELECT * FROM EMPLOYEE WHERE 1=0;

SELECT * FROM EMPLOYEE_COPY2;

-- 전체 사원들중 급여가 300만원이상인 사원들의 사번, 이름 ,부서코드 , 급여 칼럼과 데이터를 복제하시오
-- 테이블명 : EMPLOYEE_COPY3
CREATE TABLE EMPLOYEE_COPY3
AS SELECT EMP_ID , EMP_NAME, DEPT_CODE, SALARY
FROM EMPLOYEE
WHERE SALARY>= 3000000;

SELECT * FROM EMPLOYEE_COPY3;
-- 전체 사원의 사번, 급여, 연봉 조회한 결과를 복제한 테이블 생성(내용물같이)
-- 테이블명 : EMPLOYEE_COPY4
CREATE TABLE EMPLOYEE_COPY4
AS SELECT EMP_ID, EMP_NAME , SALARY * 12 AS SALARY
FROM EMPLOYEE;
-- 서브쿼리에 SELECT절에 산술연산 또는 함수식이 기술된경우 반드시 별칭을 부여해줘야한다..!

SELECT * FROM EMPLOYEE_COPY4;





