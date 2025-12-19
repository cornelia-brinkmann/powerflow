select
    *
   
from {{ ref("ltv") }} as l
where daily_spend<0