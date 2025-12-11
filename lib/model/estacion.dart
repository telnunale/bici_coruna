class Estacion {
  final int id;
  final String name;
  final String physicalConfiguration;
  final double lat;
  final double lon;
  final String address;
  final String postCode;
  final int capacity;
  final bool isChargingStation;
  final int geofencedCapacity;
  final List<String> rentalMethods;
  final bool isVirtualStation;
  final List<dynamic> groups;
  final double nearbyDistance;
  final bool bluetoothId = false;
  final bool rideCodeSupport = false;
  final Map<String, dynamic> rentalUris;

  Estacion({
    required this.id,
    required this.name,
    required this.physicalConfiguration,
    required this.lat,
    required this.lon,
    required this.address,
    required this.postCode,
    required this.capacity,
    required this.isChargingStation,
    required this.geofencedCapacity,
    required this.rentalMethods,
    required this.isVirtualStation,
    required this.groups,
    required bool bluetoothId,
    required bool rideCodeSupport,
    required this.rentalUris,
    required this.nearbyDistance,
  });

  factory Estacion.fromJson(Map<String, dynamic> json) {
    return Estacion(
      id: (json['station_id'] as num).toInt(),
      name: (json['name'] ?? '') as String,
      physicalConfiguration: (json['physical_configuration'] ?? '') as String,
      lat: (json['lat'] as num).toDouble(),
      lon: (json['lon'] as num).toDouble(),
      address: (json['address'] ?? '') as String,
      postCode: (json['post_code'] ?? '') as String,
      capacity: (json['capacity'] as num).toInt(),
      isChargingStation: (json["is_charging_station"] as bool),
      geofencedCapacity: (json['geofenced_capacity'] as num).toInt(),
      rentalMethods: List<String>.from(json["rental_methods"] ?? []),
      isVirtualStation: (json["is_virtual_station"] as bool),
      groups: List<dynamic>.from(json["groups"] ?? []),
      nearbyDistance: (json['nearby_distance'] as num).toDouble(),
      bluetoothId: (json["_bluetooth_id"] as bool),
      rideCodeSupport: (json["_ride_code_support"] as bool),
      rentalUris: Map<String, dynamic>.from(json["rental_uris"] ?? {}),
    );
  }
}
