-- 盤點
select count(0) from eai_transmit_message_log where func_code='TFEP1' and MESSAGE  like 'TOTAL:%' 
and CREATE_TIME>=to_date('190701','YYMMDD')and CREATE_TIME<to_date('191001','YYMMDD');

   --台星筆數
select count(0) from eai_transmit_message_log where func_code='TFEP1' and MESSAGE not like 'TOTAL:%' 
and CREATE_TIME>=to_date('190401','YYMMDD')and CREATE_TIME<to_date('190701','YYMMDD');

SELECT SUM(SUBSTR(MESSAGE, INSTR(MESSAGE, ': ') + 2)) / 3
  FROM eai_Transmit_Message_Log
 WHERE FUNC_CODE LIKE '%HTHP%'
   AND CREATE_TIME >= TO_DATE('070119', 'MMDDYY')
   AND CREATE_TIME < TO_DATE('100119', 'MMDDYY')
   AND DETAILED_DESCRIPTION = 'HTHP_WMS END'
