-- ®w¦s¤ñ¹ï



--LBS 

select * from stm_storage_transaction where article_id='7J972' and warehouse_name='LKA101' and stock_character_code='A' order by trans_date desc;
select * from stm_storage_transaction where article_id='7J974' and warehouse_name='LKA101' and stock_character_code='A' order by trans_date desc;
select * from stm_location_qty where article_id='7J972';


--DBS

SELECT * FROM eai_receipt_queue_master rq where rq.Slip_No LIKE 'LRPA2105%'
select * from ivcgodowncostlog where vouno='R-66209926';
