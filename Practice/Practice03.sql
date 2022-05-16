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
select  em.job_id
        ,employee_id
        ,first_name
        ,salary
        ,de.department_name
        ,jo.job_title
        ,em.employee_id
from employees em , departments de , jobs jo
where em.department_id = de.department_id 
      and em.job_id = jo.job_id
order by em.employee_id asc
         ,em.first_name asc
         ,em.salary asc
         ,de.department_id asc
         ,jo.job_title asc;

--문제 2-1
select  em.job_id
        ,employee_id
        ,first_name
        ,salary
        ,de.department_name
        ,jo.job_title
        ,em.employee_id
from employees em , departments de , jobs jo
where em.department_id = de.department_id (+)
      and em.job_id = jo.job_id
order by em.employee_id asc
         ,em.first_name asc
         ,em.salary asc
         ,de.department_id asc
         ,jo.job_title asc;
         
-- 문제 3
select  de.location_id
        ,lo.city
        ,de.department_name
from  departments de, locations lo
where de.location_id = lo.location_id
order by de.location_id asc;

--문제 3-2
select  de.location_id
        ,lo.city
        ,de.department_name 
from  departments de, locations lo 
where de.location_id (+) = lo.location_id 
order by de.location_id asc;

--문제 4
select  re.region_name
        ,co.country_name
from regions re, countries co
where re.region_id = co.region_id
order by re.region_id asc , co.country_name desc;

--문제 5
select  em.employee_id 사번
        ,em.first_name 이름
        ,em.hire_date 채용일
        ,ma.first_name 매니저이름
        ,ma.hire_date 매니저입사일
from employees em , employees ma
where em.employee_id = ma.employee_id
;

--문제 6
select  co.country_name
        ,co.country_id
        ,lo.location_id
        ,de.department_name
        ,de.department_id
from countries co , locations lo , departments de
where lo.country_id = co.country_id
and de.location_id = lo.location_id
order by co.country_name asc;

--문제 7
select  jo.employee_id 사번
        ,first_name||' '||last_name 이름
        ,jo.job_id 업무아이디
        ,jo.start_date 시작일
        ,jo.end_date 종료일
from job_history jo , employees em
where jo.employee_id = em.employee_id
and jo.job_id = 'AC_ACCOUNT';

--문제8
select  de.department_id 부서번호
        ,de.department_name 부서이름
        ,em.first_name 매니저이름
        ,lo.city 도시
        ,co.country_name 나라이름
        ,re.region_name 지역이름
from employees em , departments de , locations lo, countries co , regions re
where   em.employee_id = de.manager_id
and     de.location_id = lo.location_id
and     lo.country_id = co.country_id
and     co.region_id = re.region_id;

--문제 9
select  em.employee_id
        ,em.first_name
        ,de.department_name
        ,ma.first_name
from employees em ,departments de, employees ma
where em.employee_id = ma.employee_id
and em.department_id = de.department_id (+);
