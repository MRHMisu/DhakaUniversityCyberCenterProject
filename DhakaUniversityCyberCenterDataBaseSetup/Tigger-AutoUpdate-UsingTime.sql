CREATE TRIGGER TiggerAfterUpdateFinishingTime ON [dbo].[CardUsage] 
FOR UPDATE
AS
	declare @CardUsageId int;
	select @CardUsageId=i.CardUsageId from inserted i;			
	UPDATE CardUsage SET UsingTime=DATEDIFF(ss,StartingTime,FinishingTime) WHERE CardUsageId=@CardUsageId;
GO

