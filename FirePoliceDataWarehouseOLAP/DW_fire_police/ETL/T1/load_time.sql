use DW_fire_police_vsmall

go
Declare @start_minute int;
Declare @start_hour int;

SELECT @start_minute = 0;
SELECT @start_hour = 0;

while @start_hour < 24
begin
	while @start_minute < 60
	begin
		INSERT INTO dbo.Time(hours,minutes) VALUES (@start_hour, @start_minute)
		set @start_minute = @start_minute+ 1;
	end
	set @start_hour = @start_hour +1;
	set @start_minute = 0;
end

SELECT * FROM dbo.Time