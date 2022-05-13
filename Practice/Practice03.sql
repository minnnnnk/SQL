-- 조인 SQL

--문제 1
select  employee_id
        ,first_name
        ,last_name
        ,department_name
from employees em, departments de
where em.department_id = de.department_id
order by department_name asc
         ,em.employee_id desc;

--문제 2
select  job_id
        ,employee_id
        ,first_name
        ,salary
        ,de.department_name
        ,jo.job_title
        ,em.employee_id
from employees em , departments de , jobs jo;