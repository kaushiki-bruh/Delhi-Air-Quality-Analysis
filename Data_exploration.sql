-- categorization of AQI 
SELECT
    CASE
        WHEN aqi BETWEEN 0 AND 50 THEN 'Good'
        WHEN aqi BETWEEN 51 AND 100 THEN 'Moderate'
        WHEN aqi BETWEEN 101 AND 150 THEN 'Unhealthy for Sensitive Groups'
        WHEN aqi BETWEEN 151 AND 200 THEN 'Unhealthy'
        WHEN aqi BETWEEN 201 AND 300 THEN 'Very Unhealthy'
        WHEN aqi BETWEEN 301 AND 500 THEN 'Hazardous'
        ELSE 'Invalid / Missing'
    END AS aqi_category,
    COUNT(*) AS day_count
FROM delhi
WHERE aqi IS NOT NULL
GROUP BY aqi_category