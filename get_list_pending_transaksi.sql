-- Function: public.get_list_pending_transaksi()

-- DROP FUNCTION public.get_list_pending_transaksi();

CREATE OR REPLACE FUNCTION public.get_list_pending_transaksi()
  RETURNS TABLE(resi integer, cuci integer, kering integer) AS
$BODY$

BEGIN
     RETURN QUERY
         SELECT tblpending_transaksi.resi,
		tblpending_transaksi.cuci,
		tblpending_transaksi.kering
         FROM public.tblpending_transaksi
         Order by tblpending_transaksi.resi ASC;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100
  ROWS 1000;
ALTER FUNCTION public.get_list_pending_transaksi()
  OWNER TO enco;
