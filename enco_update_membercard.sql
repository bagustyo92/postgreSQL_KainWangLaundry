-- Function: public.enco_update_membercard(integer, character varying)

-- DROP FUNCTION public.enco_update_membercard(integer, character varying);

CREATE OR REPLACE FUNCTION public.enco_update_membercard(
    isaldo integer,
    iuid character varying)
  RETURNS character varying AS
$BODY$
DECLARE
	idg 	varchar;
BEGIN
	-- SELECT get_id_gerbang(identitas) INTO idg FROM tblidentitas;
	--INSERT INTO tblepayment_record VALUES (idshift,tgl,waktu,et_lokasi,et_mesin,et_shift,et_resi,et_gol,et_tarif,et_saldo,et_etoll_hash,et_flag,et_cmd);
	UPDATE public.tblmembercard SET saldo=isaldo WHERE uid=iuid;
	RETURN 'OK';
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION public.enco_update_membercard(integer, character varying)
  OWNER TO enco;
