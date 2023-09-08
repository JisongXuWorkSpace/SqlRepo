select mst.headcode, --主檔編號
       mst.company, --公司
       gsc.guarantystatusdesc, --擔保種類名稱
       mst.guaranty_Status, --擔保種類
       mst.guaranty_Number, --擔保品編號
       mst.guaranty_Company, --被擔保公司
       --關聯客戶
       cg.groupname, --關聯客戶簡稱
       mst.groupcode, --關聯客戶編號
       --客戶主檔
       cm.customerMabbName, --客戶主檔簡稱
       mst.customerMcode, --客戶主檔編號
       
       mst.guarantyamt, --擔保金額(元)
       mst.currency, --幣別
       mst.guaranty_sign_date, --擔保簽約日
       mst.guaranty_due_date, --擔保到期日
       --Y160602 修改 , 查詢員編加公司, 查無資料則只用員編查詢, 仍查無資料則顯示員編
       decode(emp.empname,
              NULL,
              decode(emp2.empname, NULL, mst.update_empno, emp2.empname),
              emp.empname), --維護人
       mst.create_date, --建檔日
       ags.guaranty_situation as situation, --擔保狀態
       mst.guaranty_situation as situationCode, --擔保狀態代碼
       mst.update_date, --維護日
       gsc.lineno,
       ags.lineno,
       --關聯客戶
       sg.buarea, ----Y150703元件轉型
       --客戶主檔
       cm.buarea, ----Y150703元件轉型
       mst.remark, --備註
       sfr.headcode as upLoad --上傳檔案
  from Arm_Cust_Guaranty_Mst  mst,
       SomGuarantyStatusCode  gsc,
       Arm_Guaranty_Situation ags,
       --客戶角度
       --關聯客戶
       Somgroup                  cg,
       somgroupcreditpaymentterm sg, ----Y150703元件轉型
       --客戶主檔
       Som_Customer_Master cm,
       --Y160602 ADD , 查詢員工資料只關聯員編, 避免同員編多公司而產生多筆, 加上 distinct empno, empname
       Scsempdata emp,
       (select distinct empno, empname from scsempdata) emp2,
       (select b.CUSTOMERMCODE, b.headcode, b.prop_id
          FROM som_doc_upLoad b
         WHERE type = 'B') sfr
where 1 = 1
      --業主
   and mst.prop_Id = :propId
      --擔保品編號
   and mst.guaranty_Number = :guarantyNumber
      --擔保種類
   and mst.guaranty_Status = :guarantyStatus
      --客戶角度
      --關聯客戶
   and mst.groupcode = :groupCode --客戶編號
   and mst.groupcode is not null
   and mst.groupcode <> 0
   and mst.groupcode = cg.groupcode(+)
   and mst.prop_id = cg.prop_id(+) --Y150703元件轉型
   and mst.groupcode = sg.groupcode(+) --Y150703元件轉型
   and mst.prop_id = sg.prop_id(+) --Y150703元件轉型
      --客戶主檔
   and mst.customerMcode = :customerMcode --客戶編號
   and mst.customerMcode is not null
   and mst.customerMcode <> '0' --客戶型態轉換 
   and mst.customerMcode = cm.customerMcode(+)
   and mst.prop_id = cm.prop_id(+) --Y150703元件轉型
      
   and mst.guaranty_Status = gsc.guarantystatus
   and mst.guaranty_situation = ags.guaranty_situation_code
   and ags.guaranty_situation_type = 'H'
   and mst.update_company = emp.companycode(+)
   and mst.update_Empno = emp.empno(+)
      --Y160602 修改 , 一個scsempdata關聯員編和公司, 一個只關聯員編
   and mst.update_empno = emp2.empno(+)
   and mst.prop_id = gsc.prop_id(+) --擔保
  and mst.customermcode = sfr.CUSTOMERMCODE(+)
   and mst.headcode = sfr.headcode(+)
   and mst.prop_id = b.prop_id(+)
group by mst.headcode,
          mst.company,
          guarantystatusdesc,
          mst.guaranty_Status,
          mst.guaranty_Number,
          mst.guaranty_Company,
          --關聯客戶  
          cg.groupname,
          mst.groupcode,
          --客戶主檔
          cm.customerMabbName,
          mst.customerMcode,
          
          mst.guarantyamt,
          mst.currency,
          mst.guaranty_sign_date,
          mst.guaranty_due_date,
          --Y160602 修改 , 查詢員編加公司, 查無資料則只用員編查詢, 仍查無資料則顯示員編
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
          --關聯客戶  
          sg.buarea, --Y150703元件轉型
          --客戶主檔
          cm.buarea, --Y150703元件轉型
          
          mst.remark,
          sfr.headcode
order by gsc.lineno, --擔保種類
          ags.lineno, --擔保狀態
          mst.guaranty_sign_date --擔保簽約日
