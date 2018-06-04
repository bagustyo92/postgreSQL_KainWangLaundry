-- Function: public.enco_get_membercard_data(character varying)

-- DROP FUNCTION public.enco_get_membercard_data(character varying);

CREATE OR REPLACE FUNCTION public.enco_get_membercard_data(IN et_uid character varying)
  RETURNS TABLE(saldo numeric, nama character varying) AS
$BODY$

BEGIN
     RETURN QUERY
        select tblmembercard.saldo, tblmembercard_data.nama
	from tblmembercard
	inner join tblmembercard_data on tblmembercard.uid=tblmembercard_data.uid;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION public.enco_get_membercard_data(character varying)
  OWNER TO enco;
