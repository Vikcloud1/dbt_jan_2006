{{config(materialized='table',alias='revenue_tbl', transient=false)}}

Select  name, sum(units_sold*unit_price) as Revenue
from raw_data.products P inner Join raw_data.sales S
on P.prod_id=S.prod_id
group by name