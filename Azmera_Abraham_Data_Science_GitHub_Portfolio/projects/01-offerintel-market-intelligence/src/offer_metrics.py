import pandas as pd

def load_offer_data(path: str) -> pd.DataFrame:
    return pd.read_csv(path, parse_dates=["week_start"])

def create_market_summary(df: pd.DataFrame) -> pd.DataFrame:
    summary = (
        df.groupby(["zip_code", "price_band", "week_start"])
        .agg(
            transaction_count=("transaction_id", "count"),
            avg_offer_to_list_ratio=("offer_to_list_ratio", "mean"),
            median_days_on_market=("days_on_market", "median"),
            avg_offer_count=("offer_count", "mean"),
            inspection_waiver_rate=("inspection_waived", "mean"),
            avg_seller_credit=("seller_credit", "mean"),
            appraisal_gap_rate=("appraisal_gap", lambda x: (x > 0).mean()),
        )
        .reset_index()
    )
    return summary.round(3)

if __name__ == "__main__":
    df = load_offer_data("../data/sample_offer_data.csv")
    print(create_market_summary(df).head())
