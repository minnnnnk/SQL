

select  employee_id
        ,first_name
        ,salary
        ,job_id
        ,manager_id
        ,department_id
from employees;

select * 
from departments;

select *
from locations;

select *
from countries;

select *
from regions;

--유기적으로 연결되어있음

select *
from jobs;

--------------------------------
select  first_name
        ,commission_pct
        ,nvl(commission_pct,0)
        ,nvl2(commission_pct, 100 ,0)
from employees;


/***********************************
            그룹함수
************************************/
select  sum(salary)
from employees;

--그룹함수 - count()
select  count(*)
        ,count(commission_pct)
from employees;

select count(*)
from employees
where salary > 16000;

select  count(*)
        ,sum(salary)
from employees;

--그룹함수 - avg()
select  count(*)
        ,sum(salary)
        ,avg(nvl(salary,0))
        ,round(avg(salary),0)
        ,sum(salary)
from employees;

--그룹함수 - max() / min()

select  count(*)
        ,max(salary)
        ,min(salary)
from employees;

--GROUP BY 절
-- 절 구성
select first_name
from employees
where salary > 16000
order by salary desc;

select  department_id
        ,avg(salary) -- 부서별 평균
        ,sum(salary) -- 부서별 합계
from employees
group by department_id
order by department_id asc;

select  job_id
        ,avg(salary)
from employees
group by job_id;

--예제 연봉(salary)의 합계가 20000 이상인 부서의 부서 번호와 , 인원수, 급여합계를 출력하세요

select  department_id
        ,count(*)
        ,sum(salary)
from employees
group by department_id
having sum(salary) >= 20000
and sum(salary) <= 100000
and department_id = 90; --having 절에는 그룹함수 와 Group by에 참여한 컬럼만 사용할 수 있다

--CASE ~ END 문
select  employee_id
        ,first_name
        ,salary
        ,salary+salary*0.1 realSalary
from employees;

--CASE ~ END 문
select  employee_id
        ,first_name
        ,job_id
        ,salary
        ,CASE WHEN job_id = 'AC_ACCOUNT' THEN salary + salary * 0.1
              WHEN job_id = 'SA_REP' THEN salary + salary * 0.2
              WHEN job_id = 'ST_CLERK' THEN salary + salary * 0.3
              ELSE salary
              END realSalary
from employees;

--DECODE 문
select  employee_id
        ,first_name
        ,job_id
        ,salary
        ,decode(job_id, 'AC_ACCOUNT', salary+salary*0.1,
                        'SA_REP',salary+salary*0.2, 
                        'ST_CLERK',salary+salary*0.3,
                        salary ) Realsalary
from employees;

--직원의 이름, 부서, 팀을 출력하세요
--팀은 코드로 결정하며 부서코드가 10~50 이면 ‘A-TEAM’
--60~100이면 ‘B-TEAM’ 110~150이면 ‘C-TEAM’ 나머지는 ‘팀없음’ 으로 출력하세요

select  first_name
        ,department_id
        ,
        case when department_id>=10 and department_id <= 50 then 'A-TEAM'
             when department_id>=60 and department_id <= 100 then 'B-TEAM'
             when department_id>=110 and department_id <=150 then 'C-TEAM'
        else '팀없음'
        end team
from employees;

