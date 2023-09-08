位址:twpy.synnex-grp.com    連接:8080

SQL 時間格式

TO_DATE('041919 12:24:20','mmddyy hh24:mi:ss') 

kaorichu/aeruyouni

----------------------- 登入ERP步驟---------------------------
<登入入口>
EX. 本機
http://localhost:7001/cg
EX. CN_SIT
http://192.168.209.66:9100/cg/Login.jsp 

user    : host7001
password: 956i613

<流程>
-->	Login.jsp --> erp_menu.jsp --> index_pom_main.jsp

-->登入畫面-->erp模組-->功能入口


1.新增 SCSEMPDATA 註冊員工資料(姓名、員工編號、帳號、密碼、PWD等等...)

2.新增 SCSEMPTODEPT 註冊員工公司與部門

3.新增 SCSEMPTOOBJECT 註冊功能入口權限


-- Javascript

j$.fn.extend({attr:function(name,value) { return jQuery.access( this, jQuery.prop, name, value, arguments.length > 1 );}});


----------------------- 登入ERP結束---------------------------
B2B WMS

wmspartner/1qaz@WSX


曉玫PROD帳號
3489/3489real


常用連結:

M:\1.1-Taipei(台北)\15-公用區\Training\新人訓練\3.培訓教材


CVS
宜婷:sallyts
密碼:123456789
裕璋
密碼:jack91138

暐學
密碼:wei1016

我的帳號:jisongxu		
我的密碼:t0977523991

19/04/08 

我的帳號:jisongxu		
我的密碼:t0977523991

cg_domains
帳號:123456789	
密碼:tw0977523991

cg_domains02
帳號:123456789	
密碼:tw0977523991

cnwt3
fisadm123/p@sswOrd

tbs_domains
帳號:123456789	
密碼:tw0977523991

mulitWar_domains
帳號:123456789	
密碼:123456789


TBS_TW_UAT 連線資訊
jdbc:oracle:thin:@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=twdb08sip.synnex-grp.com)(PORT=1521))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=TWDBS3)))
(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=twdb08sip.synnex-grp.com)(PORT = 1521))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=TWFIS3)))
#################### 查找UAT 的LOG###############################

TBS_TW_UAT
FTP 資訊
主機: 192.168.208.186
使用者名稱:mbs
twmbsdmn/log 複製到桌面再開啟

####################USEFUL TABLE##################################
QUERY THE EMP_NO WHO CAN LOGIN SIT

SELECT * FROM SCSEMPDATA  <--可登入人員

SELECT * FROM Mst_Business_Rule		<--Business Rule

SELECT * FROM RPMPROCESSCODE <-- 進成

*----------------ProcessCode-------------*
PROCESSCODE 1  = 預約
PROCESSCODE 2  = 收件
PROCESSCODE 3  = 預約
PROCESSCODE 4  = 報價
PROCESSCODE 5  = 報確
PROCESSCODE 6  = 領料
PROCESSCODE 7  = 發料
PROCESSCODE 8  = 完修
PROCESSCODE 9  = 結單
PROCESSCODE C  = 結案
PROCESSCODE X  = 作廢
PROCESSCODE W  = 待取
*----------------ProcessCode-------------*

rpm.etai.pocessStatus0=預約未收件
rpm.etai.pocessStatus1=未報確
rpm.etai.pocessStatus10=已作廢
rpm.etai.pocessStatus2=未領料
rpm.etai.pocessStatus3=未完修
rpm.etai.pocessStatus4=未完修+未結單
rpm.etai.pocessStatus5=完修未結單
rpm.etai.pocessStatus6=報確完修未結單
rpm.etai.pocessStatus7=結單未送返
rpm.etai.pocessStatus8=未結案
rpm.etai.pocessStatus9=已結案


*---------------- 人資打卡 ----------------*
1    電簽補登
2    HRE匯入
3    HRE補登
4    卡鐘匯入
5    PC簽到
6    免刷匯入
7    APP打卡
8    TBS申請

*----------------jQuery-----------------*


*------- 連線資訊 Y211220 -------------
[MBS]
TBSREAD

#Y23/01/09
-- DBS ---
TW	DBSREAD	dbs5961hyn
	TCMREAD	dbs5962hyn
CBG	DBSREAD	dbs5963hyn
BC	DBSREAD	dbs5964hyn
CN	DBSREAD	dbs5965hyn
HK  DBSREAD	dbs5966hyn
AU	DBSREAD	dbs5967hyn
NZ	DBSREAD	dbs5968hyn

-- TBS ---
TW TBSREAD	tbs3581kwt
TW QSSREAD	tbs3582kwt
BC TBSREAD	tbs3583kwt
CN TBSREAD	tbs3584kwt
HK TBSREAD	tbs3585kwt
AU TBSREAD	tbs3586kwt
NZ TBSREAD	tbs3587kwt
MBSSL MBSREAD	read4785mbs
---- LBS ----
TW LBSREAD	lbs3531wen
CN LBSREAD	lbs3532wen
AU LBSREAD	lbs3533wen
NZ LBSREAD	lbs3534wen
---- 元件 ----
CBGREAD	noVrd6430cbg
LBGREAD	noVrd9430lbg
FISREAD	noVrd6380fis
---- FBS ----
AUFIS_PROD2??FISREAD?fis6296ywb
CNFIS_PROD5??FISREAD?fis6295ywb
NZFIS_PROD2??FISREAD?fis6297ywb
TWFIS_PROD5  FISREAD fis6293ywb
TWBCF_PROD2  FISREAD fis6294ywb




*-------------- LBS APP 主機設定 ----------------*

mbsuat.synnex-grp.com
80
/TBS/

PP 連線
*-------------- WEB METHOD ---------------------*
# UAT
http://b2buat2.synnex-grp.com:8585/meta/default/wm_xt_fabricfolder/0000005187?t=1642557730128
帳號：Developer
密碼：@WSX3edc

# PROD
http://b2b2.synnex-grp.com:8585/
帳號：wmspartner
密碼：1qaz@WSX

*------------- 清除暫存 ------------------------*
CG : /servlet/CommonServlet?cleanMap=Y

MIS 處理中，請稍後。
MIS ?理中，?稍后。
MIS is checking this issue, please hold on.

*-------------- 藍新 ----------------------------*
藍新測試URL：https://cwww.newebpay.com/main/login_center/single_login

統編：69568009 (服務站)/52366042(LK)
帳號：a12345678
密碼：a1234567

7759-張百騏

*------------- APP載點 ----------------------------*
-- 非CN
https://app-fix.synnex-grp.com/app/
-- CN 
https://app-fix.synnex.com.cn:9100/app1/


*------------- Version check ----------------------*

https://tbsmuat.synnex-grp.com:4443/TBS_V/version_checker.jsp