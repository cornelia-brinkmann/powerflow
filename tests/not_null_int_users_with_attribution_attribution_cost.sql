SELECT 
    attribution_cost
FROM {{ ref('int_users_with_attribution') }}
WHERE attribution_cost IS NULL