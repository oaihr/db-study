1.
student , department
이름이 'Anthony Hopkins' 인 학생과 1전공이 동일한 학생들의 정보 (이름, 학과번호, 학과이름) 출력하기.

select 
    s.name,
    s.deptno1,
    d.dname
from student s, department d
where s.deptno1 = d.deptno
         AND
        s.deptno1 = ( select deptno1
                    from student    -- 이름이 Anthony Hopkins인 학생의 deptno1
                    where name = 'Anthony Hopkins') 
order by 1;


2.
professor, department 테이블 활용. 이름이 'Meg Ryan' 인 교수보다 나중에 입사한 사람의 이름, 입사일, 학과명 을 출력하세요.

select 
    p.name,
    p.hiredate,
    d.dname
from professor p, department d
where p.deptno = d.deptno
            AND
       p.hiredate > (select hiredate
                     from professor -- 이름이 Meg Ryan인 교수의 hiredate
                     where name= 'Meg Ryan')
order by 2;


3.
student 테이블, 1전공이 201번 학과의 평균 몸무게보다 몸무게가 많이 나가는 학생들의 이름과 몸무게 출력하세요.
select 
    name,
    weight
from student
where weight > (select AVG(weight)
                from student
                where deptno1 = 201);



4.
emp2, dept2 테이블을 참고하여,
근무지역이 포항인 모든 사원들의 사번, 이름, 부서번호 출력하기!!

select 
    empno,
    name,
    deptno
from emp2 e, dept2 d
where AREA = 'Pohang Main Office'
        AND
      e.deptno = d.dcode;        
