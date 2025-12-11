import 'package:bici_coruna/data/bici_coruna_repositorio.dart';
import 'package:bici_coruna/model/estacion.dart';
import 'package:flutter/material.dart';

class BiciViewmodel extends ChangeNotifier {
  final BiciCorunaRepositorio repo;

  BiciViewmodel(this.repo);

  bool loading = false;
  String? error;

  List<Estacion> estaciones = [];

  int get totalEstaciones => estaciones.length;

  Future<void> cargarEstaciones() async {
    loading = true;
    error = null;
    notifyListeners();

    try {
      estaciones = await repo.getInformacionEstacion();
    } catch (e) {
      error = e.toString();
      estaciones = [];
    }
    loading = false;
    notifyListeners();
  }

  Estacion? buscarEstacionPorId(int id){    
    return estaciones.firstWhere((e)=>e.id==id);
  }


}
