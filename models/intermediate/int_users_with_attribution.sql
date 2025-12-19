{{config(materialized='table')}}

SELECT 
r.user_id,
r.registration_date,
r.device_id,
COALESCE (m.channel, 'organic') AS channel,
COALESCE (m.campaign_id, 'organic ') AS campaign_id,
COALESCE (m.attribution_cost, 0) AS attribution_cost
FROM {{ ref('stg_powerflow__registrations_raw') }} r
LEFT JOIN
{{ ref('int_marketing_clean') }} m
ON m.device_id = r.device_id
