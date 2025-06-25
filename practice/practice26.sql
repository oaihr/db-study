
--1. 아래 조건에 테이블 생성
* item_name 은 null 불가
* create_date 는 기본값 현재
* PK 는 no

CREATE TABLE T_ITEM_LIST
(
    no NUMBER(6) PRIMARY KEY,
    item_name VARCHAR2(24) NOT NULL,
    price NUMBER(6),
    create_date DATE DEFAULT SYSDATE
);
/*
2. 다음 조건에 맞는 시퀀스를 생성하시오.

시퀀스명 : T_ITEM_LIST_PK_SEQ

*상세조건

1부터 시작하며 1씩 증가한다.

값의 범위는 1~999999

순환하지 않도록 한다.
*/
CREATE SEQUENCE T_ITEM_LIST_PK_SEQ
INCREMENT BY 1
START WITH 1
MINVALUE 1
MAXVALUE 999999
NOCYCLE;
/*
3. 생성한 시퀀스의 값을 불러서 사용하는 방법을 작성하시오.

*/
select T_ITEM_LIST_PK_SEQ.nextval from dual;    --시퀀스 다음값 호출(사용) 
select T_ITEM_LIST_PK_SEQ.currval from dual;    --시퀀스 현재값 확인

/*
4. 해당 시퀀스를 활용하여, 테이블에 INSERT 처리 하는 쿼리문을 작성하시오.
*/
INSERT INTO T_ITEM_LIST
VALUES ( T_ITEM_LIST_PK_SEQ.nextval, 'pizza', 20000, SYSDATE);
INSERT INTO T_ITEM_LIST
VALUES ( T_ITEM_LIST_PK_SEQ.nextval, 'taco', 5000, SYSDATE);
INSERT INTO T_ITEM_LIST
VALUES ( T_ITEM_LIST_PK_SEQ.nextval, 'lemonade', 5000, SYSDATE);
