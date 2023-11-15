{{
    config(
        materialized='view'
    )
}}

SELECT 
    country_name,
    ROUND(SUM(gmv_local), 2) AS total_gmv
FROM 
    Orders.Orders
GROUP BY 
    country_name;
