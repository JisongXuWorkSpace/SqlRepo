select * from armbuareacompanycode
Select sdc.customermcode, sdc.head_code, sdc.prop_id
          FROM som_doc_upLoad sdc
         WHERE type = 'B'
         group by sdc.customermcode, sdc.head_code, sdc.prop_id
         
         
SELECT * FROM ARM_CUST_GUARANTY_MST
