select * from emp;

--emp 전체 sal 급여 평균
select AVG(sal) 
from emp;

--emp 30번부서사람들 평균급여
select AVG(sal) 
from emp
where deptno = 30;

--emp 각부서별 평균 급여
select deptno, AVG(sal) 
from emp
group by DEPTNO;

--emp 각부서별 인원과 평균 급여
select 
    deptno, 
    COUNT(empno), 
    ROUND(AVG(sal), 2) 평균급여 
from emp
group by DEPTNO;

--emp 각 직업별 평균 급여
select job, AVG(sal)
from emp
group by job;

--emp 각 직업별 가장 높은 급여 얼마?
select job, MAX(sal)
from emp
group by job;

--emp 각 부서별 가장 높은 급여 얼마?
select deptno, MAX(sal)
from emp
group by deptno;