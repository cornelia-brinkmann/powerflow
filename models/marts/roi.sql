{{config(materialized='table')}}

SELECT 
    l.user_id,
    l.date,
    l.daily_spend,
    l.ltv,
    u.channel,
    u.campaign_id,
    u.attribution_cost,
    DIV0(ltv, attribution_cost) AS roi
FROM {{ ref('ltv') }} l
INNER JOIN
{{ ref('int_users_with_attribution') }} u
    ON l.user_id = u.user_id


--user_id,
--day,
--daily_spend,
--ltv,
--days_since_registration