SELECT
    days_since_registration
FROM {{ ref('ltv') }}
WHERE days_since_registration IS NULL