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

  bool get compensaBajar {
    try {
      final size =   estadoEstacionSeleccionada?.listaBicisDisponibles.length ?? 0;
      return size > 2;
    } catch (e) {
      error = "Error al buscar lista de bicis";
      return false;
    }
  }

  Future<void> cargarEstaciones() async {
    loading = true;
    error = null;
    notifyListeners();
    try {
      final res = await Future.wait([
        repo.getInformacionEstacion(),
        repo.getEstadoEstacion(),
      ]);

      estaciones = res[0].cast<Estacion>();
      estadoEstaciones = res[1].cast<EstadoEstacion>();
    } catch (e) {
      error = e.toString();
      estaciones = [];
      estadoEstaciones = [];
    }

    loading = false;
    cargarEstacionPorDefecto();
    notifyListeners();
  }

  void cargarEstacionPorId(int id) {
    if (estaciones.isEmpty) return;
    try {
      estacionSeleccionada = estaciones.firstWhere((e) => e.id == id);
      cargarEstadoEstacionPorId(id);
      notifyListeners();
    } catch (e) {
      error = "Estacion  no encontrada: $id";
    }
  }

  void cargarEstadoEstacionPorId(int id) {
    if (estadoEstaciones.isEmpty) return;
    try {
      estadoEstacionSeleccionada = estadoEstaciones.firstWhere(
        (e) => e.idStation == id,
      );
    } catch (e) {
      error = "Estado de la  estacion no encontrada: $id";
    }
  }

  void cargarEstacionPorDefecto() {
    if (estaciones.isNotEmpty && estadoEstaciones.isNotEmpty) {
      estacionSeleccionada = estaciones.first;
      cargarEstadoEstacionPorId(estacionSeleccionada?.id ?? 0);
    }
  }
}
