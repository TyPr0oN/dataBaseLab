--ISOLATION LEVEL
-- problem
-- phatom read
-- Incorrect Sum
-- Dirty Read
-- Lost update

select * from EMPLOYEE;

update EMPLOYEE set SALARY = 20000 where EMPNO = '000020';
select FIRSTNME,LASTNAME,SALARY from EMPLOYEE where EMPNO='000020';
commit ;
select FIRSTNME,LASTNAME,SALARY from EMPLOYEE where EMPNO='000020';

update EMPLOYEE set SALARY = 30000 where EMPNO = '000020';
select FIRSTNME,LASTNAME,SALARY from EMPLOYEE where EMPNO='000020';
rollback;
select FIRSTNME,LASTNAME,SALARY from EMPLOYEE where EMPNO='000020';

update EMPLOYEE set SALARY = 40000 where EMPNO = '000020';
select FIRSTNME,LASTNAME,SALARY from EMPLOYEE where EMPNO='000020';
commit ;
select FIRSTNME,LASTNAME,SALARY from EMPLOYEE where EMPNO='000020';
rollback;
select FIRSTNME,LASTNAME,SALARY from EMPLOYEE where EMPNO='000020';

--Example Lost update
update EMPLOYEE set SALARY = 20000 where EMPNO = '000020';
commit ;
set current isolation level UR;
commit ;
update EMPLOYEE set SALARY = 30000 where EMPNO = '000020';
select FIRSTNME,LASTNAME,SALARY from EMPLOYEE where EMPNO='000020';
commit ;
select FIRSTNME,LASTNAME,SALARY from EMPLOYEE where EMPNO='000020';
rollback ;
select FIRSTNME,LASTNAME,SALARY from EMPLOYEE where EMPNO='000020';

commit ;
select FIRSTNME,LASTNAME,SALARY from EMPLOYEE where EMPNO='000020';

rollback ;
set current isolation level UR;
commit ;
update EMPLOYEE set SALARY = 70000 where EMPNO = '000020';
select FIRSTNME,LASTNAME,SALARY from EMPLOYEE where EMPNO='000020';

rollback ;
select FIRSTNME,LASTNAME,SALARY from EMPLOYEE where EMPNO='000020';

update EMPLOYEE set SALARY = 20000 where EMPNO = '000020';
set current isolation level UR;
commit ;

update EMPLOYEE set SALARY = 50000 where EMPNO = '000020';
commit ;
select FIRSTNME,LASTNAME,SALARY from EMPLOYEE where EMPNO='000020';
update EMPLOYEE set SALARY = 60000 where EMPNO = '000030';
select FIRSTNME,LASTNAME,SALARY from EMPLOYEE where EMPNO in ('000020','000030');
commit ;

set current isolation level CS;
commit ;
update EMPLOYEE set SALARY = 10000 where EMPNO = '000020';
select FIRSTNME,LASTNAME,SALARY from EMPLOYEE where EMPNO in ('000020','000030');
commit ;
select FIRSTNME,LASTNAME,SALARY from EMPLOYEE where EMPNO in ('000020','000030');
--EX3 RS
update EMPLOYEE set SALARY = 20000 where EMPNO = '000020';
update EMPLOYEE set SALARY = 30000 where EMPNO = '000030';
commit ;
select FIRSTNME,LASTNAME,SALARY from EMPLOYEE where EMPNO in ('000020','000030');

set current isolation level RS;
commit ;
select FIRSTNME,LASTNAME,SALARY from EMPLOYEE where EMPNO in ('000020','000030');
commit ;
select FIRSTNME,LASTNAME,SALARY from EMPLOYEE where EMPNO in ('000020','000030');
commit ;

--EX4 RR
commit ;
select * from EMPLOYEE where FIRSTNME like 'S%';
commit ;
set current isolation level RR;
commit ;
select * from EMPLOYEE where FIRSTNME like 'S%';

set current isolation level RR;
commit ;
select * from EMPLOYEE where FIRSTNME like 'S%';
commit ;

set current isolation level RR;
commit ;
select * from EMPLOYEE where FIRSTNME like 'S%';