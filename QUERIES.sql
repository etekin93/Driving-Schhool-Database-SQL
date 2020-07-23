--query 1
select emp_fname as Inst_fname, emp_lname as Inst_lname, hiredate, instructorlicenseid,
count(distinct drivinglessonid) as Numoflessons
from  employee inner join instructor on instructor.instructorid=employee.employeeid
inner join  completedlesson on instructor.instructorid= completedlesson.instructorid
group by  emp_fname,emp_lname , hiredate , instructorlicenseid

--query2
select distinct client_fname,client_lname,emp_fname as Inst_fname,emp_lname as inst_Lname
from client inner join scheduledlesson on client.clientid=scheduledlesson.clientid
inner join instructor on instructor.instructorid=scheduledlesson.instructorid
inner join employee on employee.employeeid=instructor.instructorid

--query3
select client_fname,client_lname, date,time 
from client inner join scheduledlesson on client.clientid=scheduledlesson.clientid
inner join completedlesson on scheduledlesson.drivinglessonid=completedlesson.drivinglessonid
where scheduledlesson.drivinglessonid in ( select drivinglessonid from completedlesson)

--query 4 
select dateofpurchase,dateinspected,timeinspected
from car inner join inspection on car.carvin=inspection.carvin

--query 5 
select distinct cartype,emp_fname as Inst_fname,emp_lname as Inst_lname,repairtype
from car inner join scheduledlesson on car.carvin=scheduledlesson.carvin
inner join repair on car.carvin=repair.carvin
inner join instructor on instructor.instructorid=scheduledlesson.instructorid
inner join employee on employee.employeeid=instructor.instructorid

--query6 
select carvin ,count(repairdate) as Numofrepairs
from repair
group by carvin
having count(repairdate) > 3

--query 7 
select client_fname,client_lname, count(completedlesson.drivinglessonid)as Numoflessons
from client inner join scheduledlesson on client.clientid=scheduledlesson.clientid
inner join completedlesson on scheduledlesson.drivinglessonid=completedlesson.drivinglessonid
group by client_fname,client_lname
having count(completedlesson.drivinglessonid) > 5

--query 8
select emp_fname,emp_lname 
from employee left join instructor on employee.employeeid=instructor.instructorid
where instructorid is null

--second way
select emp_fname,emp_lname
from employee
where employeeid not in 
(select employeeid
from employee inner join instructor on employee.employeeid=instructor.instructorid)

--query 9 
select distinct completedlesson.instructorid ,sum (mileage) as Totalnumofmiles
from scheduledlesson inner join 
completedlesson on scheduledlesson.drivinglessonid=completedlesson.drivinglessonid
group by completedlesson.instructorid 
--query 10 
select description, count(employeeid) as Numofhiredpeople
from job inner join employeejobs on job.jobid=employeejobs.jobid
group by description
--query 11
select car.carvin, count(dateinspected) as Numofinspections
from car left join inspection on car.carvin=inspection.carvin
group by car.carvin
--query 12 
select cartype, count(repairdate) as Numofrepairs
from car inner join repair on car.carvin=repair.carvin
group by cartype
--query 13
select completedlesson.instructorid,sum(price) as Totalearnings
from scheduledlesson inner join completedlesson on scheduledlesson.drivinglessonid=
completedlesson.drivinglessonid 
group by completedlesson.instructorid

--query 14
select count(clientid)as Numofstudents
from roadtest
where result = 'failed'
--query15
select emp_fname as Inst_fname ,emp_lname as Inst_lname 
from employee inner join instructor on employee.employeeid=instructor.instructorid
where dateissued =(select min(dateissued) from instructor)
--query 16 
select clientid from 
scheduledlesson
where drivinglessonid in(
select scheduledlesson.drivinglessonid
from scheduledlesson left join completedlesson on scheduledlesson.drivinglessonid=
completedlesson.drivinglessonid
where scheduledlesson.drivinglessonid not in ( select drivinglessonid from completedlesson))
--query 17
select emp_fname as Inst_fname ,emp_lname as Inst_lname ,count(completedlesson.drivinglessonid) as Numoflesson
from employee inner join instructor on employee.employeeid=instructor.instructorid
inner join scheduledlesson on instructor.instructorid=scheduledlesson.instructorid
inner join completedlesson on scheduledlesson.drivinglessonid=completedlesson.drivinglessonid
group by emp_fname,emp_lname
having count(completedlesson.drivinglessonid) in
(select max(NMOFLESSON.numoflesson)
from
(select  emp_fname as Inst_fname ,emp_lname as Inst_lname ,count(completedlesson.drivinglessonid)as Numoflesson
from employee inner join instructor on employee.employeeid=instructor.instructorid
inner join scheduledlesson on instructor.instructorid=scheduledlesson.instructorid
inner join completedlesson on scheduledlesson.drivinglessonid=completedlesson.drivinglessonid
group by emp_fname,emp_lname ) as NMOFLESSON)
--query 18 
select distinct client_fname,client_lname
from employee inner join instructor on employee.employeeid=instructor.instructorid
inner join scheduledlesson on instructor.instructorid=scheduledlesson.instructorid
inner join completedlesson on scheduledlesson.drivinglessonid=completedlesson.drivinglessonid
inner join client on client.clientid=scheduledlesson.clientid
where emp_fname = 'sarath' and emp_lname = 'sewal'
intersect
select distinct client_fname,client_lname
from employee inner join instructor on employee.employeeid=instructor.instructorid
inner join scheduledlesson on instructor.instructorid=scheduledlesson.instructorid
inner join completedlesson on scheduledlesson.drivinglessonid=completedlesson.drivinglessonid
inner join client on client.clientid=scheduledlesson.clientid
where emp_fname = 'william' and emp_lname = 'gietz'
