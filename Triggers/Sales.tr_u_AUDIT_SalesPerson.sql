SET ANSI_NULLS ON
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [Sales].[tr_u_AUDIT_SalesPerson]
ON [Sales].[SalesPerson]
FOR UPDATE

	NOT FOR REPLICATION

As
-- "<TAG>SQLAUDIT GENERATED - DO NOT REMOVE</TAG>"
-- --------------------------------------------------------------------------------------------------------------
-- Legal:        You may freely edit and modify this template and make copies of it.
-- Description:  UPDATE TRIGGER for Table:  [Sales].[SalesPerson]
-- Author:       ApexSQL Software
-- Date:		 12/21/2016 6:59:13 PM
-- --------------------------------------------------------------------------------------------------------------
BEGIN
	DECLARE 
		@IDENTITY_SAVE			varchar(50),
		@AUDIT_LOG_TRANSACTION_ID	Int,
		@PRIM_KEY			nvarchar(4000),
		@Inserted	    		bit,
		--@TABLE_NAME				nvarchar(4000),
 		@ROWS_COUNT				int

	SET NOCOUNT ON

	--Set @TABLE_NAME = '[Sales].[SalesPerson]'
	Select @ROWS_COUNT=count(*) from inserted
	SET @IDENTITY_SAVE = CAST(IsNull(@@IDENTITY,1) AS varchar(50))

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
		'SalesPerson',
		'Sales',
		1,	--	ACTION ID For UPDATE
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
	

	SET @Inserted = 0
	
	If UPDATE([BusinessEntityID])
	BEGIN
    
		INSERT
		INTO [AdventureWorks2014].dbo.AUDIT_LOG_DATA
		(
			AUDIT_LOG_TRANSACTION_ID,
			PRIMARY_KEY_DATA,
			COL_NAME,
			OLD_VALUE_LONG,
			NEW_VALUE_LONG,
			DATA_TYPE
			, KEY1
		)
		SELECT
			@AUDIT_LOG_TRANSACTION_ID,
		    convert(nvarchar(1500), IsNull('[BusinessEntityID]='+CONVERT(nvarchar(4000), IsNull(OLD.[BusinessEntityID], NEW.[BusinessEntityID]), 0), '[BusinessEntityID] Is Null')),
		    'BusinessEntityID',
			CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0),
			CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0)))
			
		FROM deleted OLD Full Outer Join inserted NEW On
			(CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0)=CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0) or (NEW.[BusinessEntityID] Is Null and OLD.[BusinessEntityID] Is Null))
			WHERE (
			
			
				(
					NEW.[BusinessEntityID] <>
					OLD.[BusinessEntityID]
				) Or
			
				(
					NEW.[BusinessEntityID] Is Null And
					OLD.[BusinessEntityID] Is Not Null
				) Or
				(
					NEW.[BusinessEntityID] Is Not Null And
					OLD.[BusinessEntityID] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([TerritoryID])
	BEGIN
    
		INSERT
		INTO [AdventureWorks2014].dbo.AUDIT_LOG_DATA
		(
			AUDIT_LOG_TRANSACTION_ID,
			PRIMARY_KEY_DATA,
			COL_NAME,
			OLD_VALUE_LONG,
			NEW_VALUE_LONG,
			DATA_TYPE
			, KEY1
		)
		SELECT
			@AUDIT_LOG_TRANSACTION_ID,
		    convert(nvarchar(1500), IsNull('[BusinessEntityID]='+CONVERT(nvarchar(4000), IsNull(OLD.[BusinessEntityID], NEW.[BusinessEntityID]), 0), '[BusinessEntityID] Is Null')),
		    'TerritoryID',
			CONVERT(nvarchar(4000), OLD.[TerritoryID], 0),
			CONVERT(nvarchar(4000), NEW.[TerritoryID], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0)=CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0) or (NEW.[BusinessEntityID] Is Null and OLD.[BusinessEntityID] Is Null))
			where (
			
			
				(
					NEW.[TerritoryID] <>
					OLD.[TerritoryID]
				) Or
			
				(
					NEW.[TerritoryID] Is Null And
					OLD.[TerritoryID] Is Not Null
				) Or
				(
					NEW.[TerritoryID] Is Not Null And
					OLD.[TerritoryID] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([SalesQuota])
	BEGIN
    
		INSERT
		INTO [AdventureWorks2014].dbo.AUDIT_LOG_DATA
		(
			AUDIT_LOG_TRANSACTION_ID,
			PRIMARY_KEY_DATA,
			COL_NAME,
			OLD_VALUE_LONG,
			NEW_VALUE_LONG,
			DATA_TYPE
			, KEY1
		)
		SELECT
			@AUDIT_LOG_TRANSACTION_ID,
		    convert(nvarchar(1500), IsNull('[BusinessEntityID]='+CONVERT(nvarchar(4000), IsNull(OLD.[BusinessEntityID], NEW.[BusinessEntityID]), 0), '[BusinessEntityID] Is Null')),
		    'SalesQuota',
			CONVERT(nvarchar(4000), OLD.[SalesQuota], 2),
			CONVERT(nvarchar(4000), NEW.[SalesQuota], 2),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0)=CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0) or (NEW.[BusinessEntityID] Is Null and OLD.[BusinessEntityID] Is Null))
			where (
			
			
				(
					NEW.[SalesQuota] <>
					OLD.[SalesQuota]
				) Or
			
				(
					NEW.[SalesQuota] Is Null And
					OLD.[SalesQuota] Is Not Null
				) Or
				(
					NEW.[SalesQuota] Is Not Null And
					OLD.[SalesQuota] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([Bonus])
	BEGIN
    
		INSERT
		INTO [AdventureWorks2014].dbo.AUDIT_LOG_DATA
		(
			AUDIT_LOG_TRANSACTION_ID,
			PRIMARY_KEY_DATA,
			COL_NAME,
			OLD_VALUE_LONG,
			NEW_VALUE_LONG,
			DATA_TYPE
			, KEY1
		)
		SELECT
			@AUDIT_LOG_TRANSACTION_ID,
		    convert(nvarchar(1500), IsNull('[BusinessEntityID]='+CONVERT(nvarchar(4000), IsNull(OLD.[BusinessEntityID], NEW.[BusinessEntityID]), 0), '[BusinessEntityID] Is Null')),
		    'Bonus',
			CONVERT(nvarchar(4000), OLD.[Bonus], 2),
			CONVERT(nvarchar(4000), NEW.[Bonus], 2),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0)=CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0) or (NEW.[BusinessEntityID] Is Null and OLD.[BusinessEntityID] Is Null))
			where (
			
			
				(
					NEW.[Bonus] <>
					OLD.[Bonus]
				) Or
			
				(
					NEW.[Bonus] Is Null And
					OLD.[Bonus] Is Not Null
				) Or
				(
					NEW.[Bonus] Is Not Null And
					OLD.[Bonus] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([CommissionPct])
	BEGIN
    
		INSERT
		INTO [AdventureWorks2014].dbo.AUDIT_LOG_DATA
		(
			AUDIT_LOG_TRANSACTION_ID,
			PRIMARY_KEY_DATA,
			COL_NAME,
			OLD_VALUE_LONG,
			NEW_VALUE_LONG,
			DATA_TYPE
			, KEY1
		)
		SELECT
			@AUDIT_LOG_TRANSACTION_ID,
		    convert(nvarchar(1500), IsNull('[BusinessEntityID]='+CONVERT(nvarchar(4000), IsNull(OLD.[BusinessEntityID], NEW.[BusinessEntityID]), 0), '[BusinessEntityID] Is Null')),
		    'CommissionPct',
			CONVERT(nvarchar(4000), OLD.[CommissionPct], 2),
			CONVERT(nvarchar(4000), NEW.[CommissionPct], 2),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0)=CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0) or (NEW.[BusinessEntityID] Is Null and OLD.[BusinessEntityID] Is Null))
			where (
			
			
				(
					NEW.[CommissionPct] <>
					OLD.[CommissionPct]
				) Or
			
				(
					NEW.[CommissionPct] Is Null And
					OLD.[CommissionPct] Is Not Null
				) Or
				(
					NEW.[CommissionPct] Is Not Null And
					OLD.[CommissionPct] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([SalesYTD])
	BEGIN
    
		INSERT
		INTO [AdventureWorks2014].dbo.AUDIT_LOG_DATA
		(
			AUDIT_LOG_TRANSACTION_ID,
			PRIMARY_KEY_DATA,
			COL_NAME,
			OLD_VALUE_LONG,
			NEW_VALUE_LONG,
			DATA_TYPE
			, KEY1
		)
		SELECT
			@AUDIT_LOG_TRANSACTION_ID,
		    convert(nvarchar(1500), IsNull('[BusinessEntityID]='+CONVERT(nvarchar(4000), IsNull(OLD.[BusinessEntityID], NEW.[BusinessEntityID]), 0), '[BusinessEntityID] Is Null')),
		    'SalesYTD',
			CONVERT(nvarchar(4000), OLD.[SalesYTD], 2),
			CONVERT(nvarchar(4000), NEW.[SalesYTD], 2),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0)=CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0) or (NEW.[BusinessEntityID] Is Null and OLD.[BusinessEntityID] Is Null))
			where (
			
			
				(
					NEW.[SalesYTD] <>
					OLD.[SalesYTD]
				) Or
			
				(
					NEW.[SalesYTD] Is Null And
					OLD.[SalesYTD] Is Not Null
				) Or
				(
					NEW.[SalesYTD] Is Not Null And
					OLD.[SalesYTD] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([SalesLastYear])
	BEGIN
    
		INSERT
		INTO [AdventureWorks2014].dbo.AUDIT_LOG_DATA
		(
			AUDIT_LOG_TRANSACTION_ID,
			PRIMARY_KEY_DATA,
			COL_NAME,
			OLD_VALUE_LONG,
			NEW_VALUE_LONG,
			DATA_TYPE
			, KEY1
		)
		SELECT
			@AUDIT_LOG_TRANSACTION_ID,
		    convert(nvarchar(1500), IsNull('[BusinessEntityID]='+CONVERT(nvarchar(4000), IsNull(OLD.[BusinessEntityID], NEW.[BusinessEntityID]), 0), '[BusinessEntityID] Is Null')),
		    'SalesLastYear',
			CONVERT(nvarchar(4000), OLD.[SalesLastYear], 2),
			CONVERT(nvarchar(4000), NEW.[SalesLastYear], 2),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0)=CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0) or (NEW.[BusinessEntityID] Is Null and OLD.[BusinessEntityID] Is Null))
			where (
			
			
				(
					NEW.[SalesLastYear] <>
					OLD.[SalesLastYear]
				) Or
			
				(
					NEW.[SalesLastYear] Is Null And
					OLD.[SalesLastYear] Is Not Null
				) Or
				(
					NEW.[SalesLastYear] Is Not Null And
					OLD.[SalesLastYear] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([rowguid])
	BEGIN
    
		INSERT
		INTO [AdventureWorks2014].dbo.AUDIT_LOG_DATA
		(
			AUDIT_LOG_TRANSACTION_ID,
			PRIMARY_KEY_DATA,
			COL_NAME,
			OLD_VALUE_LONG,
			NEW_VALUE_LONG,
			DATA_TYPE
			, KEY1
		)
		SELECT
			@AUDIT_LOG_TRANSACTION_ID,
		    convert(nvarchar(1500), IsNull('[BusinessEntityID]='+CONVERT(nvarchar(4000), IsNull(OLD.[BusinessEntityID], NEW.[BusinessEntityID]), 0), '[BusinessEntityID] Is Null')),
		    'rowguid',
			CONVERT(nvarchar(4000), OLD.[rowguid], 0),
			CONVERT(nvarchar(4000), NEW.[rowguid], 0),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0)=CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0) or (NEW.[BusinessEntityID] Is Null and OLD.[BusinessEntityID] Is Null))
			where (
			
			
				(
					NEW.[rowguid] <>
					OLD.[rowguid]
				) Or
			
				(
					NEW.[rowguid] Is Null And
					OLD.[rowguid] Is Not Null
				) Or
				(
					NEW.[rowguid] Is Not Null And
					OLD.[rowguid] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	If UPDATE([ModifiedDate])
	BEGIN
    
		INSERT
		INTO [AdventureWorks2014].dbo.AUDIT_LOG_DATA
		(
			AUDIT_LOG_TRANSACTION_ID,
			PRIMARY_KEY_DATA,
			COL_NAME,
			OLD_VALUE_LONG,
			NEW_VALUE_LONG,
			DATA_TYPE
			, KEY1
		)
		SELECT
			@AUDIT_LOG_TRANSACTION_ID,
		    convert(nvarchar(1500), IsNull('[BusinessEntityID]='+CONVERT(nvarchar(4000), IsNull(OLD.[BusinessEntityID], NEW.[BusinessEntityID]), 0), '[BusinessEntityID] Is Null')),
		    'ModifiedDate',
			CONVERT(nvarchar(4000), OLD.[ModifiedDate], 121),
			CONVERT(nvarchar(4000), NEW.[ModifiedDate], 121),
			'A'
			, IsNULL( CONVERT(nvarchar(500), CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0)), CONVERT(nvarchar(500), CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0)))
			
		FROM deleted OLD Inner Join inserted NEW On 
			(CONVERT(nvarchar(4000), NEW.[BusinessEntityID], 0)=CONVERT(nvarchar(4000), OLD.[BusinessEntityID], 0) or (NEW.[BusinessEntityID] Is Null and OLD.[BusinessEntityID] Is Null))
			where (
			
			
				(
					NEW.[ModifiedDate] <>
					OLD.[ModifiedDate]
				) Or
			
				(
					NEW.[ModifiedDate] Is Null And
					OLD.[ModifiedDate] Is Not Null
				) Or
				(
					NEW.[ModifiedDate] Is Not Null And
					OLD.[ModifiedDate] Is Null
				)
				)
        
		SET @Inserted = CASE WHEN @@ROWCOUNT > 0 Then 1 Else @Inserted End
	END
	
	-- Watch
	
	-- Lookup
	
	IF @Inserted = 0
	BEGIN
		DELETE FROM [AdventureWorks2014].dbo.AUDIT_LOG_TRANSACTIONS WHERE AUDIT_LOG_TRANSACTION_ID = @AUDIT_LOG_TRANSACTION_ID
	END

  -- Restore @@IDENTITY Value
  
    DECLARE @maxprec AS varchar(2)
    SET @maxprec=CAST(@@MAX_PRECISION as varchar(2))
    EXEC('SELECT IDENTITY(decimal('+@maxprec+',0),'+@IDENTITY_SAVE+',1) id INTO #tmp')
  
End
GO
EXEC sp_settriggerorder @triggername= '[Sales].[tr_u_AUDIT_SalesPerson]', @order='Last', @stmttype='UPDATE'
GO
