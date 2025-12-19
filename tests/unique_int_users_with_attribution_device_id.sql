SELECT 
    device_id
FROM {{ ref('int_users_with_attribution') }}
GROUP BY 1
HAVING COUNT (*) > 1
