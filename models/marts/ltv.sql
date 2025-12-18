{{config(materialized='table')}}

-- 1. Das Datum zur Kompilierzeit abrufen
{% set start_date_result = 
    dbt_utils.get_single_value(
        "SELECT MIN(registration_date) FROM " ~ ref('stg_powerflow__registrations_raw')
    ) 
%}

-- 2. Falls kein Datum gefunden wird (z.B. leere Dev-Tabelle), ein Fallback setzen
{% set start_date = start_date_result if start_date_result else "'2024-01-01'" %}

WITH date_spine AS (
    {{ dbt_utils.date_spine(
        datepart="day",
        start_date=" '" ~ start_date ~ "' ",
        end_date="CURRENT_DATE"
    ) }}
),

user_days AS (
    SELECT 
        r.user_id,
        r.registration_date,
        d.date_day AS date
    FROM  {{ ref('stg_powerflow__registrations_raw') }} r
    JOIN date_spine d
        ON d.date_day >= r.registration_date

),

daily_spend AS (
    SELECT 
        user_id,
        CAST (transaction_time AS DATE) AS transaction_date,
        SUM (total_value) AS daily_spend
    FROM {{ source('powerflow', 'transactions') }}
    GROUP BY 1, 2
)

SELECT 
    u.user_id,
    u.date,
    COALESCE (d.daily_spend, 0) AS daily_spend,
    -- cumulative LTV
    SUM (COALESCE (d.daily_spend, 0)) OVER (PARTITION BY u.user_id ORDER BY u.date) AS ltv,
    DATEDIFF ('day', MIN (u.date) OVER (PARTITION BY u.user_id), u.date) AS days_since_registration

FROM user_days u
LEFT JOIN daily_spend d
    ON u.user_id = d.user_id
        AND u.date = d.transaction_date


--user_id,
--day,
--daily_spend,
--ltv,
--days_since_registration