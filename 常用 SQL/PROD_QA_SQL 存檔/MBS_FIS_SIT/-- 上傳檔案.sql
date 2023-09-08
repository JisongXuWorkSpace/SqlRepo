select mst.headcode, --�D�ɽs��
       mst.company, --���q
       gsc.guarantystatusdesc, --��O�����W��
       mst.guaranty_Status, --��O����
       mst.guaranty_Number, --��O�~�s��
       mst.guaranty_Company, --�Q��O���q
       --���p�Ȥ�
       cg.groupname, --���p�Ȥ�²��
       mst.groupcode, --���p�Ȥ�s��
       --�Ȥ�D��
       cm.customerMabbName, --�Ȥ�D��²��
       mst.customerMcode, --�Ȥ�D�ɽs��
       
       mst.guarantyamt, --��O���B(��)
       mst.currency, --���O
       mst.guaranty_sign_date, --��Oñ����
       mst.guaranty_due_date, --��O�����
       --Y160602 �ק� , �d�߭��s�[���q, �d�L��ƫh�u�έ��s�d��, ���d�L��ƫh��ܭ��s
       decode(emp.empname,
              NULL,
              decode(emp2.empname, NULL, mst.update_empno, emp2.empname),
              emp.empname), --���@�H
       mst.create_date, --���ɤ�
       ags.guaranty_situation as situation, --��O���A
       mst.guaranty_situation as situationCode, --��O���A�N�X
       mst.update_date, --���@��
       gsc.lineno,
       ags.lineno,
       --���p�Ȥ�
       sg.buarea, ----Y150703�����૬
       --�Ȥ�D��
       cm.buarea, ----Y150703�����૬
       mst.remark, --�Ƶ�
       sfr.headcode as upLoad --�W���ɮ�
  from Arm_Cust_Guaranty_Mst  mst,
       SomGuarantyStatusCode  gsc,
       Arm_Guaranty_Situation ags,
       --�Ȥᨤ��
       --���p�Ȥ�
       Somgroup                  cg,
       somgroupcreditpaymentterm sg, ----Y150703�����૬
       --�Ȥ�D��
       Som_Customer_Master cm,
       --Y160602 ADD , �d�߭��u��ƥu���p���s, �קK�P���s�h���q�Ӳ��ͦh��, �[�W distinct empno, empname
       Scsempdata emp,
       (select distinct empno, empname from scsempdata) emp2,
       (select b.CUSTOMERMCODE, b.headcode, b.prop_id
          FROM som_doc_upLoad b
         WHERE type = 'B') sfr
where 1 = 1
      --�~�D
   and mst.prop_Id = :propId
      --��O�~�s��
   and mst.guaranty_Number = :guarantyNumber
      --��O����
   and mst.guaranty_Status = :guarantyStatus
      --�Ȥᨤ��
      --���p�Ȥ�
   and mst.groupcode = :groupCode --�Ȥ�s��
   and mst.groupcode is not null
   and mst.groupcode <> 0
   and mst.groupcode = cg.groupcode(+)
   and mst.prop_id = cg.prop_id(+) --Y150703�����૬
   and mst.groupcode = sg.groupcode(+) --Y150703�����૬
   and mst.prop_id = sg.prop_id(+) --Y150703�����૬
      --�Ȥ�D��
   and mst.customerMcode = :customerMcode --�Ȥ�s��
   and mst.customerMcode is not null
   and mst.customerMcode <> '0' --�Ȥ᫬�A�ഫ 
   and mst.customerMcode = cm.customerMcode(+)
   and mst.prop_id = cm.prop_id(+) --Y150703�����૬
      
   and mst.guaranty_Status = gsc.guarantystatus
   and mst.guaranty_situation = ags.guaranty_situation_code
   and ags.guaranty_situation_type = 'H'
   and mst.update_company = emp.companycode(+)
   and mst.update_Empno = emp.empno(+)
      --Y160602 �ק� , �@��scsempdata���p���s�M���q, �@�ӥu���p���s
   and mst.update_empno = emp2.empno(+)
   and mst.prop_id = gsc.prop_id(+) --��O
  and mst.customermcode = sfr.CUSTOMERMCODE(+)
   and mst.headcode = sfr.headcode(+)
   and mst.prop_id = b.prop_id(+)
group by mst.headcode,
          mst.company,
          guarantystatusdesc,
          mst.guaranty_Status,
          mst.guaranty_Number,
          mst.guaranty_Company,
          --���p�Ȥ�  
          cg.groupname,
          mst.groupcode,
          --�Ȥ�D��
          cm.customerMabbName,
          mst.customerMcode,
          
          mst.guarantyamt,
          mst.currency,
          mst.guaranty_sign_date,
          mst.guaranty_due_date,
          --Y160602 �ק� , �d�߭��s�[���q, �d�L��ƫh�u�έ��s�d��, ���d�L��ƫh��ܭ��s
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
          --���p�Ȥ�  
          sg.buarea, --Y150703�����૬
          --�Ȥ�D��
          cm.buarea, --Y150703�����૬
          
          mst.remark,
          sfr.headcode
order by gsc.lineno, --��O����
          ags.lineno, --��O���A
          mst.guaranty_sign_date --��Oñ����
