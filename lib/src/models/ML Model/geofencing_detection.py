from math import radians, sin, cos, sqrt, atan2

geofence_center = [12.971598, 77.594566]  # Example geofence center
geofence_radius = 50  # Geofence radius in meters

def haversine_distance(lat1, lon1, lat2, lon2):
    R = 6371000  # Radius of Earth in meters
    phi1, phi2 = radians(lat1), radians(lat2)
    delta_phi = radians(lat2 - lat1)
    delta_lambda = radians(lon2 - lon1)

    a = sin(delta_phi / 2) ** 2 + cos(phi1) * cos(phi2) * sin(delta_lambda / 2) ** 2
    c = 2 * atan2(sqrt(a), sqrt(1 - a))

    return R * c

def is_within_geofence(lat, lon):
    distance = haversine_distance(lat, lon, geofence_center[0], geofence_center[1])
    return distance <= geofence_radius
