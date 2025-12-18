SELECT 
    attribution_cost
FROM {{ ref('roi') }}
WHERE attribution_cost IS NULL