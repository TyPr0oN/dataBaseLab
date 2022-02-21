select FIRSTNME,LASTNAME,SALARY from EMPLOYEE where EMPNO='000020';

set current isolation level UR;
commit ;
update EMPLOYEE set SALARY = 50000 where EMPNO = '000020';

select FIRSTNME,LASTNAME,SALARY from EMPLOYEE where EMPNO='000020';
rollback ;
select FIRSTNME,LASTNAME,SALARY from EMPLOYEE where EMPNO='000020';

commit ;
select FIRSTNME,LASTNAME,SALARY from EMPLOYEE where EMPNO='000020';
commit ;
set current isolation level UR;
commit ;

select FIRSTNME,LASTNAME,SALARY from EMPLOYEE where EMPNO='000020';

set current isolation level UR;
commit ;
update EMPLOYEE set SALARY = 70000 where EMPNO = '000020';
select FIRSTNME,LASTNAME,SALARY from EMPLOYEE where EMPNO='000020';
commit ;
--EX2 CS
set current isolation level CS;
commit ;
select FIRSTNME,LASTNAME,SALARY from EMPLOYEE where EMPNO in ('000020','000030');
--EX3 RS
select FIRSTNME,LASTNAME,SALARY from EMPLOYEE where EMPNO in ('000020','000030');

set current isolation level RS;
commit ;
update EMPLOYEE set SALARY = 80000 where EMPNO = '000020';
commit ;

update EMPLOYEE set SALARY = 22000 where EMPNO = '000050';
rollback ;
--EX4 RR
set current isolation level RR;
commit ;
update EMPLOYEE set FIRSTNME = 'SOMSRI' where EMPNO = '000020';

set current isolation level RR;
commit ;
delete from EMPLOYEE where EMPNO = '000020';
rollback ;

set current isolation level RR;
commit ;
select * from EMPLOYEE where FIRSTNME like 'S%';