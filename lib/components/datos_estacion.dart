import 'package:bici_coruna/model/estacion.dart';
import 'package:bici_coruna/viewmodels/bici_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DatosEstacion extends StatefulWidget {
  const DatosEstacion({super.key});

  @override
  State<DatosEstacion> createState() => _DatosEstacion();
}

class _DatosEstacion extends State<DatosEstacion> {
  @override
  void initState() {
    super.initState();
    //Future.microtask(() {
      final vmr = context.read<BiciViewmodel>();
      vmr.cargarEstacionPorId(3);
      vmr.cargarEstadoEstacionPorId(3);
    //});
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<BiciViewmodel>();
    return Scaffold(
      appBar: AppBar(
        title: Text(vm.estacionSeleccionada?.name ?? "Estacion no selecionada"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text(
              "Nombre: ${vm.estacionSeleccionada?.name ?? "Estacion no selecionada"}",
            ),
            Text("Dirección: ${vm.estacionSeleccionada?.address ?? ""}"),
            Text("Capacidad: ${vm.estacionSeleccionada?.capacity ?? ""}"),
            Text("Capacidad: ${vm.estacionSeleccionada?.isChargingStation ?? ""}"),
          ],
        ),
      ),
    );
  }
}
