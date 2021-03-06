SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [Production].[tr_d_AUDIT_ProductModelProductDescriptionCulture]
ON [Production].[ProductModelProductDescriptionCulture]
FOR DELETE

	NOT FOR REPLICATION

AS
-- "<TAG>SQLAUDIT GENERATED - DO NOT REMOVE</TAG>"
-- --------------------------------------------------------------------------------------------------------------
-- Legal:        You may freely edit and modify this template and make copies of it.
-- Description:  DELETE TRIGGER for Table:  [Production].[ProductModelProductDescriptionCulture]
-- Author:       ApexSQL Software
-- Date:		 12/21/2016 6:59:10 PM
-- --------------------------------------------------------------------------------------------------------------
BEGIN
	DECLARE 
		@IDENTITY_SAVE				varchar(50),
		@AUDIT_LOG_TRANSACTION_ID		Int,
		@PRIM_KEY				nvarchar(4000),
		--@TABLE_NAME				nvarchar(4000),
 		@ROWS_COUNT				int

	SET NOCOUNT ON

	--Set @TABLE_NAME = '[Production].[ProductModelProductDescriptionCulture]'
	Select @ROWS_COUNT=count(*) from deleted
	Set @IDENTITY_SAVE = CAST(IsNull(@@IDENTITY,1) AS varchar(50))

	INSERT
	INTO [AdventureWorks2014].dbo.AUDIT_LOG_TRANSACTIONS
	(
		TABLE_NAME,
		TABLE_SCHEMA,
		AUDIT_ACTION_ID,
		HOST_NAME,
		APP_NAME,
		MODIFIED_BY,
		MODIFIED_DATE,
		AFFECTED_ROWS,
		[DATABASE]
	)
	values(
		'ProductModelProductDescriptionCulture',
		'Production',
		3,	--	ACTION ID For DELETE
		CASE 
		  WHEN LEN(HOST_NAME()) < 1 THEN ' '
		  ELSE HOST_NAME()
		END,
		CASE 
		  WHEN LEN(APP_NAME()) < 1 THEN ' '
		  ELSE APP_NAME()
		END,
		SUSER_SNAME(),
		GETDATE(),
		@ROWS_COUNT,
		'AdventureWorks2014'
	)

	
	Set @AUDIT_LOG_TRANSACTION_ID = SCOPE_IDENTITY()
	


	INSERT
	INTO [AdventureWorks2014].dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		OLD_VALUE_LONG,
		DATA_TYPE
		, KEY1, KEY2, KEY3
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[ProductModelID]='+CONVERT(nvarchar(4000), OLD.[ProductModelID], 0), '[ProductModelID] Is Null') + ' AND ' + IsNull('[ProductDescriptionID]='+CONVERT(nvarchar(4000), OLD.[ProductDescriptionID], 0), '[ProductDescriptionID] Is Null') + ' AND ' + IsNull('[CultureID]=N'''+replace(CONVERT(nvarchar(4000), OLD.[CultureID], 0), '''', '''''')+'''', '[CultureID] Is Null')),
		'ProductModelID',
		CONVERT(nvarchar(4000), OLD.[ProductModelID], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ProductModelID], 0)),  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ProductDescriptionID], 0)),  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[CultureID], 0))
	FROM deleted OLD
	WHERE
		OLD.[ProductModelID] Is Not Null

	INSERT
	INTO [AdventureWorks2014].dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		OLD_VALUE_LONG,
		DATA_TYPE
		, KEY1, KEY2, KEY3
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[ProductModelID]='+CONVERT(nvarchar(4000), OLD.[ProductModelID], 0), '[ProductModelID] Is Null') + ' AND ' + IsNull('[ProductDescriptionID]='+CONVERT(nvarchar(4000), OLD.[ProductDescriptionID], 0), '[ProductDescriptionID] Is Null') + ' AND ' + IsNull('[CultureID]=N'''+replace(CONVERT(nvarchar(4000), OLD.[CultureID], 0), '''', '''''')+'''', '[CultureID] Is Null')),
		'ProductDescriptionID',
		CONVERT(nvarchar(4000), OLD.[ProductDescriptionID], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ProductModelID], 0)),  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ProductDescriptionID], 0)),  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[CultureID], 0))
	FROM deleted OLD
	WHERE
		OLD.[ProductDescriptionID] Is Not Null

	INSERT
	INTO [AdventureWorks2014].dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		OLD_VALUE_LONG,
		DATA_TYPE
		, KEY1, KEY2, KEY3
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[ProductModelID]='+CONVERT(nvarchar(4000), OLD.[ProductModelID], 0), '[ProductModelID] Is Null') + ' AND ' + IsNull('[ProductDescriptionID]='+CONVERT(nvarchar(4000), OLD.[ProductDescriptionID], 0), '[ProductDescriptionID] Is Null') + ' AND ' + IsNull('[CultureID]=N'''+replace(CONVERT(nvarchar(4000), OLD.[CultureID], 0), '''', '''''')+'''', '[CultureID] Is Null')),
		'CultureID',
		CONVERT(nvarchar(4000), OLD.[CultureID], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ProductModelID], 0)),  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ProductDescriptionID], 0)),  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[CultureID], 0))
	FROM deleted OLD
	WHERE
		OLD.[CultureID] Is Not Null

	INSERT
	INTO [AdventureWorks2014].dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		OLD_VALUE_LONG,
		DATA_TYPE
		, KEY1, KEY2, KEY3
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[ProductModelID]='+CONVERT(nvarchar(4000), OLD.[ProductModelID], 0), '[ProductModelID] Is Null') + ' AND ' + IsNull('[ProductDescriptionID]='+CONVERT(nvarchar(4000), OLD.[ProductDescriptionID], 0), '[ProductDescriptionID] Is Null') + ' AND ' + IsNull('[CultureID]=N'''+replace(CONVERT(nvarchar(4000), OLD.[CultureID], 0), '''', '''''')+'''', '[CultureID] Is Null')),
		'ModifiedDate',
		CONVERT(nvarchar(4000), OLD.[ModifiedDate], 121),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ProductModelID], 0)),  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ProductDescriptionID], 0)),  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[CultureID], 0))
	FROM deleted OLD
	WHERE
		OLD.[ModifiedDate] Is Not Null

	-- Lookup
	

  -- Restore @@IDENTITY Value
  
    DECLARE @maxprec AS varchar(2)
    SET @maxprec=CAST(@@MAX_PRECISION as varchar(2))
    EXEC('SELECT IDENTITY(decimal('+@maxprec+',0),'+@IDENTITY_SAVE+',1) id INTO #tmp')
  

END
GO
EXEC sp_settriggerorder @triggername= '[Production].[tr_d_AUDIT_ProductModelProductDescriptionCulture]', @order='Last', @stmttype='DELETE'
GO
