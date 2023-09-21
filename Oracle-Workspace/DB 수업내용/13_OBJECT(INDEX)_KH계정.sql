/* 
    <INDEX>
    데이터를 빠르게 검색하기위한 구조 데이터의 정렬과 탐색같은 DBMS의 성능향상을 목적으로 사용한다.
    
    인덱스의 특징
    
    인덱스로 설정한 칼럼의 데이터들을 별도로 "오름차순으로 정렬"하여
    특정 메모리 공간에 물리적인주소(ROWID) 실제 칼럼의 값을 함께 저장시킴    
*/
-- 현재 계정에 생성된 인덱스들 확인
SELECT * FROM USER_INDEXES; -- PK설정시 자동으로 인덱스 생성됨.
-- 현재 계정에 생성된 인덱스와 + 인덱스가 적용된 칼럼을 확인
SELECT * FROM USER_IND_COLUMNS;

-- 실행계획 확인.
SELECT * 
FROM EMPLOYEE 
JOIN DEPARTMENT ON DEPT_CODE= DEPT_ID
WHERE EMP_NAME = '송종기';
-- 일반칼럼인덱스
CREATE INDEX IND_EMPLOYEE_EMP_NAME ON EMPLOYEE(EMP_NAME);

-- 실행계획 확인
-- 우리가 인덱스를 만들었다고 해서 조건절에 인덱스를 활용한 칼럼을 제시했을때 바로사용하지는 않는다.
-- 인덱스를 활용하여 조회 할지 안할지 옵티마이저가 판단하다.
SELECT * 
FROM EMPLOYEE 
JOIN DEPARTMENT ON DEPT_CODE= DEPT_ID
WHERE EMP_NAME = '송종기';

SELECT EMP_ID
FROM EMPLOYEE
WHERE DEPT_CODE = 'D5';

CREATE INDEX IND_EMPLOYEE_DEPT_CODE ON EMPLOYEE(DEPT_CODE);

DROP INDEX IND_EMPLOYEE_EMP_NAME;

/* 
    인덱스의 장점
    1) WHERE절에 인덱스 칼럼을 사용시 훨씬 빠르게 연산이 가능하다.
    2) ORDER BY 연산을 사용할 필요가 없다.(이미 정렬되어있다.)
       ORDER BY절은 메모리를 많이 잡아먹는 작업임
    3) MIN , MAX값을 찾을대 연산속도가 매우빠름(정렬되어있으니까)
    
    인덱스의 단점
    1) DML에 취약함
    INSERT, UPDATE, DELETE등 데이터가 새롭게 추가 삭제되면 인덱스테이블안에있는 값들을 다시 정렬하고, 물리적 주소를
    수정해줘야함.
    2) INDEX를 이용한 INDEX-SCAN보다 단순한 FULL-SCAN이 더 효율적일때가 있음
       일반적으로 테이블의 전체데이터중 10~15%정도의 데이터를 처리하는 경우에만 인덱스가 효율적이다.
    3) 인덱스가 많을수록 저장공간 잡아먹음, 인덱스가 많으면 많을수록 저장공간이 부족해지게 되므로, 적절한 수준을
    유지해줘야한다.
    

*/







