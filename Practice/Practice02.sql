--집계 SQL 

--문제 1

select  count(manager_id)
from employees;

--문제 2
select  max(salary) "최고임금"
        ,min(salary) "최저임금"
        ,max(salary)-min(salary) "최고임금-최저임금"
from employees;

--문제 3
select  max(to_char(hire_date,'YYYY"년"MM"월"DD"일"')) 입사일
from employees;

--문제 4
select  avg(salary) 
        ,max(salary)
        ,min(salary)
        ,department_id
from employees
group by department_id
order by department_id desc;

--문제 5
select  job_id
        ,round(avg(salary),0)
        ,max(salary)
        ,min(salary)
from employees
group by job_id
having min(salary) = 2500
order by min(salary) desc , avg(salary) asc;

--문제 6
select min(to_char(hire_date,'YYYY-MM-DD day'))
from employees;

--문제 7
select  department_id
        ,avg(salary)
        ,min(salary)
        ,avg(salary)-min(salary)
from employees
group by department_id
having  avg(salary)-min(salary) < 2000
order by avg(salary)-min(salary) desc;

--문제 8
select  job_title
        ,max_salary-min_salary
from jobs
order by max_salary-min_salary desc;

--문제 9
select  round(avg(salary),0)
        ,max(salary)
        ,min(salary)
        ,hire_date
        ,manager_id
from employees
group by manager_id, hire_date
having hire_date >= '05/01/01' 
and avg(salary)>=5000 
order by avg(salary) desc;


--문제 10
select  hire_date
        ,case when hire_date <= '02/12/31' then '창립멤버'
              when hire_date <= '03/12/31' then '03년 입사'
              when hire_date <= '04/12/31' then '04년 입사'
              else '상장이후입사'
              end optDate
from employees
order by hire_date asc;