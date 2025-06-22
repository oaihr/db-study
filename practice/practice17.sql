
1. 학생 테이블 (student) 과 학과 테이블 (department) 테이블을 사용하여 학생이름, 1전공학과번호(deptno1) , 1전공 학과 이름을 출력하세요.

select * from student;
select * from department;

select 
    st.name,
    st.deptno1,
    d.dname
from student st, department d
where st.deptno1 = d.deptno;

2. emp2 테이블과 p_grade 테이블을 조회하여
현재 직급이 있는 사원의 이름과 직급, 현재 연봉,
해당 직급의 연봉의 하한금액과
상한 금액을 아래 결과 화면과 같이 출력하세요.
select
    e.name,
    e.position,
    TO_CHAR(e.pay, '999,999,999') PAY,
    TO_CHAR(p.S_PAY, '999,999,999') "LOW PAY",
    TO_CHAR(p.E_PAY, '999,999,999') "HIGH PAY"
from emp2 e, p_grade p
where e.position is not null
        AND
      e.position = p.position(+);
--INNER JOIN 조인 조건에 맞는게 없으면 사라짐 ('Boss' 포지션 없음)
--OUTER JOIN


--내가 한 방법      
select 
    e.name,
    e.position,
    TO_CHAR(e.pay, '999,999,999') PAY,
    CASE WHEN e.position = 'Boss' THEN null
     ELSE TO_CHAR(p.S_PAY, '999,999,999') END "LOW PAY",
    CASE WHEN e.position = 'Boss' THEN null
        ELSE TO_CHAR(p.E_PAY, '999,999,999') END "HIGH PAY"
from emp2 e, p_grade p
where e.position IS NOT null
        AND
      e.pay BETWEEN p.S_PAY AND p.E_PAY;

3. Emp2 테이블과 p_grade 테이블을 조회하여
사원들의 이름과 나이, 현재 직급 , 예상 직급 을 출력하세요.
예상 직급은 나이로 계산하며 해당 나이가 받아야 하는 직급을 의미합니다.
나이는 '2010-05-30'을 기준으로 하되 가능하면 trunc 로 소수점 이하는 절삭해서 계산하세요.

select 
    e.name 이름,
    2010 - TO_NUMBER(TO_CHAR(e.birthday, 'YYYY')) + 1 한국나이,
    e.position 지금포지션,
    p.position 그나이에맞는포지션
from emp2 e, p_grade p
where 2010 - TO_NUMBER(TO_CHAR(e.birthday, 'YYYY'))+1  BETWEEN p.S_AGE AND p.E_AGE        
order by 한국나이;



4 . customer 테이블과 gift 테이블을 Join하여 고객이 자기 포인트보다 낮은 포인트의 상품 중 한가지를 선택할 수 있다고 할 때 
    Notebook 을 선택할 수 있는 고객명과 포인트, 상품명을 출력하세요.

select 
    sq.gname,
    sq.point,
    sq.GNAME_1
 from(
     select
         c.gname,
         c.POINT,
         CASE WHEN c.POINT >= 600001 THEN 'Notebook' END GNAME_1
      from customer c, gift g
      where c.point BETWEEN g.G_START AND g.G_END
     )sq      
  where GNAME_1 IS NOT null;

  select c.gname, c.point, g.gname
  from customer c, gift g
  where c.point >= g.g_start
         AND
        g.gname = 'Notebook';

5. professor 테이블에서 교수의 번호, 교수이름, 입사일, 자신보다 입사일 빠른 사람 인원수를 출력하세요. 단 자신보다 입사일이 빠른 사람수를 오름차순으로 출력하세요.
 select 
    p.PROFNO,
    p.NAME,
    p.HIREDATE 입사일,
    (select 
        COUNT(*)
     from professor p2
     where p2.HIREDATE < p.HIREDATE
     ) COUNT
 from professor p
 order by COUNT;
 

6. emp 테이블에서 사원번호, 사원이름, 입사일, 자신보다 먼저 입사한 사람 인원수를 출력하세요. 단 자신보다 입사일이 빠른 사람수를 오름차순으로 출력하세요.
 select 
    EMPNO,
    ENAME,
    HIREDATE,
    (select
        count(*)
     from emp e2
     where e2.hiredate < e.hiredate)
 from emp e
 order by HIREDATE;
 
 select 
    profno,
    name,
    hiredate,
    RANK() OVER (ORDER BY hiredate) -1 COUNT
 from professor;
