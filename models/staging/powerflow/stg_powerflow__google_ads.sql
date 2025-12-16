with 

google_ads as (

    select * from {{ source('powerflow', 'google_ads') }}

),

campaign_costs as (

    select
        g.device_id,
        CAST (attribution_time AS date) AS attribution_date,
        'google_ads' AS channel,
        g.campaign AS campaign_id,
        c.cost AS campaign_cost

    from google_ads g
    LEFT JOIN {{ref ('campaign_cost')}} c
    ON g.campaign = c.campaign_id

)

select * from campaign_costs
