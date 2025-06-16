 
 SELECT * FROM STUDENT;
 
 --1
 SELECT 
        NAME || '''s ID : ' || ID || 
        ', WEIGHT is ' || WEIGHT || 'kg' 
        AS "ID AND WEIGHT" 
 FROM STUDENT; 
        --작은따옴표 쓰고싶으면 ''    
 
 SELECT * FROM emp;
 
 --2
 select ename, ename, ename from emp;
 SELECT 
        ENAME || '(' || JOB || ') , ' || 
        ENAME || '''' || JOB || '''' 
        AS "NAME AND JOB " 
 FROM emp;
 
 --3
 SELECT 
    ENAME || '''s sal is $' || SAL 
    AS "Name and Sal" 
 FROM emp; 