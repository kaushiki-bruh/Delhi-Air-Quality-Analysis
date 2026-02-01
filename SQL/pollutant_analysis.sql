-- pollutant breach metrics
SELECT 
    COUNT(CASE WHEN pm2_5 > 60 THEN 1 END) AS pm2_5_breaches,  -- WHO guideline
    COUNT(CASE WHEN pm10 > 100 THEN 1 END) AS pm10_breaches,
    COUNT(CASE WHEN no2 > 80 THEN 1 END) AS no2_breaches,
    COUNT(CASE WHEN so2 > 80 THEN 1 END) AS so2_breaches
FROM delhi

-- This analysis demonstrates that Delhi’s air pollution challenge is primarily a particulate matter crisis, driven by everyday urban activities rather than isolated pollution events.
-- From a public health perspective, reducing PM2.5 and PM10 levels would yield the greatest improvement in population health outcomes, making particulate control the most impactful policy lever for improving air quality in Delhi.
