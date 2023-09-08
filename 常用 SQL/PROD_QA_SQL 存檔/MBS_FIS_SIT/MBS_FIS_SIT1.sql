 select mst.COMPANY,
        gsc.Guarantystatusdesc,
        mst.GUARANTY_NUMBER,
        mst.GUARANTY_COMPANY,
        cm.customermabbname,
        mst.GUARANTYAMT,
        mst.CURRENCY,
        mst.GUARANTY_SIGN_DATE,
        mst.GUARANTY_DUE_DATE,
        decode(emp.empname,
               NULL,
               decode(emp2.empname, NULL, mst.create_empno, emp2.empname),
               emp.empname),
        mst.CREATE_DATE,
        cm.buarea,
        mst.Remark,
        sfr.head_code as Upload,
        mst.headcode
   from Arm_Cust_Guaranty_Mst mst,
        SomGuarantyStatusCode gsc,
        som_customer_master cm,
        scsempdata emp,
        (select distinct empno, empname from scsempdata) emp2,
        (SELECT b.customermcode, b.head_code, b.prop_id
           FROM som_doc_upload b
          WHERE 1 = 1
            AND b.type = 'B') sfr
  where 1 = 1
    and mst.prop_Id = '3'
    and mst.headcode in ('201906201108416892','201906201123255641')
    and mst.company = '20'
    and mst.create_Empno = '5153'
    and mst.create_date >= to_date('20190620', 'YYYYMMDD')
    and mst.customerMcode = cm.customerMcode(+)
    and mst.prop_id = cm.prop_id(+)
    and mst.GUARANTY_STATUS = gsc.guarantystatus(+)
    and mst.prop_id = gsc.prop_id(+)
    and mst.company = emp.companycode(+)
    and mst.create_Empno = emp.empno(+)
    and mst.create_empno = emp2.empno(+)
    and mst.customermcode = sfr.customermcode(+)
    and mst.headcode = sfr.head_code(+)
    and mst.prop_id = sfr.prop_id(+)
  order by mst.headcode


select * from som_doc_upload
select * from som_doc_type

SELECT * FROM SOM_CUSTOMER_MASTER

SELECT * FROM SOMGROUPCREDITPAYMENTTERM
SELECT * FROM ARM_CUST_GUARANTY_MST


select * from armbuareaprinciple
