IF EXISTS ( SELECT * 
            FROM   sysobjects 
            WHERE  id = object_id(N'[dbo].[StoredProcedureTemplate]') 
                   and OBJECTPROPERTY(id, N'IsProcedure') = 1 )
BEGIN
    DROP PROCEDURE [dbo].StoredProcedureTemplate
END

GO

CREATE PROCEDURE dbo.StoredProcedureTemplate 
	@var1 nvarchar(30) = NULL, 
	@var2 nvarchar(60) = NULL
AS
BEGIN
  BEGIN TRY
    BEGIN TRANSACTION;
      -- My transaction
    COMMIT TRANSACTION;
  END TRY
  BEGIN CATCH
    IF @@TRANCOUNT > 0
    ROLLBACK TRANSACTION;
 
    DECLARE @ErrorNumber INT = ERROR_NUMBER();
    DECLARE @ErrorLine INT = ERROR_LINE();
    DECLARE @ErrorMessage NVARCHAR(4000) = ERROR_MESSAGE();
    DECLARE @ErrorSeverity INT = ERROR_SEVERITY();
    DECLARE @ErrorState INT = ERROR_STATE();
 
    --PRINT 'Actual error number: ' + CAST(@ErrorNumber AS VARCHAR(10));
    --PRINT 'Actual line number: ' + CAST(@ErrorLine AS VARCHAR(10));
 
    RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
  END CATCH
END
GO