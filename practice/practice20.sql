1. professor 테이블과 department 테이블을 조회하여 각 학과별로 입사일이 가장 오래된 교수의
교수번호화 이름, 학과명을 출력하세요
--(입사일 순으로 오름차순 정렬)
select
    profno,
    name,
    dname
from (select 
           p.profno,
           p.name,
           d.dname,
           p.deptno,
           p.hiredate,
           ROW_NUMBER() OVER (PARTITION BY p.deptno ORDER BY p.hiredate ASC) rn
      from professor p, department d
      where p.deptno = d.deptno)
where rn = 1;

--t1
select p.profno, p.name, p.deptno, d.dname
from professor p, department d
where (p.deptno, p.hiredate) IN
            (select deptno, MIN(hiredate)
             from professor
             group by deptno)
        AND p.deptno = d.deptno;

--t2
select p1.profno, p1.name,
        (select d.dname
         from department d
         where d.deptno = p1.deptno) dname
from professor p1
where p1.hiredate = ( select MIN(p2.hiredate)
                        from professor p2
                        where p2.deptno = p1.deptno                        
                        );


2. emp2 테이블 조회하여 직급별로 해당 직급에서 최대 연봉을 받는 직원의 이름과 직급, 연봉을 출력하세요
--(연봉순으로 오름차순 정렬)

select 
    name,
    position,
    pay
from(select
    e.name,
    e.position,
    e.pay,
    ROW_NUMBER() OVER (PARTITION BY position order by pay desc) rn
    from emp2 e)
where rn = 1 AND POSITION IS NOT NULL
order by 3 asc;


--t1
select *
from emp2
where (position, pay) IN (  select position, MAX(PAY)
                            from emp2
                            group by position);