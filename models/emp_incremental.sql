{{ 
  config(
    materialized='incremental',
    unique_key='empid',
    alias='emp_tgt'
  ) 
}}

select * from DEV.RAW_data.EMP_STG

{% if is_incremental() %}
  where inserted_at > (
        select max(inserted_at) from {{ this }}
  )
{% endif %}