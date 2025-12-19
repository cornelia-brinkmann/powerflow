select
    *
   
from {{ ref("ltv") }} 
where daily_spend<0