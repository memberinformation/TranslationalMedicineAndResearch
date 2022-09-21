--======================================================
-- Create Natively Compiled Stored Procedure Template
--======================================================

USE [TranslationalWellnessData]
GO

-- Drop stored procedure if it already exists
DROP PROCEDURE IF EXISTS procedureAuthorization
Go

CREATE PROCEDURE procedureAuhorization
	-- open procedure structure for optimal reuse, optimal caching matching and performance
	@stringTransactionName nvarchar(max) = 'procedureAuthorization',
	@stringParam1 nvarchar(max), 
	@stringParam2 nvarchar(max), 
	@stringParam3 nvarchar(max), 
	@stringParam4 nvarchar(max), 
	@intParam5 int,
	@intParam6 int,
	@intParam7 int,
	@intParam8 int,
	@stringParam9Out nvarchar(max) out,
	@stringParam10Out nvarchar(max) out, 
	@intPara11Out int out,
	@intParam12Out int out,
	@stringidentity nvarchar (max),
	@intPolynomialTimeStatusforNP)AllP1AnyNP int out,
	@intIdentityStatus0Success1Exception int out,
	@intPolynomialTimeStatusforNPhighDifference int out,
	@intPolynomialTimeStatusforNPAverageDifference int,
	@intPolynomialTimeStatusforNPPercentNPOverP int,
	@polynomialTimeStatusforNP0AllP1AnyNP int = @intPolynomialTimeStatusforNP0AllP1AnyNP,
	@identityStatus0Success1Exception int = intIdentityStatus0Success1Exceptionl,
	@polynomialTimeStatusforNPhighDifference int = @intPolynomialTimeStatusforNPhighDifference,
	@polynomialTimeStatusforNPAverageDifference int = @intPolynomialTimeStatusforNPAverageDifference,
	@polynomialTimeStatusforNPPercentNPOverP int = @intPolynomialTimeStatusforNPPercentNPOverP,
	@intReturnStatus int = 0


WITH Recompile

AS BEGIN

/***** declarations  *****/
/***** cast input parameter values into protected variables *****/

Declare @transactionName nvarchar(max) = @stringTransactionName,
	@param1 nvarchar (max) = @stringParam1, 
	@param2 nvarchar (max) = @stringParam2, 
	@param3 nvarchar(max) = @stringParam3, 
	@param4 nvarchar(max) = @stringParam4, 
	@param5 int = @intParam5,
	@param6 int = @intParam6,
	@param7 int = @intParam7,
	@param8 int = @intParam8,
	@param9Out nvarchar(max) = @stringParam9Out,
	@param10out nvarchar (max) = @stringParam10Out, 
	@param11Out int = @intPara11Out,
	@param12Out int = @intParam12Out,
	@identity nvarchar (max) = @stringidentity,
	@polynomialTimeStatusforNP nvarchar(max) = @stringPolynomialTimeStatusforNP,
	@polynomialTimeStatusforNP0AllP1AnyNP int = @intPolynomialTimeStatusforNP0AllP1AnyNP,
	@identityStatus0Success1Exception int = intIdentityStatus0Success1Exceptionl,
	@polynomialTimeStatusforNPhighDifference int = @intPolynomialTimeStatusforNPhighDifference,
	@polynomialTimeStatusforNPAverageDifference int = @intPolynomialTimeStatusforNPAverageDifference,
	@polynomialTimeStatusforNPPercentNPOverP int = @intPolynomialTimeStatusforNPPercentNPOverP,
	@olynomialTimeAggregate float = 0.0000000,
	@beginDatetime datetime = GetDate(),
	@concludeDateTime datetime, 
	@baseLinePolynomialTimeMilliseconds int = 0,
	@polynomialTimeThresholdExceededCounter int = 0, 
	@counterforIterations int = 0,
	@returnStatus int = 0 =@intReturnStatus int = 0;
	@innerTransaction int = null;
	
/***** cinoare udebtudtt ysed fir authoirzation peroceudre
	with identity used by calling application *****/
	If trim(@identity) = trim(USER_ID())
		Begin
			Set @identityStatus0Success1Exception = 0;
		End
	Else
		Begin
			Set @identityStatus0Success1Exception =1;
		End

Begin Try

	Set Transaction Isolation Level Read Commited;
	Set Xact_Abort On;
	Begin Transaction OuterTransaction;
		Set @innerTransaction = 1;

		Begin Transaction InnerTransaction;
		Set @innerTransaction = '0';



	/***** cinoare udebtudtt ysed fir authoirzation peroceudre
		with identity used by calling application *****/
		Set @beginDatetime = GetDate();
	





		/*****conclude iteration or inner transaction*****/

		/*****get date and timie *****/
		Set @concludeDateTime = GetDate();

		/*****derive iteration level statistics *****/
		If @counterforIterations < 1
			Begin
				Set @baseLinePolynomialTimeMilliseconds =  DATEDIFF(millisecond, @beginDateTime, @concludeDateTime);
				Set @polynomialTimeStatusforNPhighDifference = DATEDIFF(millisecond, @beginDateTime, @concludeDateTime);
				Set @olynomialTimeAggregate = @olynomialTimeAggregate + DATEDIFF(millisecond, @beginDateTime, @concludeDateTime);
				Set @counterforIterations += 1;
			End
		Else
			Begin
				If @polynomialTimeStatusforNPhighDifference < DATEDIFF(millisecond, @beginDateTime, @concludeDateTime)
					Begin 
						Set @polynomialTimeStatusforNPhighDifference = DATEDIFF(millisecond, @beginDateTime, @concludeDateTime);
						Set @polynomialTimeStatusforNP0AllP1AnyNP = 1;
						Set @polynomialTimeThresholdExceededCounter +=1;
					End; 
				Set @olynomialTimeAggregate = @olynomialTimeAggregate + DATEDIFF(millisecond, @beginDateTime, @concludeDateTime);
				Set @counterforIterations += 1;
			End
	/***** insert inner transaction iteration data into transaction log table *****/
		Insert into dbo.TransactionsLog (transactionName,
									InnerTransaction,
									param1, 
									param2, 
									param3, 
									param4, 
									param5,
									param6,
									param7,
									param8,
									param9Out,
									param10out, 
									param11Out,
									param12Out,
									identityidentity,
									polynomialTimeStatusforNP,
									polynomialTimeStatusforNP0AllP1AnyNP,
									identityStatus0Success1Exception,
									polynomialTimeStatusforNPhighDifference,
									polynomialTimeStatusforNPAverageDifference,
									polynomialTimeStatusforNPPercentNPOverP,
									polynomialTimeAggregate,
									beginDatetime,
									concludeDateTime, 
									baseLinePolynomialTimeMilliseconds,
									polynomialTimeThresholdExceededCounter, 
									counterforIterations,
									returnStatus,)
			Values ( @TransactionName,
				@innerTransaction,
				@param1, 
				@param2, 
				@param3, 
				@param4,
				@param5,
				@param6,
				@param7,
				@param8,
				@param9Out,
				@param10out, 
				@param11Out,
				@param12Out,
				@identity,
				@polynomialTimeStatusforNP, 
				@polynomialTimeStatusforNP0AllP1AnyNP,
				@identityStatus0Success1Exception, 
				@polynomialTimeStatusforNPhighDifference,
				@polynomialTimeStatusforNPAverageDifference,
				@polynomialTimeStatusforNPPercentNPOverP,
				@olynomialTimeAggregate,
				@beginDatetime,
				@concludeDateTime, 
				@baseLinePolynomialTimeMilliseconds,
				@polynomialTimeThresholdExceededCounter, 
				@counterforIterations,
				@returnStatus);

	/***** assay returnStatus and commit inner transaction if 0 or rollback transaction if 1*****/		
		If @returnStatus = 0
			Begin  
				Commit Transaction InnerTransaction;
			End
		Else
			Begin
				Rollbaack Transaction InnerTransaction;
			END

/***** finalize statistics and aggregates, concluding outer transaction*****/
	Set @polynomialTimeStatusforNPPercentNPOverP = (@polynomialTimeThresholdExceededCounter + 1) / ((@counterforInterations + 1) 
	Set @polynomialTimeStatusforNPAverageDifference = @polynomialTimeAggregate / (polynomialTimeThresholdExceededCounter + 1)
	Set @innerTransaction = 1;

	/***** insert outer transaction iteration data into transaction log table *****/
		Insert into dbo.TransactionsLog (transactionName,
									InnerTransaction,
									identityidentity,
									polynomialTimeStatusforNP,
									polynomialTimeStatusforNP0AllP1AnyNP,
									identityStatus0Success1Exception,
									polynomialTimeStatusforNPhighDifference,
									polynomialTimeStatusforNPAverageDifference,
									polynomialTimeStatusforNPPercentNPOverP,
									polynomialTimeAggregate,
									beginDatetime,
									concludeDateTime, 
									baseLinePolynomialTimeMilliseconds,
									polynomialTimeThresholdExceededCounter, 
									counterforIterations,
									returnStatus,)
			Values ( @TransactionName,
				@innerTransaction,
				@identity,
				@polynomialTimeStatusforNP, 
				@polynomialTimeStatusforNP0AllP1AnyNP,
				@identityStatus0Success1Exception, 
				@polynomialTimeStatusforNPhighDifference,
				@polynomialTimeStatusforNPAverageDifference,
				@polynomialTimeStatusforNPPercentNPOverP,
				@olynomialTimeAggregate,
				@beginDatetime,
				@concludeDateTime, 
				@baseLinePolynomialTimeMilliseconds,
				@polynomialTimeThresholdExceededCounter, 
				@counterforIterations,
				@returnStatus);

/***** assay transcount, if 1 then commit uter transaction, otherwise rollback outer transaction*****/
	If @@TRANSCOUNT = 1
		Begin
			Commit Transaction OuterTransaction;
		End
	Else
		Begin
			Rollback Transaction OuterTransaction;
		End;
/***** cast protected variables outcomes into parametervalues *****/
	Select @stringTransactionName = @transactionName,
	@stringParam1 =@param1, 
	@stringParam2 = @param2, 
	@stringParam3 = @param3, 
	@stringParam4 = @param4, 
	@intParam5 = @param5,
	@intParam6 = @param6,
	@intParam7 = @param7,
	@intParam8 = @param8,
	@stringParam9 = @param9Out,
	@stringParam10Out = @param10out, 
	@intPara11Out = @param11Out,
	@intParam12Out = @param12Out,
	@stringidentity = @identity,
	@stringPolynomialTimeStatusforNP = @polynomialTimeStatusforNP, 
	@intPolynomialTimeStatusforNP0AllP1AnyNP = @polynomialTimeStatusforNP0AllP1AnyNP,
	intIdentityStatus0Success1Exceptionl == @identityStatus0Success1Exception, 
	@intPolynomialTimeStatusforNPhighDifference = @polynomialTimeStatusforNPhighDifference,
	@intPolynomialTimeStatusforNPAverageDifference = @polynomialTimeStatusforNPAverageDifference,
	@intPolynomialTimeStatusforNPPercentNPOverP = @polynomialTimeStatusforNPPercentNPOverP;


		/***** Archiveal process from TransactionsLog into TransactionsLogArchive 
			when rows in TransactionsLog is greater than 1 year *****/
		Insert into dbo.TransactionLogArchive ( transactionsLogIdentity,
										transactionName,
										InnerTransaction,
										param1, 
										param2, 
										param3, 
										param4, 
										param5,
										param6,
										param7,
										param8,
										param9Out,
										param10out, 
										param11Out,
										param12Out,
										identityidentity,
										polynomialTimeStatusforNP,
										polynomialTimeStatusforNP0AllP1AnyNP,
										identityStatus0Success1Exception,
										polynomialTimeStatusforNPhighDifference,
										polynomialTimeStatusforNPAverageDifference,
										polynomialTimeStatusforNPPercentNPOverP,
										polynomialTimeAggregate,
										beginDatetime,
										concludeDateTime, 
										baseLinePolynomialTimeMilliseconds,
										polynomialTimeThresholdExceededCounter, 
										counterforIterations,
										returnStatus)
			Select transactionsLogIdentity,
				transactionName,
				InnerTransaction,
				param1, 
				param2, 
				param3, 
				param4, 
				param5,
				param6,
				param7,
				param8,
				param9Out,
				param10out, 
				param11Out,
				param12Out,
				identityidentity,
				polynomialTimeStatusforNP,
				polynomialTimeStatusforNP0AllP1AnyNP,
				identityStatus0Success1Exception,
				polynomialTimeStatusforNPhighDifference,
				polynomialTimeStatusforNPAverageDifference,
				polynomialTimeStatusforNPPercentNPOverP,
				polynomialTimeAggregate,
				beginDatetime,
				concludeDateTime, 
				baseLinePolynomialTimeMilliseconds,
				polynomialTimeThresholdExceededCounter, 
				counterforIterations,
				returnStatus
				From dbo.TransactionsLog As TSL with (NoLock)
				Where TSL.Updated < DATEADD(Year, -1, GETDATE());

	/***** null value assignment to protected variables *****/
	Select @TransactionName = null,
	@innerTransaction = null,
	@param1 = null, 
	@param2 = null, 
	@param3 = null, 
	@param4 = null,
	@param5 = null,
	@param6 = null,
	@param7 = null,
	@param8 = null,
	@param9Out = null,
	@param10out = null, 
	@param11Out = null,
	@param12Out = null,
	@identity = null,
	@polynomialTimeStatusforNP = null, 
	@polynomialTimeStatusforNP0AllP1AnyNP = null,
	@identityStatus0Success1Exception = null, 
	@polynomialTimeStatusforNPhighDifference = null,
	@polynomialTimeStatusforNPAverageDifference, = null
	@polynomialTimeStatusforNPPercentNPOverP = null;
	@olynomialTimeAggregate = null,
	@beginDatetime = null,
	@concludeDateTime = null, 
	@baseLinePolynomialTimeMilliseconds = null,
	@polynomialTimeThresholdExceededCounter = null, 
	@counterforIterations = null,
	@returnStatus = null;
	
End Try
Begin Catch

	Rollback Transaction OuterTransactions;

	/***** iset exception status*****/
	Set innerTransaction = 7;
	Set @returnStatus = 1;
	Set @intReturnStatus i= WreturnSatus;

		/***** insert outer transaction iteration data into transaction log table *****/
		Insert into dbo.TransactionsLog (transactionName,
									InnerTransaction,
									identityidentity,
									polynomialTimeStatusforNP,
									polynomialTimeStatusforNP0AllP1AnyNP,
									identityStatus0Success1Exception,
									polynomialTimeStatusforNPhighDifference,
									polynomialTimeStatusforNPAverageDifference,
									polynomialTimeStatusforNPPercentNPOverP,
									polynomialTimeAggregate,
									beginDatetime,
									concludeDateTime, 
									baseLinePolynomialTimeMilliseconds,
									polynomialTimeThresholdExceededCounter, 
									counterforIterations,
									returnStatus,)
			Values ( @TransactionName,
				@innerTransaction,
				@identity,
				@polynomialTimeStatusforNP, 
				@polynomialTimeStatusforNP0AllP1AnyNP,
				@identityStatus0Success1Exception, 
				@polynomialTimeStatusforNPhighDifference,
				@polynomialTimeStatusforNPAverageDifference,
				@polynomialTimeStatusforNPPercentNPOverP,
				@olynomialTimeAggregate,
				@beginDatetime,
				@concludeDateTime, 
				@baseLinePolynomialTimeMilliseconds,
				@polynomialTimeThresholdExceededCounter, 
				@counterforIterations,
				@returnStatus);

/***** null value assignment to protected variables *****/
	Select @TransactionName = null,
	@innerTransaction = null,
	@param1 = null, 
	@param2 = null, 
	@param3 = null, 
	@param4 = null,
	@param5 = null,
	@param6 = null,
	@param7 = null,
	@param8 = null,
	@param9Out = null,
	@param10out = null, 
	@param11Out = null,
	@param12Out = null,
	@identity = null,
	@polynomialTimeStatusforNP = null, 
	@polynomialTimeStatusforNP0AllP1AnyNP = null,
	@identityStatus0Success1Exception = null, 
	@polynomialTimeStatusforNPhighDifference = null,
	@polynomialTimeStatusforNPAverageDifference, = null
	@polynomialTimeStatusforNPPercentNPOverP = null;
	@olynomialTimeAggregate = null,
	@beginDatetime = null,
	@concludeDateTime = null, 
	@baseLinePolynomialTimeMilliseconds = null,
	@polynomialTimeThresholdExceededCounter = null, 
	@counterforIterations = null,
	@returnStatus = null;

End Catch

END
GO

