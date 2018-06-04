-- Function: public.enco_get_membercard(character varying)

-- DROP FUNCTION public.enco_get_membercard(character varying);

CREATE OR REPLACE FUNCTION public.enco_get_membercard(IN et_uid character varying)
  RETURNS TABLE(uid character varying, nokartu character varying, saldo numeric) AS
$BODY$

BEGIN
     RETURN QUERY
         SELECT tblmembercard.uid, tblmembercard.nokartu, tblmembercard.saldo
         FROM public.tblmembercard
         where tblmembercard.uid=et_uid;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION public.enco_get_membercard(character varying)
  OWNER TO enco;