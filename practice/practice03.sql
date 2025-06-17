--sql 모닝퀴즈

SELECT 
    DEPTNO 부서번호,
    DNAME 부서이름,
    LOC 위치
FROM dept;


SELECT 
    NAME || '(' || ID || ')' AS "교수정보", 
    POSITION,
    HIREDATE AS "입사일자",
    EMAIL AS "이메일"    
FROM professor;