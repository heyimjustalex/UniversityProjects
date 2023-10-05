use DW_fire_police_vsmall
go
Declare @start_date date;
Declare @end_date date;

SELECT @start_date = '1900-01-01',@end_date = '2021-12-31';

Declare @date_in_process datetime = @start_date;


While @date_in_process <= @end_date
	Begin
		Insert Into DW_fire_police_vsmall.dbo.Date
		(year,
		month,
		day)
		Values(
		CONVERT(int, Year(@date_in_process)),
		CONVERT(int, Month(@date_in_process)),
		CONVERT(int, Day(@date_in_process))
		);
		Set @date_in_process = DateAdd(d,1,@date_in_process);
	End
go

SELECT * FROM Date