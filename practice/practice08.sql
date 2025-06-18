
 select 
    EMPNO,
    ENAME,
    TO_CHAR( (sal * 12)+comm, '99,999' ) SALARY
 from emp
 where ENAME = 'ALLEN'
 ;
 
 select 
    empno,
    ename,
    TO_CHAR(hiredate, 'YYYY-MM-DD')HIREDATE,
    TO_CHAR((sal*12)+comm, '$999,999') SAL,
    '$' || TO_CHAR( (sal*12+comm), 'fm99,999') SAL,    
    TO_CHAR(1.15*((sal*12)+comm), '$999,999') "15%인상"
 from emp
 where comm is not null
 ;