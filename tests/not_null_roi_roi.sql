SELECT 
    roi
FROM {{ ref('roi') }}
WHERE roi IS NULL