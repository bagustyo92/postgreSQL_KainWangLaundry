-- Function: public.get_control_mesin(character varying)

-- DROP FUNCTION public.get_control_mesin(character varying);

CREATE OR REPLACE FUNCTION public.get_control_mesin(IN et_mesin character varying)
  RETURNS TABLE(mesin character varying, resi integer, flag integer) AS
$BODY$
DECLARE
	idg 	varchar;
BEGIN
     RETURN QUERY
	SELECT tblcontrol_mesin.mesin, tblcontrol_mesin.resi, tblcontrol_mesin.flag 
	FROM tblcontrol_mesin
	WHERE tblcontrol_mesin.mesin=et_mesin AND
	 tblcontrol_mesin.tanggal=tblcontrol_mesin.tgl_trx AND tblcontrol_mesin.jam=tblcontrol_mesin.jam_trx;

END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION public.get_control_mesin(character varying)
  OWNER TO enco;
