{{ 
  config(
    materialized = 'table',
    alias="EMP_GT_TBL",
    pre_hook = ["{{audit_macro('emp_gt','started')}}"],
    post_hook = ["{{audit_macro('emp_gt','completed')}}"]
  ) 
}}

select e.*, as1.average_sal from Raw_data.Employee_sal e inner join {{ref('emp_ephemeral')}} as1
on (as1.deptno=e.deptno) and e.salary>as1.average_sal