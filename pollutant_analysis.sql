SELECT 
    COUNT(CASE WHEN pm2_5 > 60 THEN 1 END) AS pm2_5_breaches,  -- WHO guideline
    COUNT(CASE WHEN pm10 > 100 THEN 1 END) AS pm10_breaches,
    COUNT(CASE WHEN no2 > 80 THEN 1 END) AS no2_breaches,
    COUNT(CASE WHEN so2 > 80 THEN 1 END) AS so2_breaches,
    ROUND(COUNT(CASE WHEN pm2_5 > 60 THEN 1 END) * 100.0 / COUNT(*), 2) AS pct_pm2_5_unsafe,
    COUNT(pm2_5) AS total_pm2_5_days
FROM delhi


