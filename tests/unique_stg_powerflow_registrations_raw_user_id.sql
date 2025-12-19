SELECT 
    user_id
FROM {{ ref('stg_powerflow__registrations_raw') }}
GROUP BY user_id
HAVING COUNT(*) > 1

