from geofencing_detection import is_within_geofence
from validator import is_within_geofence_ml
from anomaly_detection import detect_anomaly

def main():
    # Sample test data
    test_lat, test_lon = 12.971699, 77.594568

    print("=== Geofencing Detection ===")
    # Check geofence using haversine
    if is_within_geofence(test_lat, test_lon):
        print(f"Point ({test_lat}, {test_lon}) is inside the geofence (Haversine-based).")
    else:
        print(f"Point ({test_lat}, {test_lon}) is outside the geofence (Haversine-based).")

    print("\n=== ML-based Geofence Validation ===")
    # Check geofence using ML model
    if is_within_geofence_ml(test_lat, test_lon):
        print(f"Point ({test_lat}, {test_lon}) is inside the geofence (ML-based).")
    else:
        print(f"Point ({test_lat}, {test_lon}) is outside the geofence (ML-based).")

    print("\n=== Anomaly Detection ===")
    # Check for anomalies
    if detect_anomaly(test_lat, test_lon):
        print(f"Point ({test_lat}, {test_lon}) is anomalous!")
    else:
        print(f"Point ({test_lat}, {test_lon}) is normal.")

if __name__ == "__main__":
    main()
