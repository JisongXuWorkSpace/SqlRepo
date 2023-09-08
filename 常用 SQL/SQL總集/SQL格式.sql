
-- 時間格式 MMddyy

TO_DATE('011319','MMddyy') 

-- 時間格式 MMddyy hh24:mi:ss

TO_DATE('102616 13:18:24','MMddyy hh24:mi:ss')

-- DECODE 用法
DECODE([SELECT 欄位],[條件1],[欄位值等於條件1所要帶的值],[其他]);
DECODE([X],[IF],[=],[ELSE IF],[=],[ELSE]); --中間可帶多組條件


(+) 一個表個內的欄位都要

table Name = 'STORE_INFORMATION'			table Name = 'Geography'
Store_name 		Sale 	Txn_Date			Region_Name		Store_Name
----------------------------------			------------------------------
Los Angeles 	1500	05-Jan-1999			East			Boston
San Diego		250		07-Jan-1999			East			New York
Los Angeles		300		08-Jan-1999			West			Los Angeles
Boston			700		08-Jan-1999			West			San Diego

Select A1.Store_Name , SUM(A2.Sales)Sales
From Geography A1 , Store_Information A2
Where A1.Store_Name = A2.Store_name(+)
Group By A1.Store_Name;

----------------------Result -------------------------
Store_Name		Sales
------------------------
Boston			700
New York		
Los Angeles		1800
San Diego		250


-- LEFT JOIN






