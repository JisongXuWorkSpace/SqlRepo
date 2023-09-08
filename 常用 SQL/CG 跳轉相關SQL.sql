SELECT * FROM SCSOBJECT WHERE OBJECTCODE='M_FXAI'

SysTtbsAction.do?servletKey=M_FXAI

-- 方法
SELECT * FROM MST_TABLE_MAPPING WHERE TABLE_NAME='COMMON-SERVLET' AND  TABLE_FIELD='M_FXAI'
-- 主機ip
SELECT * FROM MST_TABLE_MAPPING WHERE TABLE_NAME='COMMON-SERVLET' AND  TABLE_FIELD='SAFE-IP' and table_field_value='TBS'

select                           
a.table_field funcname,                       
a.table_field_remark funcurl,
b.table_field_value,
b.table_field    ,             
b.table_field_remark ip,                      
d.table_field_remark messageurl               
from mst_table_mapping a,                     
mst_table_mapping b,                          
mst_table_mapping d                           
where a.table_name = b.table_name             
and a.table_field_value = b.table_field_value 
and a.table_name = d.table_name               
and a.table_field_value = d.table_field_value 
and a.table_name = 'COMMON-SERVLET'           
and a.table_field not in                      
('SAFE-IP','SAFE-IP-PORT','MESSAGEID-URL')    
and b.table_field = 'SAFE-IP'                 
and d.table_field = 'MESSAGEID-URL'  
       

