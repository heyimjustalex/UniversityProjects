
USE RDB_fire_police_vsmall_T1
BULK INSERT Caller
FROM 'C:\Users\root\Desktop\fire_police_git\vsmall\RDB_fire_police\Data\Small\T1\Caller.csv'
WITH (FORMAT='CSV');


BULK INSERT Dispatcher
FROM 'C:\Users\root\Desktop\fire_police_git\vsmall\RDB_fire_police\Data\Small\T1\Dispatcher.csv'
WITH (FORMAT='CSV');


BULK INSERT Facility
FROM 'C:\Users\root\Desktop\fire_police_git\vsmall\RDB_fire_police\Data\Small\T1\Facility.csv'
WITH (FORMAT='CSV');



BULK INSERT Intervention_type
FROM 'C:\Users\root\Desktop\fire_police_git\vsmall\RDB_fire_police\Data\Small\T1\Types.csv'
WITH (FORMAT='CSV');

BULK INSERT Worker_in_action
FROM 'C:\Users\root\Desktop\fire_police_git\vsmall\RDB_fire_police\Data\Small\T1\WorkerInAction.csv'
WITH (FORMAT='CSV');



BULK INSERT Notification
FROM 'C:\Users\root\Desktop\fire_police_git\vsmall\RDB_fire_police\Data\Small\T1\Notification.csv'
WITH (FORMAT='CSV');



BULK INSERT Crew_on_intervention
FROM 'C:\Users\root\Desktop\fire_police_git\vsmall\RDB_fire_police\Data\Small\T1\CrewOnIntervention.csv'
WITH (FORMAT='CSV');



BULK INSERT Intervention
FROM 'C:\Users\root\Desktop\fire_police_git\vsmall\RDB_fire_police\Data\Small\T1\Intervention.csv'
WITH (FORMAT='CSV');



BULK INSERT Vehicle
FROM 'C:\Users\root\Desktop\fire_police_git\vsmall\RDB_fire_police\Data\Small\T1\Vehicle.csv'
WITH (FORMAT='CSV');


BULK INSERT Ticket
FROM 'C:\Users\root\Desktop\fire_police_git\vsmall\RDB_fire_police\Data\Small\T1\Ticket.csv'
WITH (FORMAT='CSV');



BULK INSERT Worker
FROM 'C:\Users\root\Desktop\fire_police_git\vsmall\RDB_fire_police\Data\Small\T1\Worker.csv'
WITH (FORMAT='CSV');

