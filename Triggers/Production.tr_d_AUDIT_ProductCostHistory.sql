SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [Production].[tr_d_AUDIT_ProductCostHistory]
ON [Production].[ProductCostHistory]
FOR DELETE

	NOT FOR REPLICATION

AS
-- "<TAG>SQLAUDIT GENERATED - DO NOT REMOVE</TAG>"
-- --------------------------------------------------------------------------------------------------------------
-- Legal:        You may freely edit and modify this template and make copies of it.
-- Description:  DELETE TRIGGER for Table:  [Production].[ProductCostHistory]
-- Author:       ApexSQL Software
-- Date:		 12/21/2016 6:59:09 PM
-- --------------------------------------------------------------------------------------------------------------
BEGIN
	DECLARE 
		@IDENTITY_SAVE				varchar(50),
		@AUDIT_LOG_TRANSACTION_ID		Int,
		@PRIM_KEY				nvarchar(4000),
		--@TABLE_NAME				nvarchar(4000),
 		@ROWS_COUNT				int

	SET NOCOUNT ON

	--Set @TABLE_NAME = '[Production].[ProductCostHistory]'
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
		'ProductCostHistory',
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
		, KEY1, KEY2
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[ProductID]='+CONVERT(nvarchar(4000), OLD.[ProductID], 0), '[ProductID] Is Null') + ' AND ' + IsNull('[StartDate]=N'''+replace(CONVERT(nvarchar(4000), OLD.[StartDate], 121), '''', '''''')+'''', '[StartDate] Is Null')),
		'ProductID',
		CONVERT(nvarchar(4000), OLD.[ProductID], 0),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ProductID], 0)),  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[StartDate], 121))
	FROM deleted OLD
	WHERE
		OLD.[ProductID] Is Not Null

	INSERT
	INTO [AdventureWorks2014].dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		OLD_VALUE_LONG,
		DATA_TYPE
		, KEY1, KEY2
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[ProductID]='+CONVERT(nvarchar(4000), OLD.[ProductID], 0), '[ProductID] Is Null') + ' AND ' + IsNull('[StartDate]=N'''+replace(CONVERT(nvarchar(4000), OLD.[StartDate], 121), '''', '''''')+'''', '[StartDate] Is Null')),
		'StartDate',
		CONVERT(nvarchar(4000), OLD.[StartDate], 121),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ProductID], 0)),  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[StartDate], 121))
	FROM deleted OLD
	WHERE
		OLD.[StartDate] Is Not Null

	INSERT
	INTO [AdventureWorks2014].dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		OLD_VALUE_LONG,
		DATA_TYPE
		, KEY1, KEY2
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[ProductID]='+CONVERT(nvarchar(4000), OLD.[ProductID], 0), '[ProductID] Is Null') + ' AND ' + IsNull('[StartDate]=N'''+replace(CONVERT(nvarchar(4000), OLD.[StartDate], 121), '''', '''''')+'''', '[StartDate] Is Null')),
		'EndDate',
		CONVERT(nvarchar(4000), OLD.[EndDate], 121),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ProductID], 0)),  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[StartDate], 121))
	FROM deleted OLD
	WHERE
		OLD.[EndDate] Is Not Null

	INSERT
	INTO [AdventureWorks2014].dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		OLD_VALUE_LONG,
		DATA_TYPE
		, KEY1, KEY2
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[ProductID]='+CONVERT(nvarchar(4000), OLD.[ProductID], 0), '[ProductID] Is Null') + ' AND ' + IsNull('[StartDate]=N'''+replace(CONVERT(nvarchar(4000), OLD.[StartDate], 121), '''', '''''')+'''', '[StartDate] Is Null')),
		'StandardCost',
		CONVERT(nvarchar(4000), OLD.[StandardCost], 2),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ProductID], 0)),  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[StartDate], 121))
	FROM deleted OLD
	WHERE
		OLD.[StandardCost] Is Not Null

	INSERT
	INTO [AdventureWorks2014].dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		OLD_VALUE_LONG,
		DATA_TYPE
		, KEY1, KEY2
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[ProductID]='+CONVERT(nvarchar(4000), OLD.[ProductID], 0), '[ProductID] Is Null') + ' AND ' + IsNull('[StartDate]=N'''+replace(CONVERT(nvarchar(4000), OLD.[StartDate], 121), '''', '''''')+'''', '[StartDate] Is Null')),
		'ModifiedDate',
		CONVERT(nvarchar(4000), OLD.[ModifiedDate], 121),
		'A'
		,  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[ProductID], 0)),  CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[StartDate], 121))
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
EXEC sp_settriggerorder @triggername= '[Production].[tr_d_AUDIT_ProductCostHistory]', @order='Last', @stmttype='DELETE'
GO
