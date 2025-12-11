// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:bici_coruna/model/anclaje_bicis_disponibles.dart';
import 'package:bici_coruna/model/tipos_bici_disponibles.dart';

class EstadoEstacion {
  final int id;
  final int numBikesAvailable;
  final int numBikesDisabled;
  final String status;
  final int? traffic;
  final int numDocksAvailable;
  final int numDocksDisabled;
  final int lastReported;
  final bool isInstalled;
  final bool isRenting;
  final bool isReturning;
  final List<AnclajeBicisDisponibles> listaAnclajes;
  final List<TiposBiciDisponibles> listaBicisDisponibles;

  EstadoEstacion({
    required this.id,
    required this.numBikesAvailable,
    required this.numBikesDisabled,
    required this.status,
    required this.traffic,
    required this.numDocksAvailable,
    required this.numDocksDisabled,
    required this.lastReported,
    required this.isInstalled,
    required this.isRenting,
    required this.isReturning,
    required this.listaAnclajes,
    required this.listaBicisDisponibles,
  });

  factory EstadoEstacion.fromJson(Map<String, dynamic> json) {
    return EstadoEstacion(
      id: (json['station_id'] as num).toInt(),
      numBikesAvailable: (json['num_bikes_available'] as num).toInt(),
      numBikesDisabled: (json['num_bikes_disabled'] as num).toInt(),
      status: (json['status'] ?? '') as String,
      traffic: (json['traffic'] as num).toInt(),
      numDocksAvailable: (json['num_docks_available'] as num).toInt(),
      numDocksDisabled: (json['num_docks_disabled'] as num).toInt(),
      lastReported: (json['last_reported'] as num).toInt(),
      isInstalled: (json["is_installed"] as bool),
      isRenting: (json["is_renting"] as bool),
      isReturning: (json["is_returning"] as bool),
      listaAnclajes: (json['vehicle_docks_available'] as List<dynamic>)
          .map((e) => AnclajeBicisDisponibles.fromJson(e))
          .toList(),
      listaBicisDisponibles: (json['vehicle_types_available'] as List<dynamic>)
          .map((e) => TiposBiciDisponibles.fromJson(e))
          .toList(),
    );
  }
}
