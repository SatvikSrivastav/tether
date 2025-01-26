import numpy as np
from sklearn.ensemble import IsolationForest
import joblib

# Sample location data (replace with your actual training data)
locations = np.array([
    [12.971598, 77.594566],  # Geofence center
    [12.972000, 77.595000],
    [12.970000, 77.593000],
    # Add more training locations
])

# Train Isolation Forest model
iso_forest = IsolationForest(contamination=0.1, random_state=42)
iso_forest.fit(locations)

# Save the trained model
joblib.dump(iso_forest, 'anomaly_model.pkl')
print("Anomaly detection model trained and saved successfully.")
