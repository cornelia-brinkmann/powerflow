with 

modified_source as (

    
    select * from {{ source('powerflow', 'registrations_raw') }}
    Where user_id is not null

),

registrations as (

    select
        user_id,
        CAST (registration_time AS date) AS registration_date,
        device_id,
        email,
        platform,
        country

    from modified_source

)

select * from registrations