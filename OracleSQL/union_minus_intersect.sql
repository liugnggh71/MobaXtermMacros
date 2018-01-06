prompt union minus intersect samples
prompt ===============================

clear screen

select * from scott.dept
union all 
select * from scott.new_dept;

select * from  scott.dept
union
select * from scott.new_dept;

select * from scott.dept
intersect
select * from scott.new_dept;

select * from scott.dept
minus
select * from scott.new_dept;
