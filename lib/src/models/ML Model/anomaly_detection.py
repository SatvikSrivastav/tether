import joblib

# Load Isolation Forest model
iso_forest = joblib.load('anomaly_model.pkl')  # Ensure this file exists in your directory

def detect_anomaly(lat, lon):
    prediction = iso_forest.predict([[lat, lon]])[0]
    return prediction == -1  # -1 indicates anomaly
