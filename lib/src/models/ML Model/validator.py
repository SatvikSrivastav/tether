import joblib

# Load the trained model
clf = joblib.load('geofence_model.pkl')  # Ensure this file exists in your directory

def is_within_geofence_ml(lat, lon):
    prediction = clf.predict([[lat, lon]])[0]
    return prediction == 1
