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
	SELECT 'My data retrieval here'
GO