-- Property Operations KPI Metrics

SELECT
    month,
    market,
    ROUND(AVG(occupancy_rate), 3) AS avg_occupancy_rate,
    ROUND(AVG(renewal_rate), 3) AS avg_renewal_rate,
    ROUND(AVG(delinquency_rate), 3) AS avg_delinquency_rate,
    SUM(monthly_revenue) AS total_monthly_revenue,
    SUM(maintenance_tickets) AS total_maintenance_tickets,
    ROUND(AVG(avg_days_to_turn), 1) AS avg_days_to_turn
FROM sample_property_kpis
GROUP BY month, market
ORDER BY month, market;
