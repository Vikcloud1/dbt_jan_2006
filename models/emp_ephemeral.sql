{{config(materialized='ephemeral')}}

select deptno, avg(salary) as average_sal from Raw_data.Employee_sal group by 1 