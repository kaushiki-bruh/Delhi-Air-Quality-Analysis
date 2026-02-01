-- percentage of Unsafe Days for each Pollutant
SELECT
    ROUND(COUNT(CASE WHEN pm2_5 > 60 THEN 1 END) * 100.0 / COUNT(*), 2) AS pm2_5_unsafe_pct,
    ROUND(COUNT(CASE WHEN pm10 > 100 THEN 1 END) * 100.0 / COUNT(*), 2) AS pm10_unsafe_pct,
    ROUND(COUNT(CASE WHEN no2 > 80 THEN 1 END) * 100.0 / COUNT(*), 2) AS no2_unsafe_pct,
    ROUND(COUNT(CASE WHEN so2 > 80 THEN 1 END) * 100.0 / COUNT(*), 2) AS so2_unsafe_pct
FROM delhi;

-- While earlier analysis highlights which pollutants breach limits most frequently, this percentage-based analysis reveals the probability of daily human exposure. The results show that unsafe particulate pollution—especially PM10—is a near-daily reality in Delhi, creating sustained public health risks through chronic exposure rather than isolated pollution episodes.