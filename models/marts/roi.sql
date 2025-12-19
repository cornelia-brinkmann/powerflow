{{config(materialized='table')}}

SELECT 
    l.user_id,
    l.registration_date,
    l.days_since_registration,
    l.transaction_date,
    l.date,
    l.daily_spend,
    l.ltv,
    u.channel,
    u.campaign_id,
    u.attribution_cost,
    ROUND(DIV0(ltv, attribution_cost), 2) AS roi
FROM {{ ref('ltv') }} l
INNER JOIN
{{ ref('int_users_with_attribution') }} u
    ON l.user_id = u.user_id
WHERE l.transaction_date IS NOT NULL 
ORDER BY user_id, date


--user_id,
--day,
--daily_spend,
--ltv,
--days_since_registration