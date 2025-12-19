-- This test checks if we have dates with Null value

SELECT
    date
FROM {{ ref('ltv') }}
WHERE date IS NULL