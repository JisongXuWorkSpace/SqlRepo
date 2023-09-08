SELECT * FROM TBS_MAJ.FIX_LEASE_ORDER LO WHERE LO.SLIP_NO = 'S200527045' ;
SELECT * FROM TBS_MAJ.DEV_PICK_UP_DETAIL PUD WHERE pud.slip_no = 'S200527045';


SELECT p.pick_up_address,p.pick_up_zipcode,p.* FROM TBS_MAJ.DEV_PICK_UP_HEAD p where p.company_code='B0' and p.ri_no='RIV006M206';

SELECT e.transmit_flag,e.pick_from_address,e.* FROM DBS_MAJ.eai_take_back_master e where 1=1 and e.company_code='B0' and e.slip_no='RIV006M206';

update TBS_MAJ.DEV_PICK_UP_HEAD p set p.pick_up_address='106台北市大安區建國南路一段237號3樓',p.pick_up_zipcode='106'  where p.company_code='B0' and p.ri_no='RIV006M206';
update DBS_MAJ.eai_take_back_master e set e.transmit_flag='O', e.pick_from_address='106台北市大安區建國南路一段237號3樓' where 1=1 and e.company_code='B0' and e.slip_no='RIV006M206';


SELECT * FROM eai_take_back_detail e where 1=1 and e.slip_no='RI20060099';--LNB02A-000092
106台北市大安區建國南路一段237號3樓
