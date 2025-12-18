SELECT 
    registration_date
FROM {{ ref('int_users_with_attribution') }}
WHERE registration_date IS NULL