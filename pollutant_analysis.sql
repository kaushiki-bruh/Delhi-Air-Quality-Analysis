-- pollutant breach metrics
SELECT 
    COUNT(CASE WHEN pm2_5 > 60 THEN 1 END) AS pm2_5_breaches,  -- WHO guideline
    COUNT(CASE WHEN pm10 > 100 THEN 1 END) AS pm10_breaches,
    COUNT(CASE WHEN no2 > 80 THEN 1 END) AS no2_breaches,
    COUNT(CASE WHEN so2 > 80 THEN 1 END) AS so2_breaches
FROM delhi

-- This analysis demonstrates that Delhi’s air pollution challenge is primarily a particulate matter crisis, driven by everyday urban activities rather than isolated pollution events.
-- From a public health perspective, reducing PM2.5 and PM10 levels would yield the greatest improvement in population health outcomes, making particulate control the most impactful policy lever for improving air quality in Delhi.


-- percentage of Unsafe Days for each Pollutant
SELECT
    ROUND(COUNT(CASE WHEN pm2_5 > 60 THEN 1 END) * 100.0 / COUNT(*), 2) AS pm2_5_unsafe_pct,
    ROUND(COUNT(CASE WHEN pm10 > 100 THEN 1 END) * 100.0 / COUNT(*), 2) AS pm10_unsafe_pct,
    ROUND(COUNT(CASE WHEN no2 > 80 THEN 1 END) * 100.0 / COUNT(*), 2) AS no2_unsafe_pct,
    ROUND(COUNT(CASE WHEN so2 > 80 THEN 1 END) * 100.0 / COUNT(*), 2) AS so2_unsafe_pct
FROM delhi;

-- While earlier analysis highlights which pollutants breach limits most frequently, this percentage-based analysis reveals the probability of daily human exposure. The results show that unsafe particulate pollution—especially PM10—is a near-daily reality in Delhi, creating sustained public health risks through chronic exposure rather than isolated pollution episodes.