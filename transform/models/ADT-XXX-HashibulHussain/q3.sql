{{
    config(
        materialized='view'
    )
}}

WITH ActiveVendors AS (
    SELECT
        v.country_name,
        v.vendor_name,
        RANK() OVER (PARTITION BY v.country_name ORDER BY SUM(o.gmv_local) DESC) AS vendor_rank,
        ROUND(SUM(o.gmv_local), 2) AS total_gmv
    FROM
        Vendors.Vendors v
    JOIN
        Orders.Orders o ON v.rdbms_id = o.rdbms_id AND v.id = o.vendor_id
    WHERE
        v.is_active = TRUE
    GROUP BY
        v.country_name, v.vendor_name
)
