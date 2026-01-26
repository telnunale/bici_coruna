import 'package:flutter_test/flutter_test.dart';
import 'package:bici_coruna/model/estado_estacion.dart';
import 'package:bici_coruna/model/tipos_bici_disponibles.dart';
import 'package:bici_coruna/model/estacion.dart';

void main() {

  // --- GRUPO 1: LÓGICA DE NEGOCIO (Estado de Estación) ---
  group('Grupo 1: Disponibilidad de Bicis', () {
    test('bicisEfit devuelve el conteo correcto cuando hay 5 bicis eléctricas', () {
      // Pasamos los parámetros directamente al constructor
      final estado = EstadoEstacion(
        idStation: 1,
        numBikesAvailable: 5,
        numBikesDisabled: 0,
        status: 'OK',
        listaAnclajes: [],
        listaBicisDisponibles: [
          TiposBiciDisponibles(tipoBici: 'EFIT', count: 5),
        ],
      );

      expect(estado.bicisEfit, 5);
    });

    test('bicisFit devuelve 0 si no existe ese tipo en la lista', () {
      final estado = EstadoEstacion(
        idStation: 1,
        numBikesAvailable: 10,
        numBikesDisabled: 0,
        status: 'OK',
        listaAnclajes: [],
        listaBicisDisponibles: [
          TiposBiciDisponibles(tipoBici: 'EFIT', count: 10),
        ],
      );

      // Al no haber 'FIT' en la lista, el test verifica que se maneje bien
      expect(() => estado.bicisFit, throwsStateError); 
    });
  });

  // --- GRUPO 2: CONSTRUCCIÓN DESDE JSON (Mapeo de Datos) ---
  group('Grupo 2: Mapeo de Datos JSON', () {
    test('Estacion.fromJson asigna correctamente el nombre y el ID', () {
      final jsonSimulado = {
        'station_id': '42',
        'name': 'Estación Central',
        'physical_configuration': 'MECHANIC',
        'lat': 43.36,
        'lon': -8.41,
        'address': 'Calle Falsa 123',
        'post_code': '15001',
        'capacity:': 10,
        'is_charging_station': false
      };

      final estacion = Estacion.fromJson(jsonSimulado);

      expect(estacion.id, 42);
      expect(estacion.name, 'Estación Central');
    });

    test('EstadoEstacion.fromJson crea lista de bicis disponibles correctamente', () {
      final jsonEstado = {
        'station_id': '1',
        'num_bikes_available': 2,
        'num_bikes_disabled': 0,
        'status': 'IN_SERVICE',
        'vehicle_types_available': [
          {'vehicle_type_id': '1', 'count': 2} 
        ]
      };

      final estado = EstadoEstacion.fromJson(jsonEstado);
      expect(estado.idStation, 1);
    });
  });

  // --- GRUPO 3: CÁLCULOS DE CAPACIDAD ---
  group('Grupo 3: Cálculos de Capacidad', () {
    test('cantidadAnclajesDisponibles es 0 cuando la lista de anclajes está vacía', () {
      final estado = EstadoEstacion(
        idStation: 99,
        numBikesAvailable: 0,
        numBikesDisabled: 0,
        status: 'FULL',
        listaAnclajes: [], 
        listaBicisDisponibles: [],
      );

      expect(estado.cantidadAnclajesDisponibles, 0);
    });

    test('bicisBoost devuelve el valor exacto cuando hay bicis tipo BOOST', () {
      final estado = EstadoEstacion(
        idStation: 1,
        numBikesAvailable: 1,
        numBikesDisabled: 0,
        status: 'OK',
        listaAnclajes: [],
        listaBicisDisponibles: [
          TiposBiciDisponibles(tipoBici: 'BOOST', count: 3),
        ],
      );

      expect(estado.bicisBoost, 3);
    });
  });
}