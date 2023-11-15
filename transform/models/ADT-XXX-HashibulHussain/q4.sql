{{
    config(
        materialized='view'
    )
}}

SELECT
    FORMAT_DATETIME('%F T%H:%M:%S', PARSE_DATETIME('%Y', CAST(EXTRACT(year FROM date_local) AS STRING))) AS year,
    Ord.country_name,
    vn.vendor_name,
    ROUND(SUM(Ord.gmv_local), 2) AS total_gmv
FROM Orders.Orders AS Ord
LEFT JOIN Vendors.Vendors AS vn
    ON Ord.vendor_id = vn.id
GROUP BY
    Ord.country_name,
    vn.vendor_name,
    FORMAT_DATETIME('%F T%H:%M:%S', PARSE_DATETIME('%Y', CAST(EXTRACT(year FROM date_local) AS STRING))),  
    Ord.date_local
QUALIFY ROW_NUMBER() OVER (PARTITION BY FORMAT_DATETIME('%F T%H:%M:%S', PARSE_DATETIME('%Y', CAST(EXTRACT(year FROM date_local) AS STRING))), Ord.country_name
                           ORDER BY total_gmv DESC) <= 2
ORDER BY
    FORMAT_DATETIME('%F T%H:%M:%S', PARSE_DATETIME('%Y', CAST(EXTRACT(year FROM date_local) AS STRING))) ASC,
    Ord.country_name Asc;  
