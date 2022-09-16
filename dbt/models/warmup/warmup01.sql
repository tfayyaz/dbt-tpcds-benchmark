-- query1
select * 
from {{source('src__tpc_ds', 'customer')}}
limit 100
