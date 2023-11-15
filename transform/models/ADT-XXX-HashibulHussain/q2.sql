{{
    config(
        materialized='view'
    )
}}

SELECT 
    v.vendor_name,
    COUNT(DISTINCT o.customer_id) AS customer_count,
    ROUND(SUM(o.gmv_local), 2) AS total_gmv
FROM 
   Vendors.Vendors v
JOIN 
    Orders.Orders o ON v.rdbms_id = o.rdbms_id AND v.id = o.vendor_id
WHERE 
    v.country_name = 'Taiwan'
GROUP BY 
    v.vendor_name
ORDER BY 
    customer_count DESC;