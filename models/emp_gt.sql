{{ 
  config(
    materialized = 'table',
    alias="EMP_GT_TBL",
    pre_hook = ["insert into curated_data.audit_tbl select 'emp_gt','started',current_timestamp :: timestamp_ntz"],
    post_hook = ["insert into curated_data.audit_tbl select 'emp_gt','completed',current_timestamp :: timestamp_ntz"]
  ) 
}}

select e.*, as1.average_sal from Raw_data.Employee_sal e inner join {{ref('emp_ephemeral')}} as1
on (as1.deptno=e.deptno) and e.salary>as1.average_sal