-- MBS 最適合料品折數

select sla_seq_no, chk_order, check_level, sla_field1, sla_field2 --
  from ( --
        select sla_seq_no,
                check_level,
                sla_field1,
                sla_field2, --
                row_number() over(partition by sla_seq_no  order by sla_seq_no,to_number(check_level) ) as chk_order --
          from ( 
                 
                 select '1' as check_level, -- 1.客戶簡稱
                         sla.sla_seq_no,
                         sla.sla_field1,
                         sla.sla_field2 --
                   from DBS_MAJ.rpm_article_sla sla,
                         DBS_MAJ.mstarticle      ma,
                         DBS_MAJ.mstscscode      ms --
                  where sla.SLA_TYPE = '29' --
                    and ma.scscode = ms.scscode --
                    and sla.country in ('*', '*') --
                    and sla.companycode in ('*', '*') --
                    and sla.l_cs_code in ('*', ms.lcscode) --
                    and sla.m_cs_code in ('*', ms.mcscode) --
                    and sla.s_cs_code in ('*', ms.scscode) --
                    and sla.brand_code in ('*', ma.brandcode) --
                    and sla.production_no in ('*' , ma.productionno)
                    and sla.article_no in ('*', ma.articleno) --//料號
                    and ma.itemno = 'JP065' --
                    and sla.sla_field2 in ('*', '62') --
                    and sla.sla_field1 = '上海茂立实业' --
                 union
                 select '2' as check_level, --                                                    -- 2. 客戶模式 salesModel
                        sla.sla_seq_no,
                        sla.sla_field1,
                        sla.sla_field2 --
                   from DBS_MAJ.rpm_article_sla sla,
                        DBS_MAJ.mstarticle      ma,
                        DBS_MAJ.mstscscode      ms --
                  where sla.SLA_TYPE = '29' --
                    and ma.scscode = ms.scscode --
                    and sla.country in ('*', '*') --
                    and sla.companycode in ('*', '*') --
                    and sla.l_cs_code in ('*', ms.lcscode) --
                    and sla.m_cs_code in ('*', ms.mcscode) --
                    and sla.s_cs_code in ('*', ms.scscode) --
                    and sla.brand_code in ('*', ma.brandcode) --
                    and sla.production_no in ('*' , ma.productionno)
                    and sla.article_no in ('*', ma.articleno) --//料號
                    and ma.itemno = 'JP065' --
                    and sla.sla_field2 = '62' --
                    and sla.sla_field1 in ('*', '上海茂立实业') --
                    
                 union 
                 
                 
                 select '3' as check_level, --//3.料號    
                        sla.sla_seq_no,
                        sla.sla_field1,
                        sla.sla_field2 --
                   from DBS_MAJ.rpm_article_sla sla,
                        DBS_MAJ.mstarticle      ma,
                        DBS_MAJ.mstscscode      ms --
                  where sla.SLA_TYPE = '29' --
                    and ma.scscode = ms.scscode --
                    and sla.country in ('*', '*') --
                    and sla.companycode in ('*', '*') --
                    and sla.l_cs_code in ('*', ms.lcscode) --
                    and sla.m_cs_code in ('*', ms.mcscode) --
                    and sla.s_cs_code in ('*', ms.scscode) --
                    and sla.brand_code in ('*', ma.brandcode) --
                    and sla.production_no in ('*' , ma.productionno)
                    and sla.article_no = ma.articleno --//料號
                    and ma.itemno = 'JP065' --
                    and sla.sla_field2 in ('*', '62') --
                    and sla.sla_field1 in ('*', '上海茂立实业') --
                 union --
                select '4' as check_level, --//4.原廠料號    
                      sla.sla_seq_no,
                      sla.sla_field1,
                      sla.sla_field2 --
                 from DBS_MAJ.rpm_article_sla sla,
                      DBS_MAJ.mstarticle      ma,
                      DBS_MAJ.mstscscode      ms --
                where sla.SLA_TYPE = '29' --
                  and ma.scscode = ms.scscode --
                  and sla.country in ('*', '*') --
                  and sla.companycode in ('*', '*') --
                  and sla.l_cs_code in ('*', ms.lcscode) --
                  and sla.m_cs_code in ('*', ms.mcscode) --
                  and sla.s_cs_code in ('*', ms.scscode) --
                  and sla.brand_code in ('*', ma.brandcode) --
                  and sla.production_no = ma.productionno
                  and sla.article_no in ('*', ma.articleno) --//料號
                  and ma.itemno = 'JP065' --
                  and sla.sla_field2 in ('*', '62') --
                  and sla.sla_field1 in ('*', '上海茂立实业') --
                 union --
                 select '5' as check_level, --//5.廠牌 
                        sla.sla_seq_no,
                        sla.sla_field1,
                        sla.sla_field2 --
                   from DBS_MAJ.rpm_article_sla sla,
                        DBS_MAJ.mstarticle      ma,
                        DBS_MAJ.mstscscode      ms --
                  where sla.SLA_TYPE = '29' --
                    and ma.scscode = ms.scscode --
                    and sla.country in ('*', '*') --
                    and sla.companycode in ('*', '*') --
                    and sla.l_cs_code in ('*', ms.lcscode) --
                    and sla.m_cs_code in ('*', ms.mcscode) --
                    and sla.s_cs_code in ('*', ms.scscode) --
                    and sla.brand_code = ma.brandcode --
                    and sla.production_no in ('*' , ma.productionno)
                    and sla.article_no in ('*', ma.articleno) --//料號
                    and ma.itemno = 'JP065' --
                    and sla.sla_field2 in ('*', '62') --
                    and sla.sla_field1 in ('*', '上海茂立实业') --
                 union --
                 select '6' as check_level, --//6.小CS
                        sla.sla_seq_no,
                        sla.sla_field1,
                        sla.sla_field2 --
                   from DBS_MAJ.rpm_article_sla sla,
                        DBS_MAJ.mstarticle      ma,
                        DBS_MAJ.mstscscode      ms --
                  where sla.SLA_TYPE = '29' --
                    and ma.scscode = ms.scscode --
                    and sla.country in ('*', '*') --
                    and sla.companycode in ('*', '*') --
                    and sla.l_cs_code in ('*', ms.lcscode) --
                    and sla.m_cs_code in ('*', ms.mcscode) --
                    and sla.s_cs_code = ms.scscode --
                    and sla.brand_code in ('*', ma.brandcode) --
                    and sla.production_no in ('*' , ma.productionno)
                    and sla.article_no in ('*', ma.articleno) --//料號
                    and ma.itemno = 'JP065' --
                    and sla.sla_field2 in ('*', '62') --
                    and sla.sla_field1 in ('*', '上海茂立实业') --
                 union --
                 select '7' as check_level, --//7.中CS 
                        sla.sla_seq_no,
                        sla.sla_field1,
                        sla.sla_field2 --
                   from DBS_MAJ.rpm_article_sla sla,
                        DBS_MAJ.mstarticle      ma,
                        DBS_MAJ.mstscscode      ms --
                  where sla.SLA_TYPE = '29' --
                    and ma.scscode = ms.scscode --
                    and sla.country in ('*', '*') --
                    and sla.companycode in ('*', '*') --
                    and sla.l_cs_code in ('*', ms.lcscode) --
                    and sla.m_cs_code = ms.mcscode --
                    and sla.s_cs_code in ('*', ms.scscode) --
                    and sla.brand_code in ('*', ma.brandcode) --
                    and sla.production_no in ('*' , ma.productionno)
                    and sla.article_no in ('*', ma.articleno) --//料號
                    and ma.itemno = 'JP065' --
                    and sla.sla_field2 in ('*', '62') --
                    and sla.sla_field1 in ('*', '上海茂立实业') --
                 union --
                 select '8' as check_level, --//8.大CS
                        sla.sla_seq_no,
                        sla.sla_field1,
                        sla.sla_field2 --
                   from DBS_MAJ.rpm_article_sla sla,
                        DBS_MAJ.mstarticle      ma,
                        DBS_MAJ.mstscscode      ms --
                  where sla.SLA_TYPE = '29' --
                    and ma.scscode = ms.scscode --
                    and sla.country in ('*', '*') --
                    and sla.companycode in ('*', '*') --
                    and sla.l_cs_code = ms.lcscode --
                    and sla.m_cs_code in ('*', ms.mcscode) --
                    and sla.s_cs_code in ('*', ms.scscode) --
                    and sla.brand_code in ('*', ma.brandcode) --
                    and sla.production_no in ('*' , ma.productionno)
                    and sla.article_no in ('*', ma.articleno) --//料號
                    and ma.itemno = 'JP065' --
                    and sla.sla_field2 in ('*', '62') --
                    and sla.sla_field1 in ('*', '上海茂立实业') --
                 union --
                 select '9' as check_level, --//9.公司 
                        sla.sla_seq_no,
                        sla.sla_field1,
                        sla.sla_field2 --
                   from DBS_MAJ.rpm_article_sla sla,
                        DBS_MAJ.mstarticle      ma,
                        DBS_MAJ.mstscscode      ms --
                  where sla.SLA_TYPE = '29' --
                    and ma.scscode = ms.scscode --
                    and sla.country in ('*', '*') --
                    and sla.companycode = '*' --
                    and sla.l_cs_code in ('*', ms.lcscode) --
                    and sla.m_cs_code in ('*', ms.mcscode) --
                    and sla.s_cs_code in ('*', ms.scscode) --
                    and sla.brand_code in ('*', ma.brandcode) --
                    and sla.production_no in ('*' , ma.productionno)
                    and sla.article_no in ('*', ma.articleno) --//料號
                    and ma.itemno = 'JP065' --
                    and sla.sla_field2 in ('*', '62') --
                    and sla.sla_field1 in ('*', '上海茂立实业') --
                 union --
                 select '10' as check_level, --//10.地區
                        sla.sla_seq_no,
                        sla.sla_field1,
                        sla.sla_field2 --
                   from DBS_MAJ.rpm_article_sla sla,
                        DBS_MAJ.mstarticle      ma,
                        DBS_MAJ.mstscscode      ms --
                  where sla.SLA_TYPE = '29' --
                    and ma.scscode = ms.scscode --
                    and sla.country = '*' --
                    and sla.companycode in ('*', '*') --
                    and sla.l_cs_code in ('*', ms.lcscode) --
                    and sla.m_cs_code in ('*', ms.mcscode) --
                    and sla.s_cs_code in ('*', ms.scscode) --
                    and sla.brand_code in ('*', ma.brandcode) --
                    and sla.production_no in ('*' , ma.productionno)
                    and sla.article_no in ('*', ma.articleno) --//料號
                    and ma.itemno = 'JP065' --
                    and sla.sla_field2 in ('*', '62') --
                    and sla.sla_field1 in ('*', '上海茂立实业') --
                 
                 ) --
         group by sla_seq_no, check_level, sla_field1, sla_field2
         order by to_number(check_level) --
        ) 
 where chk_order = '1'
