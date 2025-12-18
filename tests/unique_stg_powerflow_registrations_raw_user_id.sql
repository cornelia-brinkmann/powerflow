SELECT 
    user_id,
    COUNT (*) AS numbers
FROM {{ ref('stg_powerflow__registrations_raw') }}
GROUP BY user_id
HAVING COUNT(*) > 1
ORDER BY numbers DESC
