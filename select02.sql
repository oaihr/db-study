
 /******************************************************************/
  단일행 함수
  
  select * from dual;
  dual: 더미 데이터가 들어있는 임시로 사용하는 테이블
  
  select INITCAP('abc') from dual;
  
  select ename, INITCAP(ename)
  from emp;
  
  select name, LOWER(name), UPPER(name)
  from student;
  
  select name, LENGTH(name)
  from student;
  
  select LENGTH('asdois'), LENGTHB('asdois'),
         LENGTH('한글'), LENGTHB('한글') --한글 한 글자는 3byte
  from dual;
  
  --이름이 알파벳 5자 이상만 조회
  select *
  from emp
  where LENGTH(ename) >= 5;
  
  select '아침' || '점심', CONCAT('아침', '점심')
  from dual;
  
  select '아침' || '점심' || '저녁', CONCAT( CONCAT('아침', '점심'), '저녁' ) --concat은 2개만 붙일 수 있음
  from dual;
  
  -- SUBSTR(대상값/컬럼명, 시작지점, 자릿수)
  select
     SUBSTR('abcdefg', 1, 3),   -- 1번째 글자부터 3개
     SUBSTR('abcdefg', 3, 5),   -- 3번째 글자부터 5개
     SUBSTR('abcdefg', -5, 2)   -- 뒤에서 5번째 글자부터 2개
  from dual;
  
  -- INSTR(대상값/컬럼명, 찾는값)
  -- INSTR(대상값/컬럼명, 찾는값, 시작위치)
  -- INSTR(대상값/컬럼명, 찾는값, 시작위치, 몇번째값)
  select
    INSTR('2025-06-17 10:10:28', '-'), --   '-'위치찾기
    INSTR('2025-06-17 10:10:28', ':'),
    INSTR('2025-06-17 10:10:28', '-', 7),
    INSTR('2025-06-17 10:10:28', ':', 15),
    INSTR('2025-06-17 10:10:28', '-', 1, 2)
  from dual;
  
  select 
    tel,
    INSTR(tel, ')')
  from student; -- 010-1234-5678
  
  select
    LPAD('문자', 10, '-'),
    RPAD('123', 6, '*'),
    LPAD(5, 2, 0),
    LPAD(15, 2, 0)
  FROM dual;
  
  --TRIM 공백제거  
  select
    '*' || LTRIM(' abcd ' ) || '*',
    LTRIM(' abcd '),
    RTRIM(' abcd '),
    TRIM(' abcd '),
    LTRIM('*abcd*', '*')
  from dual;
  
  
  select 
    REPLACE('abcde', 'c', '/')
  from dual;
  
  select 
    birthday,
    REPLACE(birthday, '/', '$')
  from student;
  
  
  
  
  