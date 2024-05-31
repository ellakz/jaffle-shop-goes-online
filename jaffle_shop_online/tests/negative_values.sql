{{
    config(
        meta={'owner': ['or+1337@elementary-data.com'], 'description': 'Validating negative values'},
        severity='error'
    )
}}

select * 
from {{ ref('orders') }} 
where amount < 0
