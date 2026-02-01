--total number of records
SELECT 
    count(*) as Total_records
FROM delhi
-- the database includes pollutant and AQI data of over 1461 days, including days, numbered as 1 to 7 (1 being monday and 7 being sunday)

SELECT 
    month,
    ROUND(AVG(aqi), 2) AS avg_aqi,
    MIN(aqi) AS min_aqi,
    MAX(aqi) AS max_aqi,
    COUNT(CASE WHEN aqi > 150 THEN 1 END) AS unhealthy_days,
    COUNT(*) AS days_analyzed
FROM delhi
GROUP BY month
ORDER BY avg_aqi DESC;

-- There's a clear seasonal trend with significantly worse air quality in winter months (November-January) and best quality in summer/early fall (July-September). 
-- The average AQI drops from 342 in November to just 87 in September.
-- The max_aqi values are alarming, reaching 500 (the maximum AQI scale) in January and staying dangerously high (400+) through April. Even the "better" months see spikes into the 200-400 range.