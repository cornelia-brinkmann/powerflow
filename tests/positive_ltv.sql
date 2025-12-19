SELECT
    ltv
FROM {{ ref('ltv') }}
WHERE ltv < 0 OR ltv IS NULL