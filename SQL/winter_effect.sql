-- effect of winter inversion
SELECT
  CASE
    WHEN month IN (11,12,1,2) THEN 'Winter'
    ELSE 'Non-Winter'
  END AS period,
  ROUND(AVG(aqi),2) AS avg_aqi,
  ROUND(COUNT(CASE WHEN aqi > 200 THEN 1 END)*100.0/COUNT(*),2)
    AS pct_very_unhealthy_days
FROM delhi
GROUP BY period;

-- Winter's cold air creates an atmospheric lid that traps pollutants near the ground, nearly doubling Delhi's AQI from 156 in non-winter months to 297 during November-February.
--  However, when winter's trapping phenomenon combines with this existing pollution plus seasonal heating emissions and crop burning residue, the health threat intensifies threefold.