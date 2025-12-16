select *
from {{ ref("stg_powerflow__appsflyer_raw") }}
union all
select *
from {{ ref("stg_powerflow__google_ads") }}
