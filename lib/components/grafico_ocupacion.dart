import 'package:bici_coruna/viewmodels/bici_viewmodel.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

Widget grafico(BiciViewmodel vm) {
  final estacionesOcupadas = vm.estacionesMasOcupadas();
  return Card(
    child: Column(
      children: [
        Padding(
          padding: EdgeInsets.all(20),
          child: Text("Estaciones con mas bicis EFIT diponibles"),
        ),
        SizedBox(
          height: 400,
          child: BarChart(
            BarChartData(
              barGroups: List.generate(
                estacionesOcupadas.length,
                (i) => BarChartGroupData(
                  x: i,
                  barRods: [
                    BarChartRodData(
                      toY: estacionesOcupadas[i].numBikesAvailable.toDouble(),
                    ),
                  ],
                ),
              ),
              titlesData: FlTitlesData(
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 80,
                    getTitlesWidget: (value, meta) {
                      final index = value.toInt();
                      if (index < 0 || index >= estacionesOcupadas.length) {
                        return const SizedBox.shrink();
                      }
                      final nombre = vm.bucarNombreEstacionPorEstadoid(
                        estacionesOcupadas[index].idStation,
                      );
                      return Padding(
                        padding: const EdgeInsets.only(
                          top: 10,
                        ),
                        child: SizedBox(
                          width: 60, // Ancho para que los textos no se superpongan 
                          child: Text(
                            nombre,
                            style: const TextStyle(fontSize: 10),
                            textAlign: TextAlign.center,
                            maxLines: 4, 
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
