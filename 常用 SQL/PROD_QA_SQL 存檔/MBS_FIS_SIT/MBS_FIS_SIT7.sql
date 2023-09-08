-- JGME ºûÅ@ «È¤á¥DÀÉ

select mst.headcode,
       mst.company,
       gsc.guarantystatusdesc,
       mst.guaranty_Status,
       mst.guaranty_Number,
       mst.guaranty_Company,
       cm.customerMabbName,
       mst.customerMcode,
       mst.guarantyamt,
       mst.currency,
       mst.guaranty_sign_date,
       mst.guaranty_due_date,
       decode(emp.empname,
              NULL,
              decode(emp2.empname, NULL, mst.update_empno, emp2.empname),
              emp.empname),
       mst.create_date,
       ags.guaranty_situation as situation,
       mst.guaranty_situation as situationCode,
       mst.update_date,
       gsc.lineno,
       ags.lineno,
       cm.buarea,
       mst.remark,
       sfr.headcode as Upload
  from Arm_Cust_Guaranty_Mst mst,
       SomGuarantyStatusCode gsc,
       Arm_Guaranty_Situation ags,
       Som_Customer_Master cm,
       Scsempdata emp,
       (select distinct empno, empname from scsempdata) emp2,
       (SELECT b.customermcode, b.headcode, b.prop_id
          FROM som_doc_upload b
         WHERE 1 = 1
           AND b.type = 'B') sfr
 where 1 = 1
   and mst.prop_Id = '3'
   and mst.customerMcode = '21121'
   and mst.customerMcode is not null
   and mst.customerMcode <> '0'
   and mst.customerMcode = cm.customerMcode(+)
   and mst.prop_id = cm.prop_id(+)
   and mst.guaranty_Status = gsc.guarantystatus
   and mst.guaranty_situation = ags.guaranty_situation_code
   and ags.guaranty_situation_type = 'H'
   and mst.update_company = emp.companycode(+)
   and mst.update_Empno = emp.empno(+)
   and mst.update_empno = emp2.empno(+)
   and mst.prop_id = gsc.prop_id(+)
   and mst.customermcode = sfr.customermcode(+)
   and mst.headcode = sfr.headcode(+)
   and mst.prop_id = sfr.prop_id(+)
 group by mst.headcode,
          mst.company,
          guarantystatusdesc,
          mst.guaranty_Status,
          mst.guaranty_Number,
          mst.guaranty_Company,
          cm.customerMabbName,
          mst.customerMcode,
          mst.guarantyamt,
          mst.currency,
          mst.guaranty_sign_date,
          mst.guaranty_due_date,
          decode(emp.empname,
                 NULL,
                 decode(emp2.empname, NULL, mst.update_empno, emp2.empname),
                 emp.empname),
          mst.create_date,
          ags.guaranty_situation,
          mst.guaranty_situation,
          mst.update_date,
          gsc.lineno,
          ags.lineno,
          cm.buarea,
          mst.remark,
          sfr.headcode
 order by gsc.lineno, ags.lineno, mst.guaranty_sign_date
