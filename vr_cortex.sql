ALTER VIEW VR_CorteX as  
select b.compania,a.Oid,b.Periodo,b.Fecha,b.Transaccion,Corte = b.Numero,b.Estatus,  
a.Inicio,a.Fin,a.Fondo,a.EnCaja,a.Total,a.Diferencia,a.TotalMovimientos,a.TotalVentas,a.Credito,a.Propinas,a.Descuentos,  
Ventas.*  
from AD_Cortes as a inner join sys_operaciones as b on   
a.Oid = b.Oid inner join (  
select b.UltimaActualizacion,b.Numero,TransaccionVenta = b.Transaccion,a.Cliente,b.Descripcion,a.Impuestos,  
TotalVenta = a.Total,OidCorte = a.Corte   
from AD_Ventas as a inner join SYS_Operaciones as b on  
a.oid = b.Oid  
where b.GCRecord is null  
) as Ventas on   
a.Oid = Ventas.OidCorte  
GO

select * from VR_CorteX 