import 'package:bici_coruna/data/bici_coruna_api.dart';
import 'package:bici_coruna/model/estacion.dart';
import 'package:bici_coruna/model/estado_estacion.dart';

class BiciCorunaRepositorio {
  final BiciCorunaApi api;

  BiciCorunaRepositorio(this.api);

  Future<List<Estacion>> getInformacionEstacion() async {
    final list = await api.getInformacionEstacion();
    return list
        .map((e) => Estacion.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<List<EstadoEstacion>> getEstadoEstacion() async {
    final list = await api.getInformacionEstacion();
    return list
        .map((e) => EstadoEstacion.fromJson(e as Map<String, dynamic>))
        .toList();
  }
}
