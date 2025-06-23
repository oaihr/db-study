1.
emp2 테이블 활용
직원 중 'Section head' 직급 최소 연봉자 보다 연봉이 높은 사람의 이름, 직급, 연봉을 출력하기.
select * from emp2;
select 
    name,
    position,
    pay
from emp2
where pay > (select MIN(pay)
             from emp2
             where position = 'Section head')
order by 3 desc;

2.
Student 테이블.
전체 학생중에서 체중이 2학년 학생들의 체중에서 가장 적네 나가는 학생보다
몸무게가 더 적은 학생의 이름, 학년, 몸무게 출력
select
    name,
    grade,
    weight
from student
where weight < (select MIN(weight)
                from student
                where grade = 2);

3.
emp2, dept2 활용
각 부서별 평균연봉을 구하고, 그 중에서 가장 작은 평균 연봉보다도 더 적게 받는 직원들의
부서명, 직원명, 연봉 출력

select 
    d.DNAME,
    e.NAME,
    e.PAY
from emp2 e, dept2 d
where e.pay < (select MIN(avg_pay) 
            from (select AVG(pay) avg_pay
                  from emp2         -- dept2 조인할 필요 없음 
                  group by deptno)) -- 각 부서 평균연봉 중 최소값만 구하면 되니까!
        AND
        e.deptno = d.dcode;    



-- ALL로 처리
select 
    d.DNAME,
    e.NAME,
    e.PAY
from emp2 e, dept2 d
where e.pay < ALL (select AVG(pay) avg_pay
                   from emp2         --(각 부서 평균연봉 중 최소값)
                   group by deptno)
        AND
        e.deptno = d.dcode;    
