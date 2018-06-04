-- Function: public.get_list_mesin()

-- DROP FUNCTION public.get_list_mesin();

CREATE OR REPLACE FUNCTION public.get_list_mesin()
  RETURNS TABLE(nomesin character varying, ipmesin character varying) AS
$BODY$

BEGIN
     RETURN QUERY
         SELECT tblmesin.nomesin, 
		tblmesin.ipmesin
         FROM public.tblmesin;
         END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION public.get_list_mesin()
  OWNER TO enco;
