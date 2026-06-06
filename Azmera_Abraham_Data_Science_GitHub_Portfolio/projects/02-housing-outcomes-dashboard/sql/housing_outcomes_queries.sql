-- Housing Outcomes Dashboard Metrics

SELECT
    county,
    COUNT(*) AS participants,
    ROUND(AVG(placed), 3) AS placement_rate,
    ROUND(AVG(days_to_placement), 1) AS avg_days_to_placement,
    ROUND(AVG(retained_90_days), 3) AS retention_90_day_rate
FROM sample_housing_outcomes
GROUP BY county
ORDER BY placement_rate DESC;

SELECT
    primary_barrier,
    COUNT(*) AS participants,
    ROUND(AVG(placed), 3) AS placement_rate
FROM sample_housing_outcomes
GROUP BY primary_barrier
ORDER BY placement_rate ASC;
