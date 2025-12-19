SELECT 
    device_id,
    COUNT (*) as numbers
FROM int_users_with_attribution
GROUP BY 1
HAVING COUNT (*) > 1
ORDER BY numbers