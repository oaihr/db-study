
 --1.
--Professor 테이블에서 201번 학과 교수들의 이름과 급여, bonus , 총 연봉을 아래와 같이 출력하세요. 
--단 총 연봉은 (pay*12+bonus) 로 계산하고 bonus 가 없는 교수는 0으로 계산하세요.

 select 
    PROFNO,
    NAME,
    PAY,
    NVL(BONUS, 0) BONUS,
    TO_CHAR( pay*12+NVL(BONUS, 0), '99,999') TOTAL
 from professor
 where DEPTNO = 201;

 select
    pay*12+NVL(BONUS, 0),
    pay*12+NVL2(BONUS, bonus, 0), --보너스 있으면 보너스, 없으면 0
    NVL2(bonus, pay*12+bonus, pay*12)
 from professor;
--2.
--아래 화면과 같이 emp 테이블에서 deptno 가 30 번인 사원들을 조회하여 comm 값이 있을 경우 
--'Exist' 을 출력하고 comm 값이 null 일 경우 'NULL' 을 출력하세요.

 select 
    EMPNO,
    ENAME,
    COMM,
    NVL2(comm, 'Exist', 'NULL') NVL2
 from emp
 where DEPTNO = 30;