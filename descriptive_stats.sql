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
    COUNT(*) AS total_days,
    COUNT(CASE WHEN aqi > 150 THEN 1 END) AS unhealthy_days
FROM delhi
GROUP BY month
ORDER BY avg_aqi DESC;

-- average AQI of every month over four years
SELECT 
    month,
    ROUND(AVG(aqi), 2) AS avg_aqi,
    COUNT(*) AS days_analyzed
FROM delhi
GROUP BY month
ORDER BY avg_aqi DESC;
-- the top 3 rows of the executed query shows the months of november, january, december as most polluted hinting towards the pattern of crop burning, winter inversion, diwali firework spike as the main cause of the increasing pollution threat.