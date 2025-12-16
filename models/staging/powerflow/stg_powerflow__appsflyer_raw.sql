with 

source as (

    select * from {{ source('powerflow', 'appsflyer_raw') }}

),

renamed as (

    select
        device_id,
        CAST (attribution_time AS date) AS attribution_date,
        channel,
        campaign_id,
        attribution_cost

    from source

)

select * from renamed