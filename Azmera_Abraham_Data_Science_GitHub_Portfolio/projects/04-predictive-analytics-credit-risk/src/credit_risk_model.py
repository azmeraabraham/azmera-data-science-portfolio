import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import classification_report, confusion_matrix

def train_credit_risk_model(path: str):
    df = pd.read_csv(path)

    features = [
        "annual_income",
        "credit_score",
        "debt_to_income",
        "loan_to_value",
        "loan_amount",
        "employment_years",
    ]

    X = df[features]
    y = df["default_risk"]

    X_train, X_test, y_train, y_test = train_test_split(
        X, y, test_size=0.25, random_state=42, stratify=y
    )

    model = LogisticRegression(max_iter=1000)
    model.fit(X_train, y_train)

    predictions = model.predict(X_test)

    print("Confusion Matrix:")
    print(confusion_matrix(y_test, predictions))
    print("\nClassification Report:")
    print(classification_report(y_test, predictions))

    return model

if __name__ == "__main__":
    train_credit_risk_model("../data/sample_credit_risk.csv")
