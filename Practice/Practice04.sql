--서브쿼리(SUBQUERY) SQL 문제입니다.
--문제1.
--평균 급여보다 적은 급여을 받는 직원은 몇명인지 구하시요.

select count(salary)
from employees
where salary < (select  avg(salary)
                from employees);


--문제2.
--평균급여 이상, 최대급여 이하의 월급을 받는 사원의
--직원번호(employee_id), 이름(first_name), 급여(salary), 평균급여, 최대급여를 급여의 오름차
--순으로 정렬하여 출력하세요
select avg(salary)
from employees;

select  e.employee_id
        ,e.first_name
        ,e.salary
        ,s.avgsalary
        ,maxsalary
from employees e ,  (select avg(salary) avgsalary
                            ,max(salary) maxsalary
                     from employees) s
where e.salary > s.avgsalary
and e.salary < s.maxsalary
order by salary asc;


--문제3.
--직원중 Steven(first_name) king(last_name)이 소속된 부서(departments)가 있는 곳의 주소
--를 알아보려고 한다.
--도시아이디(location_id), 거리명(street_address), 우편번호(postal_code), 도시명(city), 주
--(state_province), 나라아이디(country_id) 를 출력하세요

select  d.department_id
        ,d.department_name
from employees e, departments d 
where e.first_name = 'Steven'
and e.last_name = 'King'
and e.department_id = d.department_id;

select  l.location_id
        ,l.street_address
        ,l.postal_code
        ,l.city
        ,l.state_province
        ,l.country_id
from locations l , departments d
where d.department_id in (select  d.department_id
                            from employees e, departments d 
                            where e.first_name = 'Steven'
                            and e.last_name = 'King'
                            and e.department_id = d.department_id)
and l.location_id = d.location_id;

select  l.location_id
        ,l.street_address
        ,l.postal_code
        ,l.city
        ,l.state_province
        ,l.country_id
from locations l , departments d, employees e
where d.department_id = e.department_id
and l.location_id = d.location_id
and first_name = 'Steven'
and last_name = 'King';

--문제4.
--job_id 가 'ST_MAN' 인 직원의 급여보다 작은 직원의 사번,이름,급여를 급여의 내림차순으로
--출력하세요 -ANY연산자 사용

select min(salary)
from employees
where job_id = 'ST_MAN';

select  employee_id
        ,first_name
        ,salary
from employees
where salary <any (select min(salary)
                    from employees
                    where job_id = 'ST_MAN')
order by salary desc;

--문제5.
--각 부서별로 최고의 급여를 받는 사원의 직원번호(employee_id), 이름(first_name)과 급여
--(salary) 부서번호(department_id)를 조회하세요
--단 조회결과는 급여의 내림차순으로 정렬되어 나타나야 합니다.
--조건절비교, 테이블조인 2가지 방법으로 작성하세요

select  department_id
        ,max(salary)
from employees
group by department_id;

--조건절 비교
select  employee_id
        ,first_name
        ,salary
        ,department_id
from employees
where (department_id , salary) in (select  department_id
                                           ,max(salary)
                                   from employees
                                   group by department_id)
order by salary desc;
                                  
--테이블 조인
select  e.employee_id
        ,e.first_name
        ,s.maxsalary
        ,s.department_id
from employees e, (select  department_id
                           ,max(salary) maxSalary
                   from employees
                   group by department_id)  s
where e.department_id = s.department_id
and e.salary = s.maxsalary
order by salary desc;
 
 

--문제 6
select  j.job_title
        ,s.sumsalary
from jobs j,(select  job_id
                     ,sum(salary) sumsalary
             from employees
             group by job_id )s
where j.job_id =s.job_id        
order by s.sumsalary desc;

--문제 7
--부서 마다 평균 급여
select  department_id
        ,avg(salary)
from employees
group by department_id;

select  employee_id
        ,first_name
        ,salary
from employees e ,(select   department_id
                            ,avg(salary) avgsalary
                   from employees
                   group by department_id) s
where e.salary > s.avgsalary
and e.department_id = s.department_id;

--문제 8
select  rn
        ,first_name
        ,salary
from (select  rownum rn
        ,employee_id
        ,first_name
        ,salary
        ,hire_date      
       from (select    employee_id
                ,first_name
                ,salary
                ,hire_date
             from employees
             order by hire_date asc))
where rn >=11
and rn <= 15;      