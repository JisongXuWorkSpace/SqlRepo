-- TW 維修OB調整OS補傳至LBS

SELECT MT.RETURNTYPECODE,MT.REGISTERNO FROM RPMMT MT WHERE MTNO IN ('MT4W101860', 'MT4W101861', 'MT4W101862');
SELECT RG.GETBACKTYPECODE , RG.RI_TRANSMIT_FLAG FROM RPMRG RG  WHERE   REGISTERNO IN ('10098304','10098308','10098309');

-- DCM
UPDATE DBS_MAJ.RPMMT MT SET MT.RETURNTYPECODE = 'B' WHERE MTNO IN ('MT4W101860', 'MT4W101861', 'MT4W101862');
UPDATE DBS_MAJ.RPMRG RG SET RG.GETBACKTYPECODE = 'B' , RG.RI_TRANSMIT_FLAG = 'N'  WHERE   REGISTERNO IN ('10098304','10098308','10098309');
-- 取件主檔 驗證
SELECT * FROM EAI_TAKE_BACK_MASTER TB WHERE TB.SLIP_NO IN ('MT4W101860', 'MT4W101861', 'MT4W101862');
