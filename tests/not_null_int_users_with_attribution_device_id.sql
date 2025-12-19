SELECT 
    device_id
FROM {{ ref('int_users_with_attribution') }}
WHERE device_id IS NULL