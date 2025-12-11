class TiposBiciDisponibles {
  final int count;
  final String tipoBici;

  TiposBiciDisponibles({required this.count, required this.tipoBici});

  factory TiposBiciDisponibles.fromJson(Map<String, dynamic> json) {
    return TiposBiciDisponibles(
      count: (json['count'] as num).toInt(),
      tipoBici: (json['vehicle_type_id'] ?? '') as String,
    );
  }
}
