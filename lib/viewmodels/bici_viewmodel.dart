import 'dart:math';

import 'package:bici_coruna/data/bici_coruna_repositorio.dart';
import 'package:bici_coruna/model/estacion.dart';
import 'package:bici_coruna/model/estado_estacion.dart';
import 'package:flutter/material.dart';

class BiciViewmodel extends ChangeNotifier {
  final BiciCorunaRepositorio repo;

  BiciViewmodel(this.repo);

  bool loading = false;
  String? error;

  List<Estacion> estaciones = [];
  List<EstadoEstacion> estadoEstaciones = [];

  Estacion? estacionSeleccionada;
  EstadoEstacion? estadoEstacionSeleccionada;

  int get totalEstaciones => estaciones.length;

  Future<void> cargarEstaciones() async {
    loading = true;
    error = null;
    notifyListeners();

    try {
      final res = await Future.wait([
        repo.getInformacionEstacion(),
        repo.getEstadoEstacion(),
      ]); 
      
      estaciones = res[0] as List<Estacion>;
      estadoEstaciones = res[1] as List<EstadoEstacion>;
    } catch (e) {
      error = e.toString();
      estaciones = [];
      estadoEstaciones = [];
    }
    loading = false;   
    notifyListeners();
  }
 

  void cargarEstacionPorId(int id) {
    estacionSeleccionada = estaciones.firstWhere((e) => e.id == id);
    notifyListeners();
  }

  void cargarEstadoEstacionPorId(int id) {
    estadoEstacionSeleccionada = estadoEstaciones.firstWhere(
      (e) => e.idStation == id,
    );
    notifyListeners();
  }
}
