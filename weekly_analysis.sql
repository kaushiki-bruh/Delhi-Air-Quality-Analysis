--pattern over all days of the week
SELECT 
    days,
    CASE days
        WHEN 1 THEN 'Monday'
        WHEN 2 THEN 'Tuesday'
        WHEN 3 THEN 'Wednesday'
        WHEN 4 THEN 'Thursday'
        WHEN 5 THEN 'Friday'
        WHEN 6 THEN 'Saturday'
        WHEN 7 THEN 'Sunday'
    END AS day_name,
    ROUND(AVG(aqi), 2) AS avg_aqi,
    ROUND(AVG(no2), 2) AS avg_no2,
    ROUND(AVG(pm2_5), 2) AS avg_pm25,
    COUNT(*) AS sample_size,
    ROUND(AVG(aqi) - (SELECT AVG(aqi) FROM delhi), 2) AS deviation_from_weekly_avg
FROM delhi
GROUP BY days
ORDER BY days;

--This suggests that persistent emission sources (construction, dust, residential heating) dominate over traffic-related pollution. 
--The Tuesday peak indicates pollution accumulation over consecutive days rather than daily traffic spikes.
--This suggests that persistent emission sources (construction, dust, residential heating) dominate over traffic-related pollution.
 --The Tuesday peak indicates pollution accumulation over consecutive days rather than daily traffic spikes.