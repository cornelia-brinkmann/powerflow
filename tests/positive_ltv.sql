SELECT
    ltv
FROM {{ ref('ltv') }}
WHERE ltv < 0