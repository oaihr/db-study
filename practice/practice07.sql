
    select 
        STUDNO,
        NAME,
        TO_CHAR(BIRTHDAY, 'YYYY-MM-DD') BIRTHDAY
    from student
    where TO_CHAR(BIRTHDAY, 'MM') = 01
    ;
    
    
    select 
        EMPNO,
        ENAME,
        HIREDATE
    from emp
    where TO_CHAR(HIREDATE, 'MM') IN (1,2,3)
    ;