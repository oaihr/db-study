--1.
--emp 테이블에서 20 번 부서에 소속된 직원들의 이름과 3-4 번째
--글자만 '-' 으로 변경해서 출력하세요 .
 
 select 
    ENAME,
    --SUBSTR(ENAME, 1, 2) || '--' || SUBSTR(ENAME, 5) REPLACE,
    REPLACE(ENAME, SUBSTR(ENAME, 3, 2), '--') REPLACE
 from emp
 where DEPTNO = 20;

--2.
--Student 테이블에서 1전공(deptno1)이 101 번인 학생들의 이름과
--주민등록번호를 출력하되 주민등록번호의 뒤 7자리는 ‘-’ 과 '/' 로 표시되게
--출력하세요.

 select 
    NAME,
    SUBSTR(JUMIN, 1, 6) || '-/-/-/-' 주민뒷자리숨김,
    REPLACE(jumin, SUBSTR(jumin, 7, 7), '-/-/-/-') 주민뒷자리숨김,
    CONCAT( SUBSTR(jumin, 1, 6), '-/-/-/-')
 from student
 where DEPTNO1 = 101
 ;
 
--3,
--Student 테이블에서 아래 그림과 같이 1 전공이 102 번인 학생들의 이름과 전화번호, 전화번호에서 국번 부분만 ‘*’ 처리하여 출력하세요.
---단 모든 국번은 3자리로 간주합니다.
 select 
    NAME,
    TEL,
    SUBSTR(TEL, 1, INSTR(TEL, ')') ) || '***' || SUBSTR(TEL, INSTR(TEL, '-'),5) REPLACE,
    REPLACE(TEL, SUBSTR(TEL, 5, 3), '***') REPLACE
 from student
 where DEPTNO1 = 102
 ;


--++Option
--응용) 가운데 자리 숫자의 자리수에 맞춰서 *로 바꾸기
      --3자리 -> ***      055)381-2158    055)***-2158
      --4자리 -> ****     02)6255-9875    02)****-9875

select 
    NAME,
    TEL,
    RPAD(SUBSTR(TEL, 1, INSTR(TEL, ')') ), INSTR(TEL, '-')-1,'*') || SUBSTR(TEL, INSTR(TEL, '-'),5) REPLACE
 from student
 where DEPTNO1 = 102
 ;



--4.
--Student 테이블에서 아래와 같이 deptno1 이
--101 번인 학과 학생들의 이름과 전화번호와 전화번호에서
--지역번호와 국번을 제외한 나머지 번호(끝 4자리 번호)를 * 로 표시해서 출력하세요.

 select 
    NAME,
    TEL,
    SUBSTR(TEL, 1, INSTR(TEL, '-')) || '****' REPLACE
 from student
 where DEPTNO1 = 101
 ;



