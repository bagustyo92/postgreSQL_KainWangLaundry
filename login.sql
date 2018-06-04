-- Function: public.login(character varying, character varying)

-- DROP FUNCTION public.login(character varying, character varying);

CREATE OR REPLACE FUNCTION public.login(
    en_username character varying,
    en_password character varying)
  RETURNS character varying AS
$BODY$
DECLARE
	idg 	varchar;
BEGIN
if (SELECT 1 FROM tbllogin_admin WHERE password = en_password AND username = en_username) then 
  RETURN 'OK LOGIN';
 else

	RETURN 'GAGAL LOGIN';
 end if; 

  
		
	 
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION public.login(character varying, character varying)
  OWNER TO enco;
