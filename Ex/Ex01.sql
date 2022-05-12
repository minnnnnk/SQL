/*select 문 기본*/
select * from employees;
select * from departments;

select employee_id, first_name, phone_number from employees;

/************************
select 문
    select 절
    from 절
    where절
    order by 절
    
**************************/

-- 모든컬럼 조회

select *
from employees;

select *
from departments;

-- 원하는 컬럼만 조회하기

select employee_id,  first_name,  last_name
from employees;


-- 예제)
-- 사원의 이름(first_name) 과 전화번호 입사일 연봉을 출력하세요
select *
from employees;

select first_name, phone_number, hire_date, salary
from employees;

--사원의 이름(first_name)과 성(last_name) 급여, 전화번호 ,이메일, 입사일을 출력하세요
select first_name
       ,last_name
       ,salary
       ,phone_number
       ,email
       ,hire_date
from employees;

select first_name "이름"
       ,phone_number "전화번호"
       ,hire_date "입사일"
       ,salary "급여"
from employees;

--사원의 사원번호 이름 성 급여 전화번호 이메일 입사일로 표기
select first_name as 이름
       ,last_name 성
       ,salary 급여
       ,phone_number 전화번호
       ,email 이메일
       ,hire_date 입사일
from employees;

--연결 연산자(커럼을 붙이기)
select first_name || last_name
from employees;

select first_name || ' ' ||last_name
from employees;

select first_name || ' hire date is ' || hire_date 입사일
from employees;

--산술 연산자
select first_name , 
       salary, 
       salary*12,
       (salary+300)*12
from employees;

select first_name || '-' || last_name 성명
       ,salary 급여
       ,salary*12 연봉
       ,salary*12+5000 연봉2
       ,phone_number 전화번호
from employees;

/* where절 */
select *
from employees
where department_id = 10;

--예제 1
select first_name
       ,salary
from employees
where salary >=15000;
--예제 2
select first_name
       ,hire_date
from employees
where hire_date > '07/01/01';
--예제3
select salary
from employees
where first_name = 'Lex';

-- 조건이 2개이상 일때 한꺼번에 조회하기
-- 연봉이 14000이상 17000이하인 사원의 이름과 연봉을 구하시오
select first_name
       ,salary
from employees
where salary >= 14000
and salary <= 17000;

-- 연봉이 14000 이하이거나 17000 이상인 사원의 이름과 연봉을 출력하세요
select first_name 이름 
       ,salary 연봉
from employees
where salary >= 14000
and salary <= 17000;

--BETWEEN 연산자로 특정구간 값 출력하기
--입사일이 04/01/01 에서 05/12/31 사이의 사원의 이름과 입사일을 출력하세요
select first_name 이름
       ,hire_date 입사일
from employees
where hire_date >= '04/01/01'
and hire_date <= '05/12/31';

--IN 연산자로 여러 조건을 검사하기
select first_name
       ,last_name
       ,salary
from employees
where first_name in ('Neena', 'Lex', 'John');
-- 연봉이 2100, 3100, 4100, 5100 인 사원의 이름과 연봉을 구하시오
select first_name
       ,salary
from employees
where salary in (2100, 3100, 4100, 5100);
--다른방법
select first_name
       ,salary
from employees
where salary = 2100
or salary = 3100
or salary = 4100
or salary = 5100;

--Like 연산자로 비슷한것들 모두 찾기
select first_name
       ,last_name
       ,salary
from employees
where first_name like 'L___';
-- 상관없을땐 % 글자수 _ 하나씩 추가
select first_name
       ,last_name
       ,salary
from employees
where first_name like '%s%';

--예제
-- 이름에 am 을 포함한 사원의 이름과 연봉을 출력하세요
select first_name
       ,salary
from employees
where first_name like '%am%';
--이름의 두번째 글자가 a 인 사원의 이름과 연봉을 출력하세요
select first_name
       ,salary
from employees
where first_name like '_a%';
--이름의 네번째 글자가 a 인 사원의 이름을 출력하세요
select first_name
from employees
where first_name like '___a%';
--이름이 4글자인 사원중 끝에서 두번째 글자가 a인 사원의 이름을 출력하세요
select first_name
from employees
where first_name like '_a__';

select first_name
       ,salary
       ,commission_pct
       ,salary*commission_pct
from employees
where salary between 13000 and 15000;

select first_name
       ,salary
       ,commission_pct
       ,salary*commission_pct
from employees
where commission_pct is null;
-- null을 찾는 문법은 is

--커미션비율이 있는 사원의 이름과 연봉 커미션비율을 출력하세요
select first_name
       ,salary
       ,commission_pct
from employees
where commission_pct >= 0;
--담당매니저가 없고 커미션비율이 없는 직원의 이름을 출력하세요
select first_name
from employees
where manager_id is null
and commission_pct is null;

select first_name
       ,salary
from employees
where salary >= 10000;

--order by 절을 사용해 보기 좋게 정렬하기
select first_name
       ,salary
from employees
where salary >= 9000
order by salary asc;
-- 내림차순 desc 오름차순 asc

select *
from employees
order by first_name asc;

--부서번호를 오름차순으로 정렬하고 부서번호, 급여, 이름을 출력하세요
select department_id
       ,salary
       ,first_name
from employees
order by department_id asc;
--급여가 10000 이상인 직원의 이름 급여를 급여가 큰직원부터 출력하세요
select  first_name
        ,salary
from employees
where salary >= 10000
order by salary desc;
--부서번호를 오름차순으로 정렬하고 부서번호가 같으면 급여가 높은 사람부터 부서번호 급여 이름을 출력하세요
select  department_id
        ,salary
        ,first_name
from employees
order by department_id asc, salary desc;

/*
단일행 함수
*/
--문자함수 -- INITCAP(컬럼명)
-- 부서번호 100인 직원의 이메일주소와 부서번호를 출력하세요
select email
       ,initcap(email)
       ,department_id
from employees
where department_id = 100;

--문자함수 – LOWER(컬럼명) / UPPER(컬럼명)]
select  first_name
        ,upper(first_name) "upper"
        ,LOWER(first_name) lower
from employees
where department_id = 100;

select  first_name
        ,substr(first_name,1,4)
        ,substr(first_name,-4,3)
from employees
where department_id = 100;

--문자함수 – LPAD(컬럼명, 자리수, ‘채울문자’) / RPAD(컬럼명, 자리수, ‘채울문자’)
select  first_name
        ,lpad(first_name, 10, '*')
        ,rpad(first_name, 10, '*')
from employees;

--문자함수 – REPLACE (컬럼명, 문자1, 문자2) 
select  first_name
        ,replace(first_name,'a','*')
        ,replace(first_name,substr(first_name,2,3),'***' )
from employees
where department_id = 100;

select substr('900214-1234123',8,1)
from dual;

--숫자함수 – ROUND(숫자, 출력을 원하는 자리수)
select  round(123.346, 2) "r2"
        ,round(123.456, 0) "r0"
        ,round(123.456, -1) "r-1"
        ,round(123.456, -2) "r-2"
        ,round(123.456, -3) "r-3"
        ,round(123.456, -4) "r-4"
from dual;

--숫자함수 – TRUNC(숫자, 출력을 원하는 자리수) 
select  trunc(123.456, 2) "r2"
        ,trunc(123.456, 0) "r0"
        ,trunc(123.456, -1) "r-1"
        ,trunc(123.456, -2) "r-2"
        ,trunc(123.456, -3) "r-3"
from dual;

-- 날짜함수 – SYSDATE()
select sysdate
from dual;

select  months_between(sysdate, hire_date)
        ,first_name
        ,hire_date
from employees
where department_id = 110;

--TO_CHAR(숫자, ‘출력모양’) 숫자형문자형으로 변환하기
select  first_name
        ,to_char(salary*12 ,'$999999') "dollar"
from employees
where department_id = 110;

select  to_char(9876, '99999')
        ,to_char(9876, '090000099')
        ,to_char(9876, '9999.99')
        ,to_char(9876, '$9999')
        ,to_char(9876, '99,999')
from dual;

--단일함수>변환함수>TO_CHAR(날짜, ‘출력모양’) 날짜문자형으로 변환하기

select  sysdate
        ,to_char(sysdate, 'YYYY')
        ,to_char(sysdate, 'YY')
        ,to_char(sysdate, 'MM')
        ,to_char(sysdate, 'MONTH')
        ,to_char(sysdate, 'DD')
        ,to_char(sysdate, 'DAY')
        ,to_char(sysdate, 'DDTH')
        ,to_char(sysdate, 'HHMISS')
        ,to_char(sysdate, 'YYYYMMDDHHMISS')
        
        
from dual;

select next_day(SYSDATE,'Thursday')
from dual;