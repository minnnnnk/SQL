/**********************
        Join
**********************/

select  employee_id
        ,first_name
        ,salary
        ,department_id
from employees;

select department_name
from departments;

select *
from locations;

select *
from jobs;

select  employee_id
        ,first_name
        ,salary
        ,department_name
        ,em.employee_id "e_did"
        ,de.department_id "d_did"
from employees em, departments de
where em.department_id = de.department_id;

select  first_name
        ,department_name
        ,job_title
        ,em.employee_id "e_did"
        ,de.department_id "d_did"
        ,em.job_id "e_jid"
        ,jo.job_id "j_jid"
from employees em, departments de, jobs jo
where em.department_id = de.department_id 
and em.job_id = jo.job_id ;