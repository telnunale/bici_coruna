class AnclajeBicisDisponibles {
  // anclajes disponibles para dejar bicis y  que tipos de bici aceptan
  final int? count;
  final List<String> tipoBici;

  AnclajeBicisDisponibles({required this.count, required this.tipoBici});

  factory AnclajeBicisDisponibles.fromJson(Map<String, dynamic> json) {
    return AnclajeBicisDisponibles(
      count: (json['count'] as num).toInt(),
      tipoBici: List<String>.from(json["vehicle_type_ids"] ?? []),
    );
  }
  
}
