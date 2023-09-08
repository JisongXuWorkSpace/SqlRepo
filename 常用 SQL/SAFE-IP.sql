/* SAFE-IP */

 select * from mst_table_mapping
 WHERE 1=1
 and table_name = 'COMMON-SERVLET'
 and table_field = 'SAFE-IP'
 AND TABLE_FIELD_VALUE LIKE '%¦NªQ%' FOR UPDATE

-- 192.168.205.70
