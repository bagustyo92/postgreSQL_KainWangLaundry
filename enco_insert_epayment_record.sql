-- Function: public.enco_insert_epayment_record(character varying, date, time without time zone, character varying, character varying, character, integer, character, numeric, numeric, text, integer, character varying)

-- DROP FUNCTION public.enco_insert_epayment_record(character varying, date, time without time zone, character varying, character varying, character, integer, character, numeric, numeric, text, integer, character varying);

CREATE OR REPLACE FUNCTION public.enco_insert_epayment_record(
    idshift character varying,
    tgl date,
    waktu time without time zone,
    et_lokasi character varying,
    et_mesin character varying,
    et_shift character,
    et_resi integer,
    et_gol character,
    et_tarif numeric,
    et_saldo numeric,
    et_etoll_hash text,
    et_flag integer,
    et_cmd character varying)
  RETURNS character varying AS
$BODY$
DECLARE
	idg 	varchar;
BEGIN
	-- SELECT get_id_gerbang(identitas) INTO idg FROM tblidentitas;
	INSERT INTO tblepayment_record VALUES (idshift,tgl,waktu,et_lokasi,et_mesin,et_shift,et_resi,et_gol,et_tarif,et_saldo,et_etoll_hash,et_flag,et_cmd);

	IF et_gol <> '1' THEN
	 INSERT INTO tblpending_transaksi VALUES (
		et_resi,
		1,
		1
	);
	END IF;
	RETURN 'OK';
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION public.enco_insert_epayment_record(character varying, date, time without time zone, character varying, character varying, character, integer, character, numeric, numeric, text, integer, character varying)
  OWNER TO enco;
