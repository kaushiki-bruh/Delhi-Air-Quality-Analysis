SELECT
  COUNT(*) AS multi_pollutant_unsafe_days
FROM delhi
WHERE
  (pm2_5 > 60) + (pm10 > 100) + (no2 > 80) + (so2 > 80) >= 2;

-- A significant number of days involve simultaneous exposure to multiple pollutants, amplifying health risk beyond single-pollutant analysis.
-- 849 out of 1461 total records pose a high risk as multi-pollutant AQI days.