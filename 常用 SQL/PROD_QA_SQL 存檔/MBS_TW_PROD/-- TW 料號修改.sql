-- 修改料號
SELECT * FROM mstarticle WHERE ARTICLENO='小米智能攝像機 雲台版Pro 白色';
SELECT * FROM mstarticle WHERE ARTICLENO='小米智能攝像機 雲台版Pro 白色' AND BRANDCODE='MIA'

料號:6M101
BRAND:MIA
SCSCODE:WA
--查詢那些需要修改

SELECT * FROM DBS_MAJ.rpmmt WHERE mtno='MT1K102238' AND COMPANYCODE='20';
SELECT * FROM DBS_MAJ.rpm_fact_repair WHERE MT_NO='MT1K102238' AND COMPANY_CODE='20';
SELECT * FROM DBS_MAJ.ivcplserialno WHERE VOUCHERNO='MT1K102238' AND COMPANYCODE='20';
SELECT * FROM DBS_MAJ.ivcplserialno_all WHERE VOUCHERNO='MT1K102238' AND COMPANYCODE='20';
SELECT * FROM DBS_MAJ.rpm_serialno WHERE COMPANYCODE='20' AND MTNO='MT1K102238';

-- 若有換出序號
有換出序號要多查，確認保固資料正確(ITEMNO, WARRANTYEXPIREDATE)
網站會撈UPDATETIME為7天之內的更新資料，所以UPDATETIME要一起改

SELECT MT.SERIALNO FROM DBS_MAJ.RPMMT MT WHERE 1=1 AND MT.MTNO='MT1K102238'
SELECT * FROM ivcplserialno WHERE SERIALNO='28307/00023794';
SELECT * FROM ivcplserialno_all WHERE SERIALNO='28307/00023794';




--UPDATE TABLE 更改料號
RPMMT 只有ITEM_NO 要改
RPM_FACT_REPORT & RPM_FACT_REPORT_NOW 要注意
ITEM_NO , BRAND_CODE, S_CS_CODE, ARTICLE_NO 是否正確

UPDATE DBS_MAJ.rpmmt SET ITEMNO='6M101', WHERE mtno='MT1K102238' AND COMPANYCODE='20';
UPDATE DBS_MAJ.rpm_fact_repair SET ITEM_NO='6M101',S_CS_CODE='W4',ARTICLE_NO='小米智能攝像機 雲台版Pro 白色' WHERE MT_NO='MT1K102238'  AND COMPANY_CODE='20' ;

UPDATE DBS_MAJ.ivcplserialno SET ITEMNO='6M101', UPDATETIME=SYSDATE WHERE VOUCHERNO='MT7H507913' AND COMPANYCODE='20';
UPDATE DBS_MAJ.ivcplserialno_all SET ITEMNO='6M101' ,UPDATETIME=SYSDATE WHERE VOUCHERNO='MT7H507913' AND COMPANYCODE='20';
UPDATE DBS_MAJ.rpm_serialno SET ITEMNO='6M101',SO_ITEMNO='6M101' WHERE COMPANYCODE='20' AND MTNO='MT7H507913';--(換序1要加改SO_ITEMNO)



--UPDATE TABLE 更改廠牌
RPMMT 只有ITEM_NO 要改
RPM_FACT_REPORT & RPM_FACT_REPORT_NOW 要注意
ITEM_NO , BRAND_CODE, S_CS_CODE, ARTICLE_NO 是否正確

UPDATE DBS_MAJ.rpmmt SET ITEMNO='6M101' WHERE mtno='MT1K102238' AND COMPANYCODE='20';
UPDATE DBS_MAJ.rpm_fact_repair_now SET ITEM_NO='6M101',BRAND_CODE='MIA' WHERE MT_NO='MT1K102238'  AND COMPANY_CODE='20' ; 
UPDATE DBS_MAJ.rpm_fact_repair SET ITEM_NO='6M101',BRAND_CODE='MIA' WHERE MT_NO='MT1K102238'  AND COMPANY_CODE='20' ;

UPDATE DBS_MAJ.ivcplserialno SET ITEMNO='6M101', UPDATETIME=SYSDATE WHERE VOUCHERNO='MT7H507913' AND COMPANYCODE='20';
UPDATE DBS_MAJ.ivcplserialno_all SET ITEMNO='6M101' ,UPDATETIME=SYSDATE WHERE VOUCHERNO='MT7H507913' AND COMPANYCODE='20';
UPDATE DBS_MAJ.rpm_serialno SET ITEMNO='6M101',SO_ITEMNO='6M101' WHERE COMPANYCODE='20' AND MTNO='MT1K102238';

--(換序1要加改SO_ITEMNO)


補充:
另外如果MT單的情況如下圖:有R-無R+，完修批號尚未入庫，換貨類
--則更正的SQL如下:
UPDATE DBS_MAJ.rpmmt SET ITEMNO='6M101' WHERE mtno='MT97500037' AND COMPANYCODE='06';
UPDATE DBS_MAJ.rpm_fact_repair_now SET ITEM_NO='X5663',S_CS_CODE='HN',ARTICLE_NO='B810X白16G' WHERE MT_NO='MT4H509802';
UPDATE DBS_MAJ.rpm_fact_repair SET ITEM_NO='X5663',S_CS_CODE='HN',ARTICLE_NO='B810X白16G' WHERE MT_NO='MT4H509802';
UPDATE DBS_MAJ.rpmswapindetail SET SWAPINITEMNO='X9861' WHERE BATCHNO='E506120002' AND SWAPINITEMNO='X9867';
UPDATE DBS_MAJ.ivcplserialno SET ITEMNO='6M101', UPDATETIME=SYSDATE WHERE VOUCHERNO='MT7H507913' AND COMPANYCODE='20';
UPDATE DBS_MAJ.ivcplserialno_all SET ITEMNO='6M101' ,UPDATETIME=SYSDATE WHERE VOUCHERNO='MT7H507913' AND COMPANYCODE='20';
UPDATE DBS_MAJ.rpm_serialno SET ITEMNO='6M101' WHERE COMPANYCODE='20' AND MTNO='MT7H507913';(換序1要加改SO_ITEMNO)

