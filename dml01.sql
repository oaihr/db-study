/************************************************************************/
DML(Data Manipulation Language)

데이터 저장 INSERT
데이터 수정 UPDATE
데이터 삭제 DELETE
데이터 병합 MERGE

-------------------------------데이터 조회 (SELECT)

INSERT 저장

INSERT INTO 테이블명 (컬럼명...)
VALUES (데이터 값...)

전체 컬럼에 데이터를 저장 + 순서 맞춰서 저장하는 경우 -> 컬럼명 작성 생략 가능 
INSERT INTO 테이블명
VALUES (데이터 값...);


INSERT INTO new_table (no, name, birth)
VALUES (1, '이름1', SYSDATE);

INSERT INTO new_table (birth, name, no) 
VALUES (SYSDATE, '이름2', 2); -- 컬럼 데이터타입에 맞춰서 값을 넣어 줘야함

INSERT INTO new_table (birth, name, no) 
VALUES ( TO_DATE('2024-12-12'), '이름3', 3);

INSERT INTO new_table --컬럼명 생략
VALUES (4, '이름4', SYSDATE);

INSERT INTO new_table (no, name)
VALUES (5, '이름5');

INSERT INTO new_table 
VALUES (6, '이름6', null);

select * from new_table;

INSERT ALL
INTO new_table VALUES(7, '이름7', null)
INTO new_table VALUES(8, '이름8', SYSDATE)
INTO new_table VALUES(9, '이름9', TO_DATE('2023-01-30'))
SELECT * FROM DUAL;


select * from new_table2;

-- 다른 테이블의 다른 데이터를 조회해서 저장
INSERT INTO new_table2
SELECT 10, '이름10', SYSDATE FROM dual;

INSERT INTO new_table2
select no, name, birth from new_table;

INSERT INTO new_table2
select no, name, birth from new_table
where no < 5;

-------------------------------
테이블 수정 UPDATE

UPDATE 테이블명
SET 컬럼명 = 값,
    컬럼명 = 값
WHERE 조건;

select * from dept3;

--Seoul Branch Office -> Incheon Branch Office
UPDATE dept3
SET AREA = 'Incheon Branch Office'
--select * from dept3
WHERE area = 'Seoul Branch Office';

UPDATE dept3
SET dname = 'Sales First Team'
where dcode = 1008;




CREATE TABLE professor2     --professor 테이블 복사
AS
SELECT * FROM professor;

select * from professor2;

--bonus 받는 교수들의 보너스를 +100 
UPDATE professor2
SET bonus = bonus + 100
--select * from professor2
where bonus IS NOT NULL;

-------------------------------
commit;     확정
rollback;   되돌리기(취소)


select * from professor2; --롤백해서 보너스 원래대로 돌아옴
                          --bonus 받는 교수들의 보너스를 +100  커밋해서
                          --롤백해도 원대래로 안돌아감

--insert, update, delete (DML)            

select * from new_table2;

insert into new_table2
values(99, '이름99', SYSDATE);

-------------------------------
DELETE 데이터 삭제 ( rollback 가능 : 자동commit이 아닌경우 )

DELETE FROM 테이블명
WHERE 조건;

select * from dept3;

select *          --실수할 수 있으니 뭘 지우는건지 체크하기
--delete
from dept3
where dcode = 1007;


