-- MBS �զW��  initializeFilter 

SELECT * FROM MST_TABLE_MAPPING WHERE 1=1 AND TABLE_NAME='COMMON-SERVLET' and TABLE_FIELD='SAFE-IP'


SELECT * FROM SYS_AUTOMATIC_CHECK where check_name like '%[SHARP_EDI] �L�������@����(�ץ󥼶�)%'

	
[SHARP_EDI] �L�������@����(�ץ󥼶�)

select distinct mt.companycode     as ���q,
                mt.registerno      as ����,
                mt.mtno            as MT�渹,
                mt.customerabbname as �Ȥ�²��,
                mt.mttime          as ���׮ɶ�,
                rg.vendorno        as �Ȥ�e�׳渹,
                decode(vendorno, null, '�ץ󥼶�') as ���A
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
