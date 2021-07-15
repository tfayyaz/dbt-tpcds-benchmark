
-- query82
SELECT
         i_item_id , 
         i_item_desc , 
         i_current_price 
FROM     {{source('src__tpc_ds', 'item')}},
         {{source('src__tpc_ds', 'inventory')}},
         {{source('src__tpc_ds', 'date_dim')}},
         {{source('src__tpc_ds', 'store_sales')}}
WHERE    i_current_price BETWEEN 63 AND      63+30 
AND      inv_item_sk = i_item_sk 
AND      d_date_sk=inv_date_sk 
AND      Cast(d_date AS DATE) BETWEEN Cast('1998-04-27' AS DATE) AND      ( 
                  Cast('1998-06-27' AS DATE)) 
AND      i_manufact_id IN (57,293,427,320) 
AND      inv_quantity_on_hand BETWEEN 100 AND      500 
AND      ss_item_sk = i_item_sk 
GROUP BY i_item_id, 
         i_item_desc, 
         i_current_price 
ORDER BY i_item_id 
LIMIT 100; 

