SELECT BI.*
  FROM (SELECT NVL(MA.BRAND_CODE, DD.BRAND_CODE) AS BI_BRAND,
               NVL(MA.S_CS_CODE, DD.S_CS_CODE) AS BI_SCS_CODE,
               NVL(MA.ARTICLE_NO, DD.ARTICLE_NO) AS BI_ARTICLE_NO,
               MA.PRODUCTION_NO AS BI_PRODUCTION_NO,
               MRP.PARENT_WTY_MODEL AS BI_MT_MODEL,
               DD.YYYYMM AS BI_YYYYMM,
               SUM(DD.QUANTITY) AS BI_QTY,
               SUM(DD.CUT_DISCOUNT_AMT_NON_VAT) AS BI_AMT,
               DD.CURRENCY_CODE AS BI_CURRENCY_CODE,
               M.SALES_MODEL AS BI_SALES_MODEL
          FROM DMDBS.INT_DELIVERY_DETAIL_F DD,
               DMMBS.MST_RPM_PART          MRP,
               DMDBS.INT_ARTICLE_D         MA,
               DMDBS.INT_CUSTOMER_D        M
         WHERE 1 = 1
              --��BU����
           AND DD.NATION_CODE = 'TW'
           AND DD.SO_TYPE IN ('GG', 'CC')
           AND DD.ITEM_NO = MRP.ITEM_NO(+)
           AND DD.ITEM_NO = MA.ITEM_NO(+)
           AND DD.NATION_CODE = MA.NATION_CODE(+)
           AND DD.NATION_CODE = M.NATION_CODE(+)
           AND DD.COMPANY_CODE = M.COMPANY_CODE(+)
           AND DD.CUSTOMER_CODE = M.CUSTOMER_CODE(+)
           AND DD.YYYYMM = M.YYYYMM(+)
          -- AND MA.BRAND_CODE ='HP'
          -- AND MA.S_CS_CODE ='BX'
          -- AND MA.ARTICLE_NO='PX:AS615AA'
           AND DD.SO_DATE >= TO_DATE('2018-01-01', 'YYYY-MM-DD')
           AND DD.SO_DATE < TO_DATE('2018-02-01', 'YYYY-MM-DD')
        --AND NVL(MA.BRAND_CODE,DD.BRAND_CODE) = 'HTC'
        --AND NVL(MA.S_CS_CODE, DD.S_CS_CODE) = 'HN'
         GROUP BY NVL(MA.BRAND_CODE, DD.BRAND_CODE),
                  NVL(MA.S_CS_CODE, DD.S_CS_CODE),
                  NVL(MA.ARTICLE_NO, DD.ARTICLE_NO),
                  MA.PRODUCTION_NO,
                  MRP.PARENT_WTY_MODEL,
                  DD.YYYYMM,
                  DD.CURRENCY_CODE,
                  M.SALES_MODEL) BI
 WHERE 1 = 1 
 AND EXISTS(
     SELECT 1 FROM RPM_SO_SUMMARY SO
     WHERE 1=1
      AND BI.BI_BRAND = SO.BRAND_CODE
 AND BI.BI_SCS_CODE = SO.S_CS_CODE
 AND BI.BI_ARTICLE_NO = SO.ARTICLE_NO
 AND BI.BI_PRODUCTION_NO = SO.PRODUCTIONNO 
 AND BI.BI_MT_MODEL = SO.MT_MODEL
 AND BI.BI_YYYYMM = SO.SELL_YYYY_MM
 AND BI.BI_CURRENCY_CODE = SO.CURRENCYCODE
 AND ( BI.BI_QTY <> SO.SELL_NET_QTY  OR BI_AMT <> SO.SELL_NET_AMOUNT )
     
 )


          
          
          
SELECT * FROM DMDBS.INT_DELIVERY_DETAIL_F DD WHERE DD.SO_TYPE='CC'

SELECT * FROM MST_RPM_PART

SELECT * from RPM_SO_SUMMARY SO WHERE SO.BRAND_CODE ='SAM' AND SO.S_CS_CODE='SM' AND SO.ARTICLE_NO='J730��(AR)' AND SO.PRODUCTIONNO = 'SM-J730GZDUBRI' AND SO.MT_MODEL = 'J730'
TRUNCATE TABLE RPM_SO_SUMMARY

2	SAM	SM	J730��(AR)	SM-J730GZDUBRI	J730	201801	7627	49348030.78397	NTD	

SELECT BI.* FROM (
SELECT INT_ARTICLE_D.BRAND_CODE AS BRAND_CODE, INT_DELIVERY_DETAIL_F.BRAND_CODE AS BRAND_CODE_2 , INT_ARTICLE_D.S_CS_CODE, INT_DELIVERY_DETAIL_F.S_CS_CODE, INT_ARTICLE_D.ARTICLE_NO, INT_DELIVERY_DETAIL_F.ARTICLE_NO, INT_ARTICLE_D.PRODUCTION_NO, MST_RPM_PART.PARENT_WTY_MODEL, INT_DELIVERY_DETAIL_F.YYYYMM, INT_DELIVERY_DETAIL_F.QUANTITY, INT_DELIVERY_DETAIL_F.CUT_DISCOUNT_AMT_NON_VAT, INT_DELIVERY_DETAIL_F.CURRENCY_CODE, INT_CUSTOMER_D.SALES_MODEL, INT_DELIVERY_DETAIL_F.NATION_CODE, INT_DELIVERY_DETAIL_F.COMPANY_CODE 
FROM
 DMDBS.INT_ARTICLE_D, DMDBS.INT_DELIVERY_DETAIL_F, DMMBS.MST_RPM_PART, DMDBS.INT_CUSTOMER_D
WHERE  1=1
AND INT_DELIVERY_DETAIL_F.NATION_CODE = 'TW'
   AND INT_DELIVERY_DETAIL_F.SO_TYPE IN ('GG', 'CC')
   AND INT_DELIVERY_DETAIL_F.ITEM_NO = MST_RPM_PART.ITEM_NO(+)
   AND INT_DELIVERY_DETAIL_F.ITEM_NO = INT_ARTICLE_D.ITEM_NO(+)
   AND INT_DELIVERY_DETAIL_F.NATION_CODE = INT_ARTICLE_D.NATION_CODE(+)
   AND INT_DELIVERY_DETAIL_F.NATION_CODE = INT_CUSTOMER_D.NATION_CODE(+)
   AND INT_DELIVERY_DETAIL_F.COMPANY_CODE = INT_CUSTOMER_D.COMPANY_CODE(+)
   AND INT_DELIVERY_DETAIL_F.CUSTOMER_CODE = INT_CUSTOMER_D.CUSTOMER_CODE(+)
   AND INT_DELIVERY_DETAIL_F.YYYYMM = INT_CUSTOMER_D.YYYYMM(+)
   AND INT_DELIVERY_DETAIL_F.SO_DATE >= TO_DATE('2018-01-01', 'YYYY-MM-DD')
   AND INT_DELIVERY_DETAIL_F.SO_DATE < TO_DATE('2018-02-01', 'YYYY-MM-DD') ) BI
   WHERE BI.BRAND_CODE='HP'



SELECT * FROM DMDBS.INT_DELIVERY_DETAIL_F 

SELECT * FROM RPM_SO_SUMMARY SO WHERE SO.SELL_YYYY_MM
DELETE RPM_SO_SUMMARY 

SELECT * FROM RPM_FACT_REPAIR
SELECT * FROM DMMBS.MST_RPM_PART



SELECT INT_ARTICLE_D.BRAND_CODE, INT_DELIVERY_DETAIL_F.BRAND_CODE, INT_ARTICLE_D.S_CS_CODE, INT_DELIVERY_DETAIL_F.S_CS_CODE, INT_ARTICLE_D.ARTICLE_NO, INT_DELIVERY_DETAIL_F.ARTICLE_NO, INT_ARTICLE_D.PRODUCTION_NO, MST_RPM_PART.PARENT_WTY_MODEL, INT_DELIVERY_DETAIL_F.YYYYMM, INT_DELIVERY_DETAIL_F.QUANTITY, INT_DELIVERY_DETAIL_F.CUT_DISCOUNT_AMT_NON_VAT, INT_DELIVERY_DETAIL_F.CURRENCY_CODE, INT_CUSTOMER_D.SALES_MODEL, INT_DELIVERY_DETAIL_F.NATION_CODE, INT_DELIVERY_DETAIL_F.COMPANY_CODE 
FROM
 DMDBS.INT_ARTICLE_D, DMDBS.INT_DELIVERY_DETAIL_F, DMMBS.MST_RPM_PART, DMDBS.INT_CUSTOMER_D
WHERE  1=1
AND INT_DELIVERY_DETAIL_F.NATION_CODE = 'TW'
   AND INT_DELIVERY_DETAIL_F.SO_TYPE IN ('GG', 'CC')
   AND INT_DELIVERY_DETAIL_F.ITEM_NO = MST_RPM_PART.ITEM_NO(+)
   AND INT_DELIVERY_DETAIL_F.ITEM_NO = INT_ARTICLE_D.ITEM_NO(+)
   AND INT_DELIVERY_DETAIL_F.NATION_CODE = INT_ARTICLE_D.NATION_CODE(+)
   AND INT_DELIVERY_DETAIL_F.NATION_CODE = INT_CUSTOMER_D.NATION_CODE(+)
   AND INT_DELIVERY_DETAIL_F.COMPANY_CODE = INT_CUSTOMER_D.COMPANY_CODE(+)
   AND INT_DELIVERY_DETAIL_F.CUSTOMER_CODE = INT_CUSTOMER_D.CUSTOMER_CODE(+)
   AND INT_DELIVERY_DETAIL_F.YYYYMM = INT_CUSTOMER_D.YYYYMM(+)
   AND TO_DATE(INT_DELIVERY_DETAIL_F.YYYYMM,'YYYYMM') > ADD_MONTHS(TRUNC(SYSDATE , 'MM'),-3)
