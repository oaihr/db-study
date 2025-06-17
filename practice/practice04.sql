--1.
--Student 테이블에서 모든 학생들의 이름과 태어난 생일 년도, 생일 월, 생일 일 을 구분해서 출력하세요.
 select
    NAME AS "이름",
    SUBSTR(JUMIN, 1, 2) AS "년도",
    SUBSTR(JUMIN, 3, 2) AS "월",
    SUBSTR(JUMIN, 5, 2) AS "일"
 from student;

--2.
--Student 테이블의 tel 컬럼을 사용하여 1 전공번호(deptno1)가 201번인
--학생의 이름과 전화번호, ‘)‘ 가 나오는 위치를 출력하세요.
 select 
    NAME,
    TEL,
    INSTR(TEL, ')') 괄호위치
 from student
 where DEPTNO1 = 201
 ;


--3.
--Student 테이블에서 1 전공이 101번인 학생들의 tel 컬럼을 조회하여
-- 3 이 첫 번째로 나오는 위치를 이름과 전화번호와 함께 출력하세요.
 select 
    NAME,
    TEL,
    INSTR(TEL, 3)
 from student
 where DEPTNO1 = 101
 ;


--4.
--Student 테이블을 참조해서 아래 화면과 같이 1 전공이(deptno1 컬럼) 201번인 학생의 이름과 전화번호와 지역번호를 출력하세요.
--단 지역번호는 숫자만 나와야 합니다.
 select 
    NAME,
    TEL,
    SUBSTR ( TEL, 1, INSTR( TEL, ')')-1 ) 지역번호
 from student
 where DEPTNO1 = 201
 ;
