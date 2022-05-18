
select  rn
        ,employee_id
        ,first_name
        ,salary
from (select    rownum rn
                ,ot.employee_id
                ,ot.first_name
                ,ot.salary
       from (select  employee_id
                      ,first_name
                      ,salary
             from employees
             order by salary desc) ot )
where rn >= 3
and rn <= 5;
        
        
select  rownum
        ,ot.employee_id
        ,ot.first_name
        ,ot.salary
from (select  employee_id
              ,first_name
              ,salary
        from employees
        order by salary desc) ot
where rownum >= 1
and rownum <= 5;

--07년에 입사한 직원중 급여가 많은 직원중 3에서 7등의 이름 급여 입사일은?

-- 먼저 07년도에 입사한 직원중 급여가 많은순서대로 나열
select  first_name
        ,salary
        ,hire_date
from employees
where hire_date >= '07/01/01'
and hire_date <= '07/12/31'
order by salary desc;

-- 그 나열한 값에 rownum 정해줌
select  rownum rn
        ,first_name
        ,salary
        ,hire_date
from (select  first_name
              ,salary
              ,hire_date
      from employees
      where hire_date >= '07/01/01'
      and hire_date <= '07/12/31'
      order by salary desc);
      
--정해진 rownum 의 값을  3~7번쨰 사이로 나눔
select  rn
        ,first_name
        ,salary
        ,hire_date
from (select  rownum rn
              ,first_name
              ,salary
              ,hire_date
      from (select  first_name
                    ,salary
                    ,hire_date
            from employees
            where hire_date >= '07/01/01'
            and hire_date <= '07/12/31'
            order by salary desc))
where rn >= 3
and rn <= 7;