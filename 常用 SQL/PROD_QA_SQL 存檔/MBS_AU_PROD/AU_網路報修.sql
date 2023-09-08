-- AU 網路報修 XEWVR
先進行網路報修，取得掛號單號，再由排程批次傳入掛號資訊 EAI入口XEWVR -> EMMP起單

信件內容
9/23/19 12:20 PMXEWVR EDI 1rows data error,please check。.
Y99191840,could not update: [com.synnex.erp.sys.model.Sysvoucherno#component[yearcode,companycode,voucherid,deptcode,teamcode]{teamcode=33, voucherid=MT, deptcode=33, yearcode=9, companycode=A0}]; nested exception is org.hibernate.exception.LockAcquisitionException: could not update: [com.synnex.erp.sys.model.Sysvoucherno#component[yearcode,companycode,voucherid,deptcode,teamcode]{teamcode=33, voucherid=MT, deptcode=33, yearcode=9, companycode=A0}]


#########################################################

1.查詢掛號單號?若沒有則檢查FTP(ZZEWVB.TXT)裡面該筆資料是否是符合
SELECT * FROM RPMRG RG WHERE 1=1 AND RG.REGISTERNO like 'Y26311841%'

2.查詢暫存檔
SELECT * FROM EAI_AU_RPM_TEMP EA WHERE 1=1 AND EA.REGISTER_NO ='Y26311205'

SELECT * FROM EAI_AU_RPM_TEMP EA WHERE 1=1 AND EA.REGISTER_NO LIKE 'Y2631008%'

SELECT * FROM EAI_AU_RPM_TEMP EA where 1=1 order by ea.create_time desc

TW8559

SELECT * FROM SCSEMPDATA WHERE EMPNO='TW7735'

-- FTP 
SELECT * FROM EAI_TRANSMIT_MESSAGE_LOG EL WHERE 1=1 AND EL.FUNC_CODE='XEWVR' AND EL.TRANSMIT_TIME > SYSDATE -10 order by el.create_time desc


-- EVWB
SELECT * FROM EAI_TRANSMIT_MESSAGE_LOG EL WHERE 1=1 AND EL.FUNC_CODE='XEVWS' AND EL.TRANSMIT_TIME > SYSDATE -5 order by el.create_time desc
SELECT * FROM EAI_TRANSMIT_LOG E WHERE E.FUNC_CODE='XEVWS' AND E.CREATE_TIME > SYSDATE -5 order by e.create_time desc

SELECT * FROM MST_TABLE_MAPPING WHERE 1=1 AND TABLE_NAME='MBS_AU_FTP'
SELECT * FROM MST_TABLE_MAPPING WHERE 1=1 AND TABLE_NAME='XEWVR'
SELECT * FROM MST_BUSINESS_RULE WHERE TABLE_NAME='MBS_RA'

SELECT * FROM MST_TABLE_MAPPING WHERE TABLE_NAME='COMMON' AND TABLE_FIELD='WEBMETHOD'
http://eai.au.synnex-grp.com:5555/invoke/synnex.globalNZ.webSite.mbs/getXEWVR

-- 組合料號

SELECT AR.PACKINGTYPECODE,AR.PICKINGTYPECODE,AR.* FROM MSTARTICLE AR WHERE AR.ARTICLENO='VFM-F10/W'

SELECT * FROM MSTPACKET MS WHERE MS.PACKETFATHERITEMNO = 'a2532'

SELECT * FROM MSTPACKET MS WHERE MS.PACKETSONITEMNO = 'a2532'

SELECT AR.PACKINGTYPECODE,AR.PICKINGTYPECODE,AR.* 
FROM MSTARTICLE AR WHERE AR.ITEMNO IN (SELECT MS.PACKETSONITEMNO FROM MSTPACKET MS WHERE MS.PACKETFATHERITEMNO = 'a2532')

SELECT * FROM MSTSCSCODE  WHERE SCSCODE IN('ON','CB')

15A,YATES AVE,DUNDAS VALLEY,NSW,2117

-- 正確料號 : SUA-00006

SELECT * FROM SCSEMPDATA WHERE EMPNO='0647'  -- 0174-BENA
TW8559
SELECT * FROM SCSEMPDATA WHERE EMPNO='32484'
3202 VIC HEATHERTON KINGSTON RD UNIT 40, 1
-- 2022/3/15 下午 03:35:09
SELECT *
  FROM SOMCONTACTADDRESS SCA
 WHERE 1=1
   AND UPPER(SCA.ABBNAME) = 'COMPNOW'
   AND UPPER(SCA.ZIPCODE) = '2015'
   AND UPPER(SCA.PROVINCE) = 'NSW'
   AND UPPER(SCA.CITY) = 'ALEXANDRIA'
   AND UPPER(SCA.ROAD) ='MADDOX ST'
   --AND UPPER(SCA.ODDEVEN)='UNIT 7, 49'
  -- and UPPER(SCA.CANCELMARK) = 'N'
   and exists(SELECT SC.* FROM Somcustomer SC WHERE SC.customerabbname = sca.abbname )


COMPNOW|Jack Lockyer|0299517971|PERRY PARK ESTATE,U15 / 33|MADDOX ST|ALEXANDRIA|2015|NSW|S|LOGI|920-009320(RUGFOLIO-10PK)|1|2||N/A|GGVT132426|One rugged folio does not connect to iPad. |GG DD 081221. |TW7735|Y26310970|

31030-MALCOLMP

SELECT CM.UPDATE_EMP_NO , CM.* FROM EAI_CHARGE_MASTER CM WHERE CM.UPDATE_EMP_NO <> 'SYS';
SELECT * FROM RPMMTCHARGE CH WHERE CH.SYSTEM_TYPE = 'LBS';

SELECT * FROM SOMCONTACTADDRESS SCA WHERE UPPER(SCA.ABBNAME) = UPPER('Cameron Tabor')
SELECT *
  FROM SOMCONTACTADDRESS SCA
 WHERE 1=1
   AND UPPER(SCA.ABBNAME) = 'SKYCOMPUTE'
   and sca.zipcode = '3214'


SELECT * FROM RPMMT MT WHERE 1=1 AND EXISTS(
SELECT * FROM RPM_MT_CODE r where 1=1 and r.mtno like 'MT332%' and to_char(r.create_date,'yyyy') <> '2022'
AND R.COMPANYCODE = MT.COMPANYCODE
AND R.MTNO = MT.MTNO
)


SELECT *
  FROM RPM_MT_CODE r
 where 1 = 1
   and r.mtno like 'MT332%'
   and to_char(r.create_date, 'yyyy') <> '2022'
   AND NOT EXISTS (SELECT *
          FROM RPMMT MT
         WHERE 1 = 1
           AND R.COMPANYCODE = MT.COMPANYCODE
           AND R.MTNO = MT.MTNO)
           
           
 SELECT * FROM FIX_SETTING FS WHERE FS.KEY LIKE 'SOLUTION%';
  SELECT * FROM FIX_SETTING FS WHERE FS.KEY LIKE 'WORK%';
  
  HARVNSW167|Kurt|0298408800|HILLS HOMEMAKER CENT,CNR SHOWGROUND RD|VICTORIA AVE|CASTLE HILL|2154|NSW||FITBT|4973268|1|1||243e48d748e9|GG|not charging or turning on|NO GG, INGRAM STOCK, POP DD 260522. |TW7735|Y26310970|

SELECT count(0) ,ART.LOCAT_CODE ,ART.STATE , ART.SUBURB , ART.STREET_NAME , ART.STREET_NO  FROM EAI_AU_RPM_TEMP ART WHERE ART.STATE = 'NSW' AND ART.POSTCODE = '2250'  group by ART.LOCAT_CODE ,ART.STATE , ART.SUBURB , ART.STREET_NAME,ART.STREET_NO
--AND ART.SUBURB = 'BERRIMAH' AND ART.STREET_NO = '644'  and ART.CUSTOMER_ABB_NAME = 'HARVNT190'



