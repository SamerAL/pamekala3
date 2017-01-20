SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [Purchasing].[tr_i_AUDIT_ProductVendor]
ON [Purchasing].[ProductVendor]
FOR INSERT


	NOT FOR REPLICATION

As
-- "<TAG>SQLAUDIT GENERATED - DO NOT REMOVE</TAG>"
-- --------------------------------------------------------------------------------------------------------------
-- Legal:        You may freely edit and modify this template and make copies of it.
-- Description:  INSERT TRIGGER for Table:  [Purchasing].[ProductVendor]
-- Author:       ApexSQL Software
-- Date:		 12/21/2016 6:59:11 PM
-- --------------------------------------------------------------------------------------------------------------
BEGIN
	DECLARE 
		@IDENTITY_SAVE				varchar(50),
		@AUDIT_LOG_TRANSACTION_ID		Int,
		@PRIM_KEY				nvarchar(4000),
		--@TABLE_NAME				nvarchar(4000),
		@ROWS_COUNT				int

	SET NOCOUNT ON

	--Set @TABLE_NAME = '[Purchasing].[ProductVendor]'
	Select @ROWS_COUNT=count(*) from inserted
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
		'ProductVendor',
		'Purchasing',
		2,	--	ACTION ID For INSERT
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
	

	
	INSERT INTO [AdventureWorks2014].dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		NEW_VALUE_LONG,
		DATA_TYPE
		, KEY1, KEY2
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[ProductID]='+CONVERT(nvarchar(4000), NEW.[ProductID], 0), '[ProductID] Is Null') + ' AND ' + IsNull('[BusinessEntityID]='+CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0), '[BusinessEntityID] Is Null')),
		'ProductID',
		CONVERT(nvarchar(4000), NEW.[ProductID], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ProductID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0))
	FROM inserted NEW
	WHERE NEW.[ProductID] Is Not Null
    
	INSERT INTO [AdventureWorks2014].dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		NEW_VALUE_LONG,
		DATA_TYPE
		, KEY1, KEY2
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[ProductID]='+CONVERT(nvarchar(4000), NEW.[ProductID], 0), '[ProductID] Is Null') + ' AND ' + IsNull('[BusinessEntityID]='+CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0), '[BusinessEntityID] Is Null')),
		'BusinessEntityID',
		CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ProductID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0))
	FROM inserted NEW
	WHERE NEW.[BusinessEntityID] Is Not Null
    
	INSERT INTO [AdventureWorks2014].dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		NEW_VALUE_LONG,
		DATA_TYPE
		, KEY1, KEY2
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[ProductID]='+CONVERT(nvarchar(4000), NEW.[ProductID], 0), '[ProductID] Is Null') + ' AND ' + IsNull('[BusinessEntityID]='+CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0), '[BusinessEntityID] Is Null')),
		'AverageLeadTime',
		CONVERT(nvarchar(4000), NEW.[AverageLeadTime], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ProductID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0))
	FROM inserted NEW
	WHERE NEW.[AverageLeadTime] Is Not Null
    
	INSERT INTO [AdventureWorks2014].dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		NEW_VALUE_LONG,
		DATA_TYPE
		, KEY1, KEY2
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[ProductID]='+CONVERT(nvarchar(4000), NEW.[ProductID], 0), '[ProductID] Is Null') + ' AND ' + IsNull('[BusinessEntityID]='+CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0), '[BusinessEntityID] Is Null')),
		'StandardPrice',
		CONVERT(nvarchar(4000), NEW.[StandardPrice], 2),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ProductID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0))
	FROM inserted NEW
	WHERE NEW.[StandardPrice] Is Not Null
    
	INSERT INTO [AdventureWorks2014].dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		NEW_VALUE_LONG,
		DATA_TYPE
		, KEY1, KEY2
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[ProductID]='+CONVERT(nvarchar(4000), NEW.[ProductID], 0), '[ProductID] Is Null') + ' AND ' + IsNull('[BusinessEntityID]='+CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0), '[BusinessEntityID] Is Null')),
		'LastReceiptCost',
		CONVERT(nvarchar(4000), NEW.[LastReceiptCost], 2),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ProductID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0))
	FROM inserted NEW
	WHERE NEW.[LastReceiptCost] Is Not Null
    
	INSERT INTO [AdventureWorks2014].dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		NEW_VALUE_LONG,
		DATA_TYPE
		, KEY1, KEY2
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[ProductID]='+CONVERT(nvarchar(4000), NEW.[ProductID], 0), '[ProductID] Is Null') + ' AND ' + IsNull('[BusinessEntityID]='+CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0), '[BusinessEntityID] Is Null')),
		'LastReceiptDate',
		CONVERT(nvarchar(4000), NEW.[LastReceiptDate], 121),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ProductID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0))
	FROM inserted NEW
	WHERE NEW.[LastReceiptDate] Is Not Null
    
	INSERT INTO [AdventureWorks2014].dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		NEW_VALUE_LONG,
		DATA_TYPE
		, KEY1, KEY2
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[ProductID]='+CONVERT(nvarchar(4000), NEW.[ProductID], 0), '[ProductID] Is Null') + ' AND ' + IsNull('[BusinessEntityID]='+CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0), '[BusinessEntityID] Is Null')),
		'MinOrderQty',
		CONVERT(nvarchar(4000), NEW.[MinOrderQty], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ProductID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0))
	FROM inserted NEW
	WHERE NEW.[MinOrderQty] Is Not Null
    
	INSERT INTO [AdventureWorks2014].dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		NEW_VALUE_LONG,
		DATA_TYPE
		, KEY1, KEY2
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[ProductID]='+CONVERT(nvarchar(4000), NEW.[ProductID], 0), '[ProductID] Is Null') + ' AND ' + IsNull('[BusinessEntityID]='+CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0), '[BusinessEntityID] Is Null')),
		'MaxOrderQty',
		CONVERT(nvarchar(4000), NEW.[MaxOrderQty], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ProductID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0))
	FROM inserted NEW
	WHERE NEW.[MaxOrderQty] Is Not Null
    
	INSERT INTO [AdventureWorks2014].dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		NEW_VALUE_LONG,
		DATA_TYPE
		, KEY1, KEY2
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[ProductID]='+CONVERT(nvarchar(4000), NEW.[ProductID], 0), '[ProductID] Is Null') + ' AND ' + IsNull('[BusinessEntityID]='+CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0), '[BusinessEntityID] Is Null')),
		'OnOrderQty',
		CONVERT(nvarchar(4000), NEW.[OnOrderQty], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ProductID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0))
	FROM inserted NEW
	WHERE NEW.[OnOrderQty] Is Not Null
    
	INSERT INTO [AdventureWorks2014].dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		NEW_VALUE_LONG,
		DATA_TYPE
		, KEY1, KEY2
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[ProductID]='+CONVERT(nvarchar(4000), NEW.[ProductID], 0), '[ProductID] Is Null') + ' AND ' + IsNull('[BusinessEntityID]='+CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0), '[BusinessEntityID] Is Null')),
		'UnitMeasureCode',
		CONVERT(nvarchar(4000), NEW.[UnitMeasureCode], 0),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ProductID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0))
	FROM inserted NEW
	WHERE NEW.[UnitMeasureCode] Is Not Null
    
	INSERT INTO [AdventureWorks2014].dbo.AUDIT_LOG_DATA
	(
		AUDIT_LOG_TRANSACTION_ID,
		PRIMARY_KEY_DATA,
		COL_NAME,
		NEW_VALUE_LONG,
		DATA_TYPE
		, KEY1, KEY2
	)
	SELECT
		@AUDIT_LOG_TRANSACTION_ID,
		convert(nvarchar(1500), IsNull('[ProductID]='+CONVERT(nvarchar(4000), NEW.[ProductID], 0), '[ProductID] Is Null') + ' AND ' + IsNull('[BusinessEntityID]='+CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0), '[BusinessEntityID] Is Null')),
		'ModifiedDate',
		CONVERT(nvarchar(4000), NEW.[ModifiedDate], 121),
		'A'
		, CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[ProductID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0))
	FROM inserted NEW
	WHERE NEW.[ModifiedDate] Is Not Null
    

	-- Lookup 
	

  -- Restore @@IDENTITY Value
  
    DECLARE @maxprec AS varchar(2)
    SET @maxprec=CAST(@@MAX_PRECISION as varchar(2))
    EXEC('SELECT IDENTITY(decimal('+@maxprec+',0),'+@IDENTITY_SAVE+',1) id INTO #tmp')
  

End
GO
EXEC sp_settriggerorder @triggername= '[Purchasing].[tr_i_AUDIT_ProductVendor]', @order='Last', @stmttype='INSERT'
GO