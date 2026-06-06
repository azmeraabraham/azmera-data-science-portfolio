-- OfferIntel Market Intelligence Metrics

SELECT
    zip_code,
    price_band,
    week_start,
    COUNT(*) AS transaction_count,
    ROUND(AVG(offer_to_list_ratio), 3) AS avg_offer_to_list_ratio,
    ROUND(AVG(days_on_market), 1) AS avg_days_on_market,
    ROUND(AVG(offer_count), 1) AS avg_offer_count,
    ROUND(AVG(inspection_waived), 3) AS inspection_waiver_rate,
    ROUND(AVG(CASE WHEN appraisal_gap > 0 THEN 1 ELSE 0 END), 3) AS appraisal_gap_rate,
    ROUND(AVG(seller_credit), 0) AS avg_seller_credit
FROM sample_offer_data
GROUP BY zip_code, price_band, week_start
ORDER BY week_start, zip_code, price_band;
