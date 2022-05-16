--JOIN
--JOIN 5줄 요약
--조인은 두 개의 테이블을 서로 묶어서 하나의 결과를 만들어 내는 것을 말한다.
--INNER JOIN(내부 조인 =교집합)은 두 테이블을 조인할 때, 두 테이블에 모두 지정한 열의 데이터가 있어야 한다.
--OUTER JOIN(외부 조인 = 합집합)은 두 테이블을 조인할 때, 1개의 테이블에만 데이터가 있어도 결과가 나온다.
--CROSS JOIN(상호 조인)은 한쪽 테이블의 모든 행과 다른 쪽 테이블의 모든 행을 조인하는 기능이다.
--SELF JOIN(자체 조인)은 자신이 자신과 조인한다는 의미로, 1개의 테이블을 사용한다.

--OUTER Join
--  Join 조건을 만족하지 않는 컬럼이 없는 경우 Null을 포함하여 결과를 생성
--  모든 행이 결과 테이블에 참여
--  NULL이 올 수 있는 쪽 조건에 (+)를 붙인다.

--종류
--  Left Outer Join: 왼쪽의 모든 튜플은 결과 테이블에 나타남
-- ?Right Outer Join: 오른쪽의 모든 튜플은 결과 테이블에 나타남
--  Full Outer Join: 양쪽 모두 결과 테이블에 참여

--JOIN
SELECT
    employee_id as 사원_아이디,
    first_name 이름,
    salary 월급,
    department_id 부서_아이디
FROM employees;

select first_name, em.department_id, 
department_name, de.department_id
from employees em, departments de
where em.department_id = de.department_id;

select 
       em.first_name 직원이름, 
       de.department_name 부서명, 
       jo.job_title 업무명
from employees em,departments de,jobs jo
where em.department_id =de.department_id
and em.job_id = jo.job_id;

--left join
SELECT
    e.first_name,
    e.department_id,
    d.department_id,
    d.department_name
FROM employees e left OUTER JOIN departments d
ON e.department_id = d.department_id;

SELECT
    e.first_name,
    e.department_id,
    d.department_id,
    d.department_name
FROM employees e,departments d
where d.department_id = e.department_id(+);

--right join
select 
    e.department_id,
    e.first_name,
    d.department_name
from employees e right outer join departments d
on e.department_id = d.department_id ;

select 
    e.department_id, 
    e.first_name, 
    d.department_name
from employees e, departments d
where e.department_id(+) = d.department_id ; 

--full outer join
select 
    e.department_id,
    e.first_name,
    d.department_name
from employees e full outer join departments d
on e.department_id = d.department_id ; 

-- Self Join

select 
    emp.employee_id,
    emp.first_name, 
    emp.manager_id,
    man.first_name as manager 
from employees emp, employees man
where emp.manager_id = man.employee_id;

--SubQuery
select employee_id, first_name, salary
from employees
where salary > (select salary
                from employees
                where first_name='Den');
                
--단일행 SubQuery
--예제1
select 
    first_name, 
    salary, 
    employee_id
from employees
where salary = (select min(salary)
                from employees);

--예제2
select 
    first_name, 
    salary, 
    employee_id
from employees
where salary < all(select avg(salary)
                    from employees);