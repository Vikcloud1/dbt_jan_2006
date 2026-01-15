(% macro audit_macro(model_name_status) % )

insert into curated_Data.audit_tbl
values('{{model_name}}','{{status}}',current_timestamp :: timestamp_ntz);
{%endmacro%}