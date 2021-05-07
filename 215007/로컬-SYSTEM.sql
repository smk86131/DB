select * from sys.dba_users;

select * from sys.dba_tables where owner = 'hr';

select * from sys.dba_tab_columns where owner = 'hr' and table_name = 'departments';

select department_name from HR.departments;

create user sqldb identified by 1234 default tablespace users temporary tablespace temp;

grant connect, resource, dba to sqldb;

