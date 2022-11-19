IF EXISTS(SELECT * FROM sys.columns
WHERE Name = N'Secuencia' AND OBJECT_ID = OBJECT_ID(N'SYS_Operaciones')) BEGIN
	update SYS_Operaciones set SequentialNumber = b.Row#
	from SYS_Operaciones as a inner join 
	(SELECT ROW_NUMBER() OVER(ORDER BY Secuencia) AS Row#,*
	FROM SYS_Operaciones) as b on
	a.Oid = b.Oid 

	ALTER TABLE dbo.SYS_Operaciones DROP COLUMN Secuencia
END  

IF EXISTS(SELECT * FROM sys.columns
WHERE Name = N'Secuencia' AND OBJECT_ID = OBJECT_ID(N'SYS_PartidasInv')) BEGIN
	update SYS_PartidasInv set SequentialNumber = b.Row#
	from sys_partidasinv as a inner join 
	(SELECT ROW_NUMBER() OVER(ORDER BY secuencia) AS Row#,*
	FROM SYS_PartidasInv) as b on
	a.Oid = b.Oid 

	ALTER TABLE dbo.SYS_PartidasInv DROP COLUMN Secuencia
END  


IF EXISTS(SELECT * FROM sys.columns
WHERE Name = N'Secuencia' AND OBJECT_ID = OBJECT_ID(N'SYS_PartidasVta')) BEGIN
	update SYS_PartidasVta set SequentialNumber = b.Row#
	from SYS_PartidasVta as a inner join 
	(SELECT ROW_NUMBER() OVER(ORDER BY secuencia) AS Row#,*
	FROM SYS_PartidasVta) as b on
	a.Oid = b.Oid 

	ALTER TABLE dbo.SYS_PartidasVta DROP COLUMN Secuencia
END  

IF EXISTS(SELECT * FROM sys.columns
WHERE Name = N'Secuencia' AND OBJECT_ID = OBJECT_ID(N'SYS_PartidasCom')) BEGIN
	update SYS_PartidasCom set SequentialNumber = b.Row#
	from SYS_PartidasCom as a inner join 
	(SELECT ROW_NUMBER() OVER(ORDER BY secuencia) AS Row#,*
	FROM SYS_PartidasCom) as b on
	a.Oid = b.Oid 

	ALTER TABLE dbo.SYS_PartidasCom DROP COLUMN Secuencia
END  

IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[VR_AD_InventariosDetalle]'))
DROP VIEW [dbo].[VR_AD_InventariosDetalle]
GO

CREATE VIEW [dbo].[VR_AD_InventariosDetalle] as 
select a.*,
       b.SequentialNumber,
	   b.Partida,
	   Articulo = dbo.SYS_ValorUIArticulo(b.ArticuloId),
	   Serie = isnull(b.SerieS,''),
	   b.Descripcion,
	   b.Cantidad,
	   CantidadKardex = b.Cantidad * b.Multiplica,
	   UM = dbo.SYS_ValorUIUnidadMedida(b.UnidadMedida),
	   b.CostoUnitario,
	   b.Costo,
	   Almacen = dbo.SYS_ValorUIAlmacen(b.Almacen),
	   Ubicacion = dbo.SYS_ValorUIUbicacion(b.Ubicacion),
	   b.ExistAct,
	   b.Exist
from VR_AD_Inventarios as a inner join SYS_PartidasInv as b on
a.Oid = b.Operacion 
GO
