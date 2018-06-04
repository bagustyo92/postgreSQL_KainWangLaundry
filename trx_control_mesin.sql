-- Function: public.trx_control_mesin(character varying, integer, integer)

-- DROP FUNCTION public.trx_control_mesin(character varying, integer, integer);

CREATE OR REPLACE FUNCTION public.trx_control_mesin(
    et_mesin character varying,
    et_resi integer,
    et_action integer)
  RETURNS character varying AS
$BODY$
DECLARE
	idg 	varchar;
BEGIN
UPDATE tblcontrol_mesin
		SET  tgl_trx=now()::date,jam_trx=now()::time
		WHERE mesin=et_mesin AND flag=et_action AND resi=et_resi;
	 RETURN 'OK';
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION public.trx_control_mesin(character varying, integer, integer)
  OWNER TO enco;
