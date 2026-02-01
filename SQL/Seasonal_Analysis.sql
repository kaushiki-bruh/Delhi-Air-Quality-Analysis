--how do the AQI and pollutants vary seasonally
SELECT 
    month,
    ROUND(AVG(aqi), 2) AS avg_aqi,
    ROUND(AVG(pm2_5), 2) AS avg_pm2_5,
    ROUND(AVG(pm10), 2) AS avg_pm10,
    COUNT(*) AS days_analyzed,
    CASE 
        WHEN month IN (10, 11) THEN 'Crop Burning Season'
        WHEN month IN (12, 1) THEN 'Winter inversion'
        WHEN month IN (7, 8, 9) THEN 'Monsoon (Clean)'
        ELSE 'Other'
    END AS season_category
FROM delhi
GROUP BY month
ORDER BY avg_aqi DESC;

-- November's extreme 342 AQI and 387 PM10 levels directly link agricultural burning to the year's worst air quality crisis.
-- December-January maintain hazardous conditions (297-305 AQI) as burning residue combines with heating emissions trapped by cold weather inversions.