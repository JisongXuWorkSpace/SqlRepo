��}:twpy.synnex-grp.com    �s��:8080

SQL �ɶ��榡

TO_DATE('041919 12:24:20','mmddyy hh24:mi:ss') 

kaorichu/aeruyouni

----------------------- �n�JERP�B�J---------------------------
<�n�J�J�f>
EX. ����
http://localhost:7001/cg
EX. CN_SIT
http://192.168.209.66:9100/cg/Login.jsp 

user    : host7001
password: 956i613

<�y�{>
-->	Login.jsp --> erp_menu.jsp --> index_pom_main.jsp

-->�n�J�e��-->erp�Ҳ�-->�\��J�f


1.�s�W SCSEMPDATA ���U���u���(�m�W�B���u�s���B�b���B�K�X�BPWD����...)

2.�s�W SCSEMPTODEPT ���U���u���q�P����

3.�s�W SCSEMPTOOBJECT ���U�\��J�f�v��


-- Javascript

j$.fn.extend({attr:function(name,value) { return jQuery.access( this, jQuery.prop, name, value, arguments.length > 1 );}});


----------------------- �n�JERP����---------------------------
B2B WMS

wmspartner/1qaz@WSX


�媴PROD�b��
3489/3489real


�`�γs��:

M:\1.1-Taipei(�x�_)\15-���ΰ�\Training\�s�H�V�m\3.���V�Ч�


CVS
�y�@:sallyts
�K�X:123456789
�μ�
�K�X:jack91138

�¾�
�K�X:wei1016

�ڪ��b��:jisongxu		
�ڪ��K�X:t0977523991

19/04/08 

�ڪ��b��:jisongxu		
�ڪ��K�X:t0977523991

cg_domains
�b��:123456789	
�K�X:tw0977523991

cg_domains02
�b��:123456789	
�K�X:tw0977523991

cnwt3
fisadm123/p@sswOrd

tbs_domains
�b��:123456789	
�K�X:tw0977523991

mulitWar_domains
�b��:123456789	
�K�X:123456789


TBS_TW_UAT �s�u��T
jdbc:oracle:thin:@(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=twdb08sip.synnex-grp.com)(PORT=1521))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=TWDBS3)))
(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=twdb08sip.synnex-grp.com)(PORT = 1521))(CONNECT_DATA=(SERVER=DEDICATED)(SERVICE_NAME=TWFIS3)))
#################### �d��UAT ��LOG###############################

TBS_TW_UAT
FTP ��T
�D��: 192.168.208.186
�ϥΪ̦W��:mbs
twmbsdmn/log �ƻs��ୱ�A�}��

####################USEFUL TABLE##################################
QUERY THE EMP_NO WHO CAN LOGIN SIT

SELECT * FROM SCSEMPDATA  <--�i�n�J�H��

SELECT * FROM Mst_Business_Rule		<--Business Rule

SELECT * FROM RPMPROCESSCODE <-- �i��

*----------------ProcessCode-------------*
PROCESSCODE 1  = �w��
PROCESSCODE 2  = ����
PROCESSCODE 3  = �w��
PROCESSCODE 4  = ����
PROCESSCODE 5  = ���T
PROCESSCODE 6  = ���
PROCESSCODE 7  = �o��
PROCESSCODE 8  = ����
PROCESSCODE 9  = ����
PROCESSCODE C  = ����
PROCESSCODE X  = �@�o
PROCESSCODE W  = �ݨ�
*----------------ProcessCode-------------*

rpm.etai.pocessStatus0=�w��������
rpm.etai.pocessStatus1=�����T
rpm.etai.pocessStatus10=�w�@�o
rpm.etai.pocessStatus2=�����
rpm.etai.pocessStatus3=������
rpm.etai.pocessStatus4=������+������
rpm.etai.pocessStatus5=���ץ�����
rpm.etai.pocessStatus6=���T���ץ�����
rpm.etai.pocessStatus7=���楼�e��
rpm.etai.pocessStatus8=������
rpm.etai.pocessStatus9=�w����


*---------------- �H�ꥴ�d ----------------*
1    �qñ�ɵn
2    HRE�פJ
3    HRE�ɵn
4    �d���פJ
5    PCñ��
6    �K��פJ
7    APP���d
8    TBS�ӽ�

*----------------jQuery-----------------*


*------- �s�u��T Y211220 -------------
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
---- ���� ----
CBGREAD	noVrd6430cbg
LBGREAD	noVrd9430lbg
FISREAD	noVrd6380fis
---- FBS ----
AUFIS_PROD2??FISREAD?fis6296ywb
CNFIS_PROD5??FISREAD?fis6295ywb
NZFIS_PROD2??FISREAD?fis6297ywb
TWFIS_PROD5  FISREAD fis6293ywb
TWBCF_PROD2  FISREAD fis6294ywb




*-------------- LBS APP �D���]�w ----------------*

mbsuat.synnex-grp.com
80
/TBS/

PP �s�u
*-------------- WEB METHOD ---------------------*
# UAT
http://b2buat2.synnex-grp.com:8585/meta/default/wm_xt_fabricfolder/0000005187?t=1642557730128
�b���GDeveloper
�K�X�G@WSX3edc

# PROD
http://b2b2.synnex-grp.com:8585/
�b���Gwmspartner
�K�X�G1qaz@WSX

*------------- �M���Ȧs ------------------------*
CG : /servlet/CommonServlet?cleanMap=Y

MIS �B�z���A�еy��C
MIS ?�z���A?�y�Z�C
MIS is checking this issue, please hold on.

*-------------- �ŷs ----------------------------*
�ŷs����URL�Ghttps://cwww.newebpay.com/main/login_center/single_login

�νs�G69568009 (�A�ȯ�)/52366042(LK)
�b���Ga12345678
�K�X�Ga1234567

7759-�i���

*------------- APP���I ----------------------------*
-- �DCN
https://app-fix.synnex-grp.com/app/
-- CN 
https://app-fix.synnex.com.cn:9100/app1/


*------------- Version check ----------------------*

https://tbsmuat.synnex-grp.com:4443/TBS_V/version_checker.jsp