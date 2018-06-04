-- Function: public.insert_membercard_data(character varying, character varying, date, character varying, character varying, character varying, character varying, character varying)

-- DROP FUNCTION public.insert_membercard_data(character varying, character varying, date, character varying, character varying, character varying, character varying, character varying);

CREATE OR REPLACE FUNCTION public.insert_membercard_data(
    en_uid character varying,
    en_nama character varying,
    en_ttl date,
    en_alamat character varying,
    en_kelurahan character varying,
    en_kecamatan character varying,
    en_email character varying,
    en_no_telp character varying)
  RETURNS character varying AS
$BODY$
DECLARE
	idg 	varchar;
BEGIN
if  NOT EXISTS (SELECT 1 FROM tblmembercard_data WHERE uid = en_uid) then 
  INSERT INTO tblmembercard_data VALUES (
  en_uid,
  en_nama,
  en_ttl,
  en_alamat,
  en_kelurahan,
  en_kecamatan,
  en_email,
  en_no_telp);

  Insert Into tblmembercard values (en_uid, (select * from tbllastnokartu), 0);

  UPDATE public.tbllastnokartu
  SET lastnokartu=(select * from tbllastnokartu)+1
  WHERE lastnokartu=(select * from tbllastnokartu);
   
  RETURN 'OK INSERT';
 else
	RETURN 'GAGAL INSERT';
 end if; 

  
		
	 
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION public.insert_membercard_data(character varying, character varying, date, character varying, character varying, character varying, character varying, character varying)
  OWNER TO enco;
