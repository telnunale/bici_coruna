import 'dart:math';

import 'package:bici_coruna/viewmodels/bici_viewmodel.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

Widget graficoBicis(BiciViewmodel vm) {
  final efit = vm.estadoEstacionSeleccionada?.bicisEfit ?? 0;
  final fit = vm.estadoEstacionSeleccionada?.bicisFit ?? 0;
  return Card(
    child: Column(
      children: [
        Padding(padding: EdgeInsets.all(10), child: Text("Bicis FIT vs EFIT")),
        SizedBox(
          height: 300,
          child: PieChart(
            PieChartData(
              centerSpaceRadius: 50,
              sectionsSpace: 3,
              sections: [
                PieChartSectionData(
                  value: efit.toDouble() ?? 0,
                  color: Colors.blue,
                  title: "e-bikes - $efit",
                  radius: 60,
                  titleStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                PieChartSectionData(
                  value: fit.toDouble() ?? 0,
                  color: Colors.red,
                  title: "bicis - $fit",
                  radius: 60,
                  titleStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
