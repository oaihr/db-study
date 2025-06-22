
/*
참조 테이블 : panmae, product, gift
출력 데이터 : 상품명, 상품가, 구매수량, 총금액,
적립포인트, 새해2배적립포인트, 사은품명, 포인트 범위

- panmae 테이블을 기준으로 포인트를 보여준다.
- 포인트는 구매한 금액 1원당 100의 포인트를 부여한다.
(단, 01월 01인 경우는 새해 이벤트로 인해 1원당 200의 포인트를 부여한다.)
- 적립포인트와 새해2배적립포인트를 모두 보여준다.
(이 경우, 이벤트 날인 01월 01일을 제외하고는 포인트가 동일 할 것이다.)
- 새해2배적립포인트를 기준으로 해당 포인트 기준으로 받을수 있는 사은품을 보여준다.
- 사은품 명 옆에 해당 사은품을 받을 수 있는 포인트의 범위를 함께 보여준다.

* 출력 양식과 컬럼 헤더에 표기되는 이름 확인!
*/

    select * from panmae;
    select * from product;
    select * from gift;
    
    select 
        TO_CHAR(TO_DATE(P_DATE), 'YYYY-MM-DD') 판매일자,
        pm.P_CODE 상품코드,
        pd.P_NAME 상품명,
        TO_CHAR(pd.P_PRICE, '99,999') 상품가,
        pm.P_QTY 구매수량,
        TO_CHAR(pm.P_TOTAL, '99,999') 총금액,
        TO_CHAR(pm.P_TOTAL*100, '999,999') 적립포인트,
        DECODE ( TO_CHAR(TO_DATE(P_DATE), 'YYYY-MM-DD'), '2011-01-01', 
                TO_CHAR( 2*100*pm.P_TOTAL, '999,999,999'), 
                TO_CHAR( 100*pm.P_TOTAL, '999,999,999') ) 새해2배적립포인트,
        TO_CHAR(gf.G_START, '999,999') 포인트START,
        TO_CHAR(gf.G_END, '999,999') 포인트END
    from panmae pm, product pd, gift gf
    where pm.P_CODE = pd.P_CODE
            AND
           DECODE ( TO_CHAR(TO_DATE(P_DATE), 'YYYY-MM-DD'), '2011-01-01', 
                2*100*pm.P_TOTAL, 
                100*pm.P_TOTAL ) 
            BETWEEN gf.G_START AND gf.G_END;
            -- gift 테이블과 조인
            -- G_START <= 포인트 <= G_END
   
   
    --틀린이유
    select 
        TO_CHAR(TO_DATE(P_DATE), 'YYYY-MM-DD') 판매일자,
        pm.P_CODE 상품코드,
        pd.P_NAME 상품명,
        pm.P_QTY 구매수량,
        pm.P_TOTAL 총금액
    from panmae pm, product pd -- gift gf  join 연결이 안되면 카테시안 곱 발생
    where pm.P_CODE = pd.P_CODE;
    
    