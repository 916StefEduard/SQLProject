create database Appointments
 
create table Doctor(
	DoctorId int not null primary key,
	DoctorName varchar(255) not null,
)

create table Patient(
	PatientId int not null primary key,
	PatientName varchar(255) not null,
)

create table Appointments(
	DoctorId int not null,
	PatientId int not null,
	AppointmentDate varchar(255) primary key,
	foreign key (DoctorId) references Doctor(DoctorId),
	foreign key (PatientId) references Patient(PatientId),
	unique (DoctorId,PatientId)
)
drop table Medicine 
create table Medicine(
	MedicineId int not null primary key,
	PatientId int not null foreign key references Patient(PatientId),
	MedicineName varchar(255) not null,
	Cost int not null,
	PharmacyName varchar(255) 
)

create table Nurse(
	NurseId int not null primary key,
	NurseName varchar(255),
)
drop table  Room 
create table Room(
	RoomId int not null primary key,
	RoomType varchar(255),
)
drop table Treatment 
create table Treatment(
	TreatmentId int not null primary key,
	TreatmentName varchar(255),
	TreatmentRoom varchar(255),  
	TreatmentTime varchar(255) default  '1hour',
	PatientId int not null foreign key references Patient(PatientId),
)
drop table Disease 
create table Disease(
	DiseaseName varchar(255) primary key,
	PatientId int not null foreign key references Patient(PatientId),
	DiseaseLength int not null,
)

drop table Department 
create table Department(
	DepartmentId int not null primary key,
	DepartmentName varchar(255) not null,
	DepartmentType varchar(255) not null,
	DepartmentRoom int not null,
	DoctorId int not null foreign key references Doctor(DoctorId)
)

drop table University
create table University(
	MedicalSchoolId int not null primary key,
	DoctorId int not null foreign key references Doctor(DoctorId),
	NurseId int not null foreign key references Nurse(NurseId),
	MedicalSchoolName varchar(255),
)
drop table Hospital
create table Hospital(
	HospitalId int not null primary key,
	HospitalName varchar(255),
	Street varchar(255),
	DoctorId int not null foreign key references Doctor(DoctorId),
	RoomId int,
	constraint FK_Hospital unique (HospitalId,HospitalName)
)

drop table PrivateClinic
create table PrivateClinic(
	DoctorId int not null foreign key references Doctor(DoctorId),
	RoomId int not null  foreign key references Room(RoomId), 
	Street varchar(255) primary key,
	ClinicFloor int not null default 0,
)
drop table Computer 
create table Computer(
	ComputerId int not null,
	ComputerName varchar(255),
)

--insert statements

insert into Doctor(DoctorId,DoctorName) values(1,'Andrei')
insert into Doctor(DoctorId,DoctorName) values(2,'Razvan')
insert into Doctor(DoctorId,DoctorName) values(3,'Mihai')
insert into Doctor(DoctorId,DoctorName) values(4,'Tudor')

insert into Patient(PatientId,PatientName) values(21,'Alexandru')
insert into Patient(PatientId,PatientName) values(22,'Andreea')
insert into Patient(PatientId,PatientName) values(23,'Diana')
insert into Patient(PatientId,PatientName) values(15,'Andrei')
insert into Patient(PatientId,PatientName) values(12,'Tudor')

insert into Appointments(DoctorId,PatientId,AppointmentDate) values(1,21,'12.01.2011')
insert into Appointments(DoctorId,PatientId,AppointmentDate) values(2,22,'21.09.2015')
insert into Appointments(DoctorId,PatientId,AppointmentDate) values(3,15,'23.01.2001')
insert into Appointments(DoctorId,PatientId,AppointmentDate) values(2,12,'25.06.2015')
insert into Appointments(DoctorId,PatientId,AppointmentDate) values(3,21,'23.11.2011')
insert into Appointments(DoctorId,PatientId,AppointmentDate) values(3,12,'23.09.2041')

insert into Medicine(MedicineId,PatientId,MedicineName,Cost) values (1,21,'Aspirin',10)
insert into Medicine(MedicineId,PatientId,MedicineName,Cost) values (2,22,'Ibuprofen',8)
insert into Medicine(MedicineId,PatientId,MedicineName,Cost) values (3,22,'Antibiotics',7)
insert into Medicine(MedicineId,PatientId,MedicineName,Cost) values (6,15,'Aspirin',15)
insert into Medicine(MedicineId,PatientId,MedicineName,Cost) values (7,12,'Aspirin',25)
insert into Medicine(MedicineId,PatientId,MedicineName,Cost) values (9,22,'Aspirin',50)

insert into Nurse(NurseId,NurseName) values (62,'George')
insert into Nurse(NurseId,NurseName) values (72,'Roxana')
insert into Nurse(NurseId,NurseName) values (100,'Adriana')

insert into Room(RoomId,RoomType) values (100,'square')
insert into Room(RoomId,RoomType) values (101,'circle')
insert into Room(RoomId,RoomType) values (102,'triangle')
insert into Room(RoomId,RoomType) values (1000,'RadiationRoom')

insert into PrivateClinic(DoctorId,RoomId,Street) values(1,100,'Nicolae Titulescu')
insert into PrivateClinic(DoctorId,RoomId,Street) values(2,101,'Avram Iancu')
insert into PrivateClinic(DoctorId,RoomId,Street) values(3,102,'Gheorghe Sincai')
insert into PrivateClinic(DoctorId,RoomId,Street) values(4,1000,'Vasile Lucaciu')

insert into Treatment(TreatmentId,TreatmentName,PatientId,TreatmentRoom) values(1,'Therapy',21,12)
insert into Treatment(TreatmentId,TreatmentName,PatientId,TreatmentRoom) values(2,'Surgery',22,25)
insert into Treatment(TreatmentId,TreatmentName,PatientId,TreatmentRoom) values(3,'Hormonal',23,65)
insert into Treatment(TreatmentId,TreatmentName,PatientId,TreatmentRoom) values(4,'Radiation',21,75)
insert into Treatment(TreatmentId,TreatmentName,PatientId,TreatmentRoom) values(5,'Therapy',12,100)
insert into Treatment(TreatmentId,TreatmentName,PatientId,TreatmentRoom) values(7,'Stem-Cell',12,100)
insert into Treatment(TreatmentId,TreatmentName,PatientId,TreatmentRoom) values(10,'Stem-Cell',23,100)

insert into Disease(DiseaseName,PatientId,DiseaseLength) values ('Covid-19',22,10)
insert into Disease(DiseaseName,PatientId,DiseaseLength) values('Flu',21,20)
insert into Disease(DiseaseName,PatientId,DiseaseLength) values('Tioride',23,50)
insert into Disease(DiseaseName,PatientId,DiseaseLength) values('Cold',22,75)
insert into Disease(DiseaseName,PatientId,DiseaseLength) values('Asthma',22,100)

insert into Department(DepartmentId,DepartmentName,DepartmentType,DepartmentRoom,DoctorId) values(12,'Kids','Cardiology',11,1)
insert into Department(DepartmentId,DepartmentName,DepartmentType,DepartmentRoom,DoctorId) values(67,'Urgency','Endocrinology',22,2)
insert into Department(DepartmentId,DepartmentName,DepartmentType,DepartmentRoom,DoctorId) values(85,'Room6','Endocrinology',32,2)
insert into Department(DepartmentId,DepartmentName,DepartmentType,DepartmentRoom,DoctorId) values(90,'Room6','Cardiology',60,3)
insert into Department(DepartmentId,DepartmentName,DepartmentType,DepartmentRoom,DoctorId) values(700,'Names','Dermatology',100,3)

insert into University(MedicalSchoolId,DoctorId,NurseId,MedicalSchoolName) values(12,1,62,'Iuliu Hatieganu')
insert into University(MedicalSchoolId,DoctorId,NurseId,MedicalSchoolName) values(15,2,72,'Carol Davila')
insert into University(MedicalSchoolId,DoctorId,NurseId,MedicalSchoolName) values(35,3,62,'Victor Babes')
insert into University(MedicalSchoolId,DoctorId,NurseId,MedicalSchoolName) values(65,4,62,'Grigore Popa')

insert into Hospital(HospitalId,HospitalName,Street,DoctorId,RoomId) values(100,'Constantin Opris','Hollosy Simon Street',1,100)
insert into Hospital(HospitalId,HospitalName,Street,DoctorId,RoomId) values(200,'Elias','Iuliu Maniu',2,101)
insert into Hospital(HospitalId,HospitalName,Street,DoctorId,RoomId) values(10,'Elias','Tudor Maniu',3,102)
insert into Hospital(HospitalId,HospitalName,Street,DoctorId,RoomId) values(68,'Avram Iancu','Avram Iancu',4,102)

insert into Computer(ComputerId,ComputerName) values(1,'Asus')
insert into Computer(ComputerId,ComputerName) values(2,'Acer')
insert into Computer(ComputerId,ComputerName) values(3,'Dell')

-- HomeWork 2 ---

--update statements 

update Nurse
set  NurseName='Alexandra'
where NurseId=62

update Doctor
set DoctorName='Bogdan'
where DoctorId = 4

update Room 
set RoomType = 'NewRoom'
where RoomId = 1000

--delete statements

delete from Nurse
where NurseName = 'Adriana'

delete from Disease
where DiseaseName = 'Asthma'

select * from Patient 
select * from Appointments
select * from Doctor
select * from Medicine 
select * from Nurse 
select * from Room 
select * from Treatment
select * from Department 
select * from University
select * from Hospital 
select * from Disease 
select * from PrivateClinic
select * from Computer 

select Treatment.PatientId,Patient.PatientName
from Treatment 
inner join Patient on Patient.PatientId = Treatment.PatientId 

select Medicine.MedicineName,Medicine.PatientId
from Medicine,Treatment 
inner join Patient on Patient.PatientId = Treatment.PatientId 

--a. 2 queries with the union operation; use UNION [ALL] and OR;
--select Patients who have an id of over 20 or have the treatement name = 'Therapy'

select P.PatientId 
from Patient P 
where P.PatientId > 20
union
select T.PatientId 
from Treatment T
where T.TreatmentName='Therapy'

--select Patients who have an id of over 20 or who have to take the medicine ='Aspirin'

select distinct P.PatientId 
from Patient P,Medicine M
where P.PatientId > 20 or (M.PatientId=P.PatientId and M.MedicineName='Aspirin') 


--b. 2 queries with the intersection operation; use INTERSECT and IN;
--select the doctors who work at bots the hospital Constantin Opris and Elias

select D.DoctorName
from Hospital H,Doctor D
where H.HospitalName='Elias' and H.DoctorId=D.DoctorId
intersect
select D.DoctorName
from Doctor D,Hospital H
where H.HospitalName = 'Constantin Opris' and H.DoctorId=D.DoctorId


--select patients who need both treatement with Radiation and with Therapy

select P.PatientId
from Patient P,Treatment T
where P.PatientId=T.PatientId and T.TreatmentName='Radiation' and P.PatientId in (
		select P2.PatientId
		from Patient P2,Treatment T2
		where P2.PatientId=T2.PatientId and T2.TreatmentName='Therapy'
)

--c. 2 queries with the difference operation; use EXCEPT and NOT IN;
--select Patients  who have to take the medicine ='Aspirin' and not 'Ibuprofen'

select P.PatientName  
from Patient P,Medicine M
where M.PatientId = P.PatientId and M.MedicineName = 'Aspirin'
except
select P.PatientName
from Patient P,Medicine M
where M.PatientId = P.PatientId and M.MedicineName = 'Ibuprofen'

--select Patients  who have take the treatement 'Stem-cell' but not Therapy

select P.PatientId 
from Patient P,Treatment T
where P.PatientId=T.PatientId and T.TreatmentName='Stem-cell' and T.PatientId not in(
	select P.PatientId 
	from Patient P,Treatment T 
	where P.PatientId=T.PatientId and T.TreatmentName='Therapy'
)

--d. 4 queries with INNER JOIN, LEFT JOIN, RIGHT JOIN, and FULL JOIN (one query per operator); 
--one query will join at least 3 tables, while another one will join at least two many-to-many relationships;

--inner join with Patients  and Treatment and Disease 
select P.PatientName,T.TreatmentName,D.DiseaseName
from Patient P
inner join Treatment T on P.PatientId=T.PatientId
inner join Disease D on D.PatientId=P.PatientId 

--left join with Appointment date and DoctorId for m:n relationship between2 
select P2.PatientName, A.AppointmentDate,A.DoctorId,P1.RoomId
from Appointments A
left outer join PrivateClinic P1 
on  P1.DoctorId = A.DoctorId
left outer join Doctor D
on D.DoctorId = A.DoctorId
left outer join Patient P2
on P2.PatientId = A.PatientId
left outer join Room R
on R.RoomId = P1.RoomId

--right join for doctors and universities
select  University.MedicalSchoolName,Doctor.DoctorName
from University
right join Doctor on Doctor.DoctorId = University.DoctorId

--full join for hospitals with doctors
select Doctor.DoctorName,Hospital.HospitalName
from Hospital
full join Doctor on Doctor.DoctorId = Hospital.DoctorId

--e. 2 queries with the IN operator and a subquery in the WHERE clause; 
--in at least one case, the subquery should include a subquery in its own WHERE clause;

--select the names of patients who have to take the medicine Ibuprofen

select P.PatientName
from Patient P 
where P.PatientId in (
	select M.PatientId
	from Medicine M 
	where M.MedicineName='Ibuprofen'
) 

--select the names of doctors who work in a hospital

select D.DoctorName
from Doctor D
where D.DoctorId in (
	select Hospital.DoctorId
	from Hospital
)
group by D.DoctorName

-- f. 2 queries with the EXISTS operator and a subquery in the WHERE clause;

--select the top 2 names of doctors who have appointments

select top 2 D.DoctorName
from Doctor D
where exists (
	select A.DoctorId
	from Appointments A
	where A.PatientId > 0
)

--select the names of doctor who have been to universities starting with the Letter 

select D.DoctorId,D.DoctorName
from Doctor D
where exists (
	select U.DoctorId
	from University U
	where U.MedicalSchoolName like 'I%'
	and D.DoctorId = U.DoctorId
)
select * from University 

-- g. 2 queries with a subquery in the FROM clause;

--select all doctors who went to the university Carol Davila

select DoctorName,DoctorId
from (
	select D.DoctorName,D.DoctorId
	from Doctor D
	inner join University U on U.DoctorId = D.DoctorId and U.MedicalSchoolId in (
		select U2.MedicalSchoolId
		from University U2 
		where U2.MedicalSchoolName = 'Carol Davila'
	)
)as T
select * from University

--select all rooms of hospitals which have an id below 100
select RoomId
from (
	select R.RoomId
	from Room R
	inner join Hospital H on H.RoomId = R.RoomId and H.HospitalName in (
		select H.HospitalName
		from Hospital H
		where H.HospitalId < 100
	)
)as T

--h. 4 queries with the GROUP BY clause, 3 of which also contain the HAVING clause; 2 of 
--the latter will also have a subquery in the HAVING clause; use the aggregation operators: COUNT, SUM, AVG, MIN, MAX;

--select the department name and the frequency where doctors have an id bigger than 1 and are grouped by department name

select count(D.DepartmentName),D.DepartmentName
from Department D
group by D.DepartmentName
having count(D.DoctorId) >= 1

--select Treatments grouped by id and name and have an id bigger than the average id of the table

select distinct T.TreatmentName,T.PatientId
from Treatment T
group by T.PatientId,T.TreatmentName
having T.PatientId >= any(
	select avg(T.PatientId)
	from Treatment T
)

--select the medicine which has a value over the minimum value for a medicine

select distinct M.MedicineName
from Medicine M
group by M.MedicineName,M.Cost 
having M.Cost >= any(
	select min(M.Cost)
	from Medicine M
)

--select diseases which have the lenght lower than the maximum number of days

select distinct D.DiseaseName 
from Disease D
group by D.DiseaseName,D.DiseaseLength
having D.DiseaseLength <= any(
	select max(D.DiseaseLength)
	from Disease D
)

--i. 4 queries using ANY and ALL to introduce a subquery in the WHERE clause (2 queries per operator); 
--rewrite 2 of them with aggregation operators, and the other 2 with IN / [NOT] IN.

--select all patients who have the disease Flu

select P.PatientName 
from Patient P
where P.PatientId = any(
	select D.PatientId
	from Disease D
	where D.DiseaseName='Flu'
)

--select doctors who have an id over the ones that went to university

select D.DoctorName
from Doctor D
where D.DoctorId > all(
	select min(U.DoctorId)
	from University U
)

--select nurses who went to the same university as a certain doctor

select N.NurseName
from Nurse N
where N.NurseId = any(
	select U.NurseId
	from University U
	where U.DoctorId in (
		select D.DoctorId
		from Doctor D
	)
)
order by N.NurseId 

--select the first 2 patients who have an appointment to a doctor 

select top 2 P.PatientName
from Patient P+
where P.PatientId = all(
	select A.PatientId
	from Appointments A
	where A.DoctorId not in(
		select D.DoctorId
		from Doctor D
	)
)
order by P.PatientName

-- HomeWork 3 ----
-- a. modify the type of a column;
--we modify the type of the column DepartmentRoom from the department table
--from int to char and the reverse
go 
create procedure modifyTypeDepartment
as
	alter table Department
	alter column DepartmentRoom varchar(255)
go

go
create procedure modifyTypeBackDepartment
as
	alter table Department
	alter column DepartmentRoom int
go

exec modifyTypeDepartment
exec modifyTypeBackDepartment
drop procedure modifyTypeDepartment
drop procedure modifyTypeBackDepartment 

--we check if the modification worked
select * from Department
insert into Department(DepartmentId,DepartmentName,DepartmentType,DepartmentRoom,DoctorId) values(500,'pediatrics',1,'a',1)
delete from Department where DepartmentId = 500

-- b. add / remove a column;
-- we add/delete the column TreatmentRoom from the table Treatment

go
create procedure deleteTreatmentRoom
as
	alter table Treatment
	drop column TreatmentRoom
go

go
create procedure addTreatmentRoom
as
	alter table Treatment
	add  TreatmentRoom int
go

select * from Treatment 

exec addTreatmentRoom
exec deleteTreatmentRoom
drop procedure addTreatmentRoom
drop procedure deleteTreatmentRoom


-- c. add / remove a DEFAULT constraint;
--we add/remove a default constraint to the row PharmancyName from the Medicine table

go
create procedure addMedicineConstraint
as
	alter table Medicine
	add constraint df_Medicine default 'Catena' for PharmacyName 
go

go
create procedure removeMedicineConstraint
as
	alter table Medicine
	drop constraint df_Medicine 
go

select * from Medicine  
exec addMedicineConstraint
exec removeMedicineConstraint
drop procedure addMedicineConstraint
drop procedure removeMedicineConstraint

--if we add this element we will get the default constraint for the PharamacyName
insert into Medicine(MedicineId,MedicineName,PatientId,Cost) values(100,'TantumVerde',21,20)
delete from Medicine where MedicineId = 100

-- d. add / remove a primary key;
--we remove the primary key power from the TreatmentId column
--we add the primary key power to a column itself

go
create procedure addPrimaryComputer
as
	alter table Computer
	add constraint PK_Computer_ComputerId primary key clustered (ComputerId)
go

go 
create procedure deletePrimaryComputer
as
	alter table Computer
	drop constraint PK_Computer_ComputerId
go

exec addPrimaryComputer
exec deletePrimaryComputer
select * from Computer 

--error because 1 already exists in the table if the primary key constraint was already called

insert into Computer(ComputerId,ComputerName,RoomId) values(1,'...',100)
delete from Computer where ComputerId = 1

--e. add / remove a candidate key;

--we remove the candidate key

go
create procedure deleteCandidateHospital
as
	alter table Hospital
	drop constraint FK_Hospital
go


go
create procedure addCandidateHospital
as
	alter table Hospital
	add constraint FK_Hospital unique (HospitalName,Street)
go

exec addCandidateHospital
exec deleteCandidateHospital
select * from Hospital 
drop procedure addCandidateHospital
drop procedure deleteCandidateHospital

--it should give an error if addCandidateHospital procedure was 
--because it is a duplicate for the (HospitalName,Street) unique pair
insert into Hospital(HospitalId,HospitalName,Street,DoctorId,RoomId) values(12,'Elias','Tudor Maniu',3,100)
delete from Hospital where HospitalId = 12

--f. add / remove a foreign key;

--add a foreign key references to the Computer 
--remove the foreign key constraint

go
create procedure addForeignHospital
as 
	alter table Hospital
	add constraint FK_RoomId foreign key (RoomId) references Room(RoomId)
go

create procedure deleteForeignHospital
as
	alter table Hospital
	drop constraint FK_RoomId
go

exec addForeignHospital
exec deleteForeignHospital
drop procedure addForeignHospital
drop procedure deleteForeignHospital
select * from Hospital

-- this insert will give an error if addForeignHospital was called
-- since RoomId does not exist in the Room table and will raise a foreign key constraint
insert into Hospital(HospitalId,HospitalName,Street,DoctorId,RoomId) values (30,'Elias','Tudor Maniu',1,1000)
delete from Hospital where HospitalId = 30

 --g. create / drop a table.
 --we create a table
go
create procedure addTable
as
	create table Speciality(
		SpecialityName varchar(255) primary key,
		DoctorId int not null foreign key references Doctor(DoctorId)
	)
go

go
 create procedure removeTable
 as
	drop table Speciality
go

exec addTable
exec removeTable


 --we have the functionlities table
 create table Functionalities(
	Versions int not null primary key default 0,
	DoAction varchar(255),
	RedoAction varchar(255)
 )
 drop table Functionalities

 --we add all the functionalities into a table
 insert into Functionalities(Versions,DoAction,RedoAction) values
	(1,'modifyTypeDepartment','modifyTypeBackDepartment'),
	(2,'addTreatmentRoom','deleteTreatmentRoom'),
	(3,'addMedicineConstraint','removeMedicineConstraint'),
	(4,'addPrimaryComputer','deletePrimaryComputer'),
	(5,'addCandidateHospital','deleteCandidateHospital'),
	(6,'addForeignHospital','deleteForeignHospital'),
	(7,'addTable','removeTable')

select * from Functionalities

	--we create the procedure where we query the DoAction and RedoAction
	--from the Functionalities Table
go
create procedure RunHomework(@Version int)
as
	select F.DoAction,F.RedoAction
	from Functionalities F
	where F.Versions = @Version  
go

--we run this all at once from here to the bottom,the table is set of version 0

declare @DoAction varchar(255) 
declare @RedoAction varchar(255)
declare @currentVersion varchar(255)
declare @resultVersion varchar(255)
set @currentVersion = '0' --current version
set  @resultVersion = '6' -- result version
if @currentVersion < @resultVersion
begin
	while (@currentVersion < @resultVersion)
	begin 
			set @currentVersion = @currentVersion + 1 --we update the versions
			create table Sample(					  --we create a table
				DoAction varchar(255) unique,
				RedoAction varchar(255) unique
			)
			insert into Sample(DoAction,RedoAction)    --we put the results of the querys into the table
			exec RunHomework @Version = @currentVersion
			set @DoAction = (select S.DoAction from Sample S)       --we set the doAction,print it and execute it
			print @DoAction                                         
			exec @DoAction
			drop table Sample                                       --we drop the table
	end
	print 'Current Versions is:' + @currentVersion
end
else
begin
	while (@currentVersion > @resultVersion)
	begin 
			set @currentVersion = @currentVersion - 1
			create table Sample(
				DoAction varchar(255) unique,
				RedoAction varchar(255) unique
			)
			insert into Sample(DoAction,RedoAction)
			exec RunHomework @Version = @currentVersion
			set @DoAction = (select S.DoAction from Sample S)
			set @RedoAction = (select S.RedoAction from Sample S)
			print @RedoAction
			exec @RedoAction
			drop table Sample 
	end	
	print 'Current Version is:' + @currentVersion
end

--Lab 4 homework

drop table Tables 
create table Tables(
	TableId int identity(1,1) not null,
	Name nvarchar(50) collate SQL_Latin1_General_CP1_CI_AS not null
)

drop table Tests 
create table Tests(
	TestId int identity(1,1) not null,
	Name nvarchar(50) collate SQL_Latin1_General_CP1_CI_AS not null
)

drop table TestRunTables
create table TestRunTables(
	TestRunId int not null,
	TableId int not null,
	StartAt datetime not null,
	EndAt datetime not null
)


drop table TestRuns 
create table TestRuns(
	TestRunId int identity(1,1) not null,
	Description nvarchar(2000) collate SQL_Latin1_General_CP1_CI_AS null,
	StartAt datetime null,
	EndAt datetime null
)


drop table TestTables
create table TestTables(
	TestId int not null,
	TableId int not null,
	NoOfRows int not null,
	Position int not null
)

--Tests for deleting a table with a single primary key and no foreign keys

insert into Tables(Name) values('Computer')
insert into Tests(Name) values('deleteComputer')
select * from Tables 
select * from Tests 

declare @NoOfRows as int=0
set @NoOfRows = (select count(*) from Computer)
insert into TestTables(TestId,TableId,NoOfRows,Position) values (1,1,@NoOfRows,0)
select * from TestTables

go
create procedure deleteComputer
as
	delete from Computer 
go

select * from Computer  

declare @startAt  datetime = null
set @startAt = (select cast( getdate() as date ))
exec deleteComputer
declare @endAt datetime = null
set @endAt = (select cast(getdate() as date))
insert into TestRuns(Description,StartAt,EndAt) values ('Computer Table Values Deleted',@startAt,@endAt)
insert into TestRunTables(TestRunId,TableId,StartAt,EndAt) values (1,1,@startAt,@endAt)

select  * from TestRuns
select * from TestRunTables

--Test for Adding back the random values of the tables

insert into Tests(Name) values ('addComputer')
select * from Tests 

declare @NoOfRows1 as int=0
set @NoOfRows1 = (select count(*) from Computer)
insert into TestTables(TestId,TableId,NoOfRows,Position) values (3,1,@NoOfRows1,1)
select * from TestTables

create table ComputerNames(
	ComputerId int not null primary key,
	Names varchar(255)
)

insert into ComputerNames values (1,'Asus')
insert into ComputerNames values  (2,'Acer')
insert into ComputerNames values  (3,'Toshiba')
insert into ComputerNames values  (4,'Dell')
insert into ComputerNames values  (5,'Apple')

select * from ComputerNames

go
create procedure addComputerValues
as	
	declare @Result nvarchar(max)
	declare @Xml xml = (select C.Names from ComputerNames C where C.ComputerId = floor(rand()*(5-1)+1))
	select @Result = cast(@Xml.query('string(.)') as nvarchar(max))
	insert into Computer(ComputerId,ComputerName)
	values (rand()*(5)+5,@Result)
go

select * from Computer

declare @startAt  datetime = null
set @startAt = (select cast( getdate() as date ))
declare @NoOfRows as int=0
set @NoOfRows = (select T.NoOfRows from TestTables T where T.Position = 0)
declare @current int = 0;
while @current < @NoOfRows
begin
	exec addComputerValues 
    set @current = @current + 1;
end
declare @endAt datetime = null
set @endAt = (select cast(getdate() as date))
insert into TestRuns(Description,StartAt,EndAt) values ('AddRandomVariables',@startAt,@endAt)
insert into TestRunTables(TestRunId,TableId,StartAt,EndAt) values (2,1,@startAt,@endAt)

select * from TestRuns
select * from TestRunTables

--Tests for deleting table with a single-column primary key and at least one foreign key

insert into Tables(Name) values('Department')
insert into Tests(Name) values('deleteDepartment')
select * from Tables 
select * from Tests 

declare @NoOfRows1 as int=0
set @NoOfRows1 = (select count(*) from Department)
insert into TestTables(TestId,TableId,NoOfRows,Position) values (4,2,@NoOfRows1,2)
select * from TestTables

select * from Department

go
create procedure deleteDepartment
as
	delete from	
	Department
go

declare @startAt  datetime = null
set @startAt = (select cast( getdate() as date ))
exec deleteDepartment 
declare @endAt datetime = null
set @endAt = (select cast(getdate() as date))
insert into TestRuns(Description,StartAt,EndAt) values ('Deleting the Values from Department Table',@startAt,@endAt)
insert into TestRunTables(TestRunId,TableId,StartAt,EndAt) values (3,2,@startAt,@endAt)

select * from TestRuns
select * from TestRunTables


--Tests for add random values to a table with a single-column primary key and at least one foreign key

insert into Tests(Name) values('addDepartment')
select * from Tests 

declare @NoOfRows1 as int=0
set @NoOfRows1 = (select count(*) from Department)
insert into TestTables(TestId,TableId,NoOfRows,Position) values (5,2,@NoOfRows1,3)
select * from TestTables

declare @NoOfRows as int=0
set @NoOfRows = (select count(*) from Department)
insert into TestTables(TestId,TableId,NoOfRows,Position) values (3,2,@NoOfRows,1)

select * from TestTables
select * from Department

create table DepartmentNames(
	DepartmentNameid int not null primary key,
	DepartmentName varchar(255)
)

insert into DepartmentNames(DepartmentNameid,DepartmentName) values (1,'Urgency')
insert into DepartmentNames(DepartmentNameid,DepartmentName) values (2,'Room6')
insert into DepartmentNames(DepartmentNameid,DepartmentName) values (3,'Kids')
insert into DepartmentNames(DepartmentNameid,DepartmentName) values (4,'Adults')

select * from DepartmentNames
 
create table DepartmentType(
	DepartmentTypeId int not null primary key,
	DepartmentType varchar(255)
)

insert into DepartmentType(DepartmentTypeId,DepartmentType) values (1,'Cardiology')
insert into DepartmentType(DepartmentTypeId,DepartmentType) values (2,'Endocrinology')
insert into DepartmentType(DepartmentTypeId,DepartmentType) values (3,'Dermatology')
insert into DepartmentType(DepartmentTypeId,DepartmentType) values (4,'Onchology')

select * from DepartmentType

create table DoctorId(
	DoctorId int not null,
	TableId int not null identity(1,1)
)

insert into DoctorId
select D.DoctorId from Doctor D 

select * from DoctorId

go
create procedure deleteDepartmentValues(@current int)
as	
	declare @Result nvarchar(max)
	declare @Xml xml = (select D.DepartmentName from DepartmentNames D where D.DepartmentNameid = floor(rand()*(4-1)+1))
	select @Result = cast(@Xml.query('string(.)') as nvarchar(max))
	declare @Result1 nvarchar(max)
	declare @Xml1 xml = (select D.DepartmentType from DepartmentType D where D.DepartmentTypeId = floor(rand()*(4-1)+1))
	select @Result1 = cast(@Xml1.query('string(.)') as nvarchar(max))
	declare @Result2 int = 0
	set @Result2  = (select D.DoctorId from DoctorId D where D.TableId = floor(rand()*(4-1)+1))
	insert into Department(DepartmentId,DepartmentName,DepartmentRoom,DepartmentType,DoctorId)
	values (@current,@Result,rand()*(20)+20,@Result1,@Result2)
go

declare @startAt1  datetime = null
set @startAt1 = (select cast( getdate() as date ))
declare @NoOfRows as int=0
set @NoOfRows = (select T.NoOfRows from TestTables T where T.TableId = 2 and T.NoOfRows !=0)
declare @currentID int = 0;
while @currentID < @NoOfRows
begin
	exec deleteDepartmentValues @current = @currentID
	set @currentID = @currentID + 1;
end
declare @endAt1 datetime = null
set @endAt1 = (select cast(getdate() as date))
insert into TestRuns(Description,StartAt,EndAt) values ('addDepartmentValues',@startAt1,@endAt1)
insert into TestRunTables(TestRunId,TableId,StartAt,EndAt) values (5,2,@startAt1,@endAt1)

select * from TestRuns
select * from TestRunTables

select * from Department

--Deleting the values from  with a multicolumn primary key,

insert into Tables(Name) values('Hospital')
insert into Tests(Name) values('deleteHospital')
select * from Tables 
select * from Tests  

declare @NoOfRows2 as int=0
set @NoOfRows2 = (select count(*) from Hospital)
insert into TestTables(TestId,TableId,NoOfRows,Position) values (6,3,@NoOfRows2,4)
select * from TestTables

go
create procedure deleteHospital
as
	delete from
	Hospital 
go

declare @startAt2  datetime = null
set @startAt2 = (select cast( getdate() as date ))
exec deleteHospital
declare @endAt2 datetime = null
set @endAt2 = (select cast( getdate() as date))
insert into TestRuns(Description,StartAt,EndAt) values ('deleteHospital',@startAt2,@endAt2)
insert into TestRunTables(TestRunId,TableId,StartAt,EndAt) values (6,3,@startAt2,@endAt2)

select * from TestRuns
select * from TestRunTables

select * from Hospital 

----Adding the values back from  with a multicolumn primary key

insert into Tests(Name) values ('addHospital')
select * from Tests 

declare @NoOfRows3 as int=0
set @NoOfRows3 = (select count(*) from Hospital)
insert into TestTables(TestId,TableId,NoOfRows,Position) values (7,3,@NoOfRows3,5)
select * from TestTables

create table RoomId(
	RoomId int not null,
	TableId int not null identity(1,1)
)

create table  HospitalCombinedKey(
	HospitalName varchar(255),
	Street varchar(255),
	TableId int not null identity(1,1)
)

insert into HospitalCombinedKey(HospitalName,Street) values ('Constantint Opris','Tudor Maniu')
insert into HospitalCombinedKey(HospitalName,Street) values ('Ion Luca Caragiale','Hollosy Simon')
insert into HospitalCombinedKey(HospitalName,Street) values ('Ellias','Tudor Vladimirescu')
insert into HospitalCombinedKey(HospitalName,Street) values ('Ion Creanga','Ferency Caroll')
insert into HospitalCombinedKey(HospitalName,Street) values ('Ion Barbu','Ferency Caroll')

select * from HospitalCombinedKey 

insert into RoomId
select R.RoomId from Room R 

select * from RoomId 

go
create procedure addHospitalValues(@current int)
as	
	declare @Result nvarchar(max)
	declare @Xml xml = (select H.HospitalName from HospitalCombinedKey H where H.TableId = @current)
	select @Result = cast(@Xml.query('string(.)') as nvarchar(max))
	declare @Result1 nvarchar(max)
	declare @Xml1 xml = (select H.Street from HospitalCombinedKey H where H.TableId = @current)
	select @Result1 = cast(@Xml1.query('string(.)') as nvarchar(max))
	declare @Result2 int = 0
	set @Result2  = (select D.DoctorId from DoctorId D where D.TableId = floor(rand()*(4-1)+1))
	declare @Result3 int = 0
	set @Result3  = (select R.RoomId from RoomId R where R.TableId = floor(rand()*(4-1)+1))
	insert into Hospital(HospitalId,HospitalName,Street,DoctorId,RoomId)
	values (@current,@Result,@Result1,@Result2,@Result3)
go

declare @startAt2  datetime = null
set @startAt2 = (select cast( getdate() as date ))
declare @NoOfRows as int=1
set @NoOfRows = (select T.NoOfRows from TestTables T where T.TableId = 3 and T.NoOfRows!=0)
declare @currentID int = 1;
while @currentID <= @NoOfRows
begin
	exec addHospitalValues @current = @currentID
	set @currentID = @currentID + 1;
end
declare @endAt2 datetime = null
set @endAt2 = (select cast( getdate() as date))
insert into TestRuns(Description,StartAt,EndAt) values ('Deleting the values from the hospital table',@startAt2,@endAt2)
insert into TestRunTables(TestRunId,TableId,StartAt,EndAt) values (7,3,@startAt2,@endAt2)

select * from TestRuns
select * from TestRunTables

select * from Hospital 

--We create the views table

drop table Views 
create table Views(
	ViewId int identity(1,1) not null,
	Name varchar(50) collate SQL_Latin1_General_CP1_CI_AS not null
)
drop table TestViews
create table TestViews(
	TestId int not null,
	ViewId int not null
)
drop table TestRunViews
create table TestRunViews(
	TestRunId int not null,
	ViewId int not null,
	StartAt datetime not null,
	EndAt datetime not null
)

--View Test with a SELECT statement operating on one table;

insert into Tests(Name) values('Hospital')
insert into Views(Name) values('UniversityView')
insert into Tests(Name) values('evaluatingUniversity')

select * from Views 
select * from Tests 

insert into TestViews(TestId,ViewId) values(8,1)
select * from TestViews

go
create view UniversityView as
	select U.MedicalSchoolName
	from University U
go

declare @startTime datetime = null
set @startTime = (select getdate())
select * from UniversityView
declare @endTime datetime = null
set @endTime = (select getdate())
insert into TestRunViews(TestRunId,ViewId,StartAt,EndAt) values (9,1,@startTime,@endTime)
insert into TestRuns(Description,StartAt,EndAt) values ('EvaluatingUniversity',@startTime,@endTime)

select * from TestRuns
select * from TestRunViews

--View Test with a SELECT statement operating on at least 2 tables;

insert into Views(Name) values('AppointMentView')
insert into Tests(Name) values('evaluatingAppointments')

select * from Views 
select * from Tests 

insert into TestViews(TestId,ViewId) values (10,2)
select * from TestViews

go
create view AppointmentView as
	select  M.MedicineName,P.PatientName
	from Medicine M,Patient P
	where  M.PatientId = P.PatientId
go

declare @startTime1 datetime = null
set @startTime1 = (select getdate())
select * from AppointmentView
declare @endTime1 datetime = null
set @endTime1 = (select getdate())
insert into TestRunViews(TestRunId,ViewId,StartAt,EndAt) values(10,2,@startTime1,@endTime1)
insert into TestRuns(Description,StartAt,EndAt) values('EvaluatingAppointments',@startTime1,@endTime1)

select * from TestRunViews
select * from TestRuns 

--a View Test with a SELECT statement that has a GROUP BY clause and operates on at least 2 tables.

insert into Tables(Name) values ('Treatment')
insert into Views(Name) values('TreatmentView')
insert into Tests(Name) values('evaluatingTreatments')

select * from Tests select * from Views 

select * from Tables 

insert into TestViews(TestId,ViewId) values (11,3)
select * from TestViews

go
create view TreatmentView as
	select  T.TreatmentName
	from Treatment T,Patient P
	where T.PatientId = P.PatientId
	group by T.TreatmentName
go

declare @startTime2 datetime = null
set @startTime2 = (select getdate())
select * from AppointmentView
declare @endTime2 datetime = null
set @endTime2 = (select getdate())
insert into TestRunViews(TestRunId,ViewId,StartAt,EndAt) values(11,3,@startTime2,@endTime2)
insert into TestRuns(Description,StartAt,EndAt) values('EvaluatingTreatments',@startTime2,@endTime2)

select * from TestRunViews
select * from TestRuns 


if exists (select * from dbo.sysobjects where id = object_id(N'[FK_TestRunTables_Tables]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
alter table [TestRunTables] drop constraint FK_TestRunTables_Tables
go

if exists (select * from dbo.sysobjects where id = object_id(N'[FK_TestTables_Tables]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
alter table [TestTables] drop constraint FK_TestTables_Tables
go

if exists (select * from dbo.sysobjects where id = object_id(N'[FK_TestRunTables_TestRuns]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
alter table [TestRunTables] drop constraint FK_TestRunTables_TestRuns
go


if exists (select * from dbo.sysobjects where id = object_id(N'[FK_TestRunViews_TestRuns]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
alter table [TestRunViews] drop constraint FK_TestRunViews_TestRuns
go


if exists (select * from dbo.sysobjects where id = object_id(N'[FK_TestTables_Tests]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
alter table [TestTables] drop constraint FK_TestTables_Tests
go

if exists (select * from dbo.sysobjects where id = object_id(N'[FK_TestViews_Tests]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
alter table [TestViews] drop constraint FK_TestViews_Tests
go

if exists (select * from dbo.sysobjects where id = object_id(N'[FK_TestRunViews_Views]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
alter table [TestRunViews] drop constraint FK_TestRunViews_Views
go

if exists (select * from dbo.sysobjects where id = object_id(N'[FK_TestViews_Views]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
alter table [TestViews] drop constraint FK_TestViews_Views
go

if exists (select * from dbo.sysobjects where id = object_id(N'[Tables]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [Tables]
go

if exists (select * from dbo.sysobjects where id = object_id(N'[TestRunTables]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [TestRunTables]
go

if exists (select * from dbo.sysobjects where id = object_id(N'[TestRunViews]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [TestRunViews]
go

if exists (select * from dbo.sysobjects where id = object_id(N'[TestRuns]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [TestRuns]
go


if exists (select * from dbo.sysobjects where id = object_id(N'[TestTables]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [TestTables]
go


if exists (select * from dbo.sysobjects where id = object_id(N'[TestViews]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [TestViews]
go

if exists (select * from dbo.sysobjects where id = object_id(N'[Tests]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [Tests]
go

if exists (select * from dbo.sysobjects where id = object_id(N'[Views]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [Views]
go



alter table [Tables] with nocheck add
	constraint [PK_Tables] primary key clustered
	([TableID]
	)on [PRIMARY] 
go

alter table [TestRunTables] with nocheck add
	constraint [PK_TestRunTables] primary key clustered
	(
		[TestRunID],
		[TableID]
	)  ON [PRIMARY] 
go

alter table [TestRunViews] with nocheck add
	constraint [PK_TestRunViews] PRIMARY KEY  CLUSTERED 
	(
		[TestRunID],
		[ViewID]
	)  on [PRIMARY] 
go

alter table [TestRuns] with nocheck add
	constraint [PK_TestRuns] primary key clustered
	(
		[TestRunID]
	)  on [PRIMARY] 

go

alter table [TestTables]  with nocheck add
	constraint [PK_TestTables] primary key clustered
	(
		[TestID],
		[TableID]
	)  obn [PRIMARY] 
go

alter table [TestViews] with nocheck add
	constraint [PK_TestViews] primary key clustered
	(
		[TestID],
		[ViewID]
	)  on [PRIMARY] 
go

alter table [Tests]  with nocheck add
	constraint [PK_Tests] primary key clustered
	(
		[TestID]
	)  on [PRIMARY] 
go

alter table [Views] with nocheck add
	constraint [PK_Views] primary key clustered
	(
		[ViewID]
	)  on [PRIMARY] 
go

alter table [TestRunTables] add 
	constraint [FK_TestRunTables_Tables] foreign key
	(
		[TableID]
	) references [Tables] (
		[TableID]
	) on delete cascade on update cascade ,
	constraint [FK_TestRunTables_TestRuns] foreign key
	(
		[TestRunID]
	) references [TestRuns] (
		[TestRunID]
	) on delete cascade on update cascade 
go



alter table [TestRunViews] ADD 
	constraint [FK_TestRunViews_TestRuns] foreign key
	(
		[TestRunID]

	) references [TestRuns] (
		[TestRunID]
	) on delete cascade on update cascade ,
	constraint [FK_TestRunViews_Views] foreign key
	(
		[ViewID]
	) references [Views] (
		[ViewID]
	) on delete cascade on update cascade
go



alter table [TestTables] ADD 
	constraint [FK_TestTables_Tables] foreign key
	(
		[TableID]
	) references [Tables] (
		[TableID]
	) on delete cascade on update cascade ,
	constraint [FK_TestTables_Tests] foreign key
	(
		[TestID]
	) references [Tests] (
		[TestID]
	) on delete cascade on update cascade
GO

alter table [TestViews] ADD 
	constraint [FK_TestViews_Tests] foreign key
	(
		[TestID]
	) references [Tests] (
		[TestID]
	),
	constraint [FK_TestViews_Views] foreign key 
	(
		[ViewID]
	) references [Views] (
		[ViewID]
	)
go