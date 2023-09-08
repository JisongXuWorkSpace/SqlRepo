-- JGME新增 新增
select *
  from arm_draft_letter dl
 where 1 = 1
   and dl.Prop_Id = '3'
   and dl.COMPANY = '20'
   and dl.Customermcode = '22112'
   and dl.HeadCode = '201906171043226098'
   and dl.Guarantor = '聯強國際'
   and dl.Legal_Agent is null
   and dl.Abnnumber = '11111777'
   and dl.Idnumber is null
   and dl.Birthdate is null
   and dl.Register_Address = '台北市中山區市民大道三段248號'
   and dl.Telnumber is null
   and dl.Guarantor_Relation = 'g'
   and dl.Related_Customer is null
   and dl.Witness = '556'
   and dl.Asset_Certificate is null
