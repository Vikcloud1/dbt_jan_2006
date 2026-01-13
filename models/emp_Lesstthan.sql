select e.*,as1. average_sal from 
raw_data.Employee_sal e inner join {{ref('emp_ephemeral')}} as1
on (as1.deptno=e.deptno) and e.salary<as1. average_salemp_Lesstthan