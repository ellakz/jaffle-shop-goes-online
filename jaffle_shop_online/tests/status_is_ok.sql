{{
    config(
        meta={'owner': ['maayan+172@elementary-data.com']},
        severity='error'
    )
}}

select * from {{ ref('orders') }} 
where status not in ('placed','shipped','completed','return_pending','returned')
