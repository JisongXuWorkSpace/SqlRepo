-- �|�v�ק�

--CN �|�v
SELECT RPD.VAT_RATE,RPD.*
  FROM DBS_MAJ.RPMPAYBACKDETAIL RPD
 WHERE RPD.MTCOMPANYCODE = 'SZ'
   AND RPD.MTNO IN ('MT3Q909975'
   )
   AND RPD.VAT_RATE = '13';
