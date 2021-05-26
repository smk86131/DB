/*
create table bigtbl as select * from hr.bigemployees;
create table smalltbl as select * from hr.employees;

select round(avg(extract(year from b.birth_date)), 0) as "��� ����⵵"
    from bigtbl b
        cross join smalltbl s;

create materialized view mv_avgyear
as
    select round(avg(extract(year from b.birth_date)), 0) as "��� ����⵵"
    from bigtbl b
        cross join smalltbl s;

select * from mv_avgyear;

drop materialized view mv_avgyear;
create materialized view mv_avgyear
    build deferred
as
    select round(avg(extract(year from b.birth_date)), 0) as "��� ����⵵"
    from bigtbl b
        cross join smalltbl s;
select * from mv_avgyear;
*/
execute dbms_mview.refresh(list =>'mv_avgyear');
select * from mv_avgyear;