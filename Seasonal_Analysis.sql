--how do the AQI and pollutants vary seasonally
SELECT 
    month,
    ROUND(AVG(aqi), 2) AS avg_aqi,
    ROUND(AVG(pm2_5), 2) AS avg_pm2_5,
    ROUND(AVG(pm10), 2) AS avg_pm10,
    COUNT(*) AS days_analyzed,
    CASE 
        WHEN month IN (10, 11) THEN 'Crop Burning Season'
        WHEN month IN (12, 1) THEN 'Post burning/Winter'
        WHEN month IN (7, 8, 9) THEN 'Monsoon (Clean)'
        ELSE 'Other'
    END AS season_category
FROM delhi
GROUP BY month
ORDER BY avg_aqi DESC;

--Winter inversion
SELECT 
    month,
    CASE 
        WHEN month IN (12, 1, 2) THEN 'Winter (Inversion)'
        WHEN month IN (3, 4, 5) THEN 'Spring (Transition)'
        WHEN month IN (6, 7, 8, 9) THEN 'Monsoon (Dispersion)'
        ELSE 'Autumn (Pre-Winter)'
    END AS meteorological_season,
    ROUND(AVG(aqi), 2) AS avg_aqi,
    ROUND(STDDEV(aqi), 2) AS avg_volatility,
    MAX(aqi) AS worst_day_aqi
FROM delhi
GROUP BY month
ORDER BY avg_aqi DESC;