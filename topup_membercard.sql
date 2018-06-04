-- Function: public.topup_membercard(character varying, character varying, numeric)

-- DROP FUNCTION public.topup_membercard(character varying, character varying, numeric);

CREATE OR REPLACE FUNCTION public.topup_membercard(
    IN en_uid character varying,
    IN en_user character varying,
    IN en_nominal numeric)
  RETURNS TABLE(status character varying, nokartu character varying, sld numeric) AS
$BODY$

BEGIN
if  EXISTS (SELECT 1 FROM tblmembercard_data WHERE uid = en_uid) then
  INSERT INTO tbltransaksi_topup (id_trx,tanggal,jam, pengguna, nominal, uid) VALUES (
  '03' || right(cast(CURRENT_DATE as character varying), 2) || substring(cast(CURRENT_DATE as character varying) from 6 for 2) || substring(cast(CURRENT_DATE as character varying) from 3 for 2) || cast((select id from tblid) as character varying),
  CURRENT_DATE,CURRENT_TIME,en_user, en_nominal, en_uid);
	
	UPDATE tbltransaksi_topup 
        SET nokartu = tblmembercard.nokartu
        FROM  tblmembercard
        WHERE tblmembercard.uid = tbltransaksi_topup.uid;

  UPDATE tblid SET id = id + 1;
  
	
  
  UPDATE tblmembercard SET saldo = saldo + en_nominal
  WHERE uid = en_uid;

 
 

	RETURN QUERY
	
	SELECT CAST('OK TOPUP' AS  character varying), tblmembercard.nokartu, tblmembercard.saldo 
	FROM public.tblmembercard
        where tblmembercard.uid=en_uid;
        
else
	RETURN QUERY
	SELECT CAST('GAGAL TOPUP' AS  character varying),CAST('0000000' AS  character varying),CAST(0 AS  numeric);
	-- FROM public.tblmembercard LIMIT 1;
	
end if; 

	 
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION public.topup_membercard(character varying, character varying, numeric)
  OWNER TO enco;
