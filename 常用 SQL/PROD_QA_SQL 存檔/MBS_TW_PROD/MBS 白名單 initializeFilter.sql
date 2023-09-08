-- MBS 白名單  initializeFilter 

SELECT * FROM MST_TABLE_MAPPING WHERE 1=1 AND TABLE_NAME='COMMON-SERVLET' and TABLE_FIELD='SAFE-IP'


SELECT * FROM SYS_AUTOMATIC_CHECK where check_name like '%[SHARP_EDI] 夏普未維護掛號(案件未傳)%'

	
[SHARP_EDI] 夏普未維護掛號(案件未傳)

select distinct mt.companycode     as 公司,
                mt.registerno      as 掛號,
                mt.mtno            as MT單號,
                mt.customerabbname as 客戶簡稱,
                mt.mttime          as 報修時間,
                rg.vendorno        as 客戶送修單號,
                decode(vendorno, null, '案件未傳') as 狀態
  from rpmmt mt, rpmrg rg, mstarticle ma, mstscscode cs
 where 1 = 1
   and mt.itemno = ma.itemno
   and cs.scscode = ma.scscode
   and mt.companycode = rg.companycode
   and mt.registerno = rg.registerno
   and mt.companycode = '20'
   and ma.brandcode in ('SHARP')
   and cs.mcscode not in ('HH', 'C0')
   and mt.servicetypecode not in ('5')
   AND (MA.Description1 not like '%INFOC%' or MA.Description1 is null)
   AND (MA.Description2 not like '%INFOC%' or MA.Description2 is null)
   AND (MA.Description3 not like '%INFOC%' or MA.Description3 is null)
   and mt.update_time<(sysdate- 1/24) and to_char(mt.update_time,'MM')=to_char(sysdate,'MM')
   and mt.processcode not in ('C','X')
   and rg.vendorno is null
