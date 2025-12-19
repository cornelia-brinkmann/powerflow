SELECT  
    user_id
FROM {{ ref('stg_powerflow__registrations_raw') }}
WHERE user_id IS NULL