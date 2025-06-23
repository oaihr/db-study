1.
student, department 테이블 활용
학과 이름, 학과별 최대키, 학과별 최대키를 가진 학생들의 이름과 키를 출력 하세요.
--다중컬럼

select C.dname, A.max_height, b.name, b.height
from( -- 인라인뷰
        select deptno1, MAX(height)  max_height
        from student
        group by deptno1) A, student B, department C
where A.deptno1 = B,deptno1
        AND
      A.max_height = B.height
        AND
      B.deptno1 = C.deptno;   

select  
    d.dname, 
    s.height MAX_HEIGHT , 
    s.name, 
    s.height
from student s, department d
where (deptno1, height) IN (select deptno1, MAX(height) 
                            from student
                            group by deptno1)
        AND s.deptno1 = d.deptno;
        
--서브쿼리에서 계산 후 비교
--순위
select
    dname,
    height MAX_HEIGHT,
    name,
    height
from(select 
        d.dname,
        s.name,
        s.height,
        ROW_NUMBER() OVER (PARTITION BY d.deptno ORDER BY s.height desc) rn
     from student s, department d
     where s.deptno1 = d.deptno)
where rn = 1;

2.
student 테이블에서 학생의 키가 동일 학년의 평균 키 보다 큰 학생들의 학년과 이름과 키,
해당 학년의 평균 키를 출력 하세요.
--(학년 컬럼으로 오름차순 정렬해서 출력하세요)


select 
    s.grade,
    s.name,
    s.height,
    g.avg_ht AVG_HEIGHT
from student s, (select grade, AVG(height) avg_ht
                  from student
                  group by grade) g 
where s.grade = g.grade
        AND
      s.height > g.avg_ht
order by grade;



