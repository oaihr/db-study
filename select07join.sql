 /******************************************************************/
  Join
 
 select * from emp;
 select * from dept;
 
 
 --JOIN 기준 deptno가 같은!!
 
 --select empno, ename, dname, loc, d.deptno
 select e.empno, e.ename, d.dname, d.loc, d.deptno --어느 테이블의 값인지 명시(정석)
 from emp e, dept d
 where e.deptno = d.deptno;
 
 
 select e.empno, e.ename, d.dname, d.loc, d.deptno
 from emp e INNER JOIN dept d
 ON e.deptno = d.deptno;
 
 
 select *
 from emp e, dept d; --join 조건 누락 -> 카티션 곱 발생
 

 
 --student <- join(profno) -> professor
 select 
    s.name, p.name, s.studno, p.profno, p.email
 from student s, professor p
 where s.profno = p.profno;
 
 
  select 
    s.name, p.name, s.studno, p.profno, p.email
 from student s INNER JOIN professor p
 ON s.profno = p.profno;
 
 
 INNER JOIN, OUTER JOIN
 
 select COUNT(*) from student;
 
 select *
 from student s, professor p
 --where s.profno = p.profno(+)  --(+)를 붙여서 OUTER JOIN
 --where p.profno = s.profno(+);
 where p.profno(+) = s.profno;
 
 select *
 from student s LEFT OUTER JOIN professor p 
 --from student s RIGHT OUTER JOIN professor p
 --from professor p LEFT OUTER JOIN student s
 --from professor p RIGHT OUTER JOIN student s
 ON s.profno = p.profno;
 
 -- professor 테이블 기준
 select COUNT(*) from professor; --16명
 
 select 
    s.name, p.name, s.studno, p.profno, p.email
 from professor p, student s
 where p.profno = s.profno;
 
 
 select 
    s.name, p.name, s.studno, p.profno, p.email
 from professor p, student s
 where p.profno = s.profno(+);
 
  
 
select s.NAME 학생이름, s.PROFNO 교수번호, p.NAME 교수이름
from student s, professor p
where s.profno = p.profno;


select * from student;
select * from department;
select * from professor;

select s.name 학생이름, d.dname 학과이름, p.name "지도교수 이름"
from student s, department d, professor p
where s.deptno1 = d.deptno AND s.profno = p.profno;

select s.name, p.profno, p.name
from student s, professor p
where s.deptno1 = 101
AND s.profno = p.profno;


--1) 학생명, 학생의 학과명, 교수명, 교수학과번호
select s.name 학생명, d.dname 학과명, p.name 교수명, p.deptno 교수학과번호
from student s, professor p, department d
where s.deptno1 = d.deptno 
        AND
      s.profno = p.profno;  
    --d.deptno = s.deptno1;
    
--2) 학생명, 교수의 학과명, 교수명, 교수학과번호
select s.name 학생명, d.dname 교수학과명, p.name 교수이름, p.deptno 교수학과번호
from student s, professor p, department d
where s.profno = p.profno; 
        AND
      p.deptno = d.deptno 
 
 --3) 학생명, 학생학과번호, 학생의 학과명, 교수명, 교수학과번호, 교수의 학과명
 select s.name, s.deptno1, ds.dname, p.name, p.deptno, dp.dname
 from student s, professor p, department dp, department ds
 where s.profno = p.profno 
        AND
       dp.deptno = p.deptno  --학과와 교수 연결
        AND
       ds.deptno = s.deptno1; --학과와 학생 연결
       
 
 
/******************************************************************/
  비등가 Join
  
  select * from customer;
  select * from gift;
  
  
  select * 
  from customer c, gift g
  where c.point BETWEEN g.g_start AND g.g_end;
  
  select * from hakjum;
  
  --Self Join
  
  select * from emp;
  
  select *
  from emp e1, emp e2
  where e1.mgr = e2.empno; 
  
  select * from emp2;
  
  select 
    A.empno 내사번, A.name 내이름, A.pempno 상사사번, B.name 상사이름
  from emp2 A, emp2 B  
  where A.pempno = B.empno;
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  