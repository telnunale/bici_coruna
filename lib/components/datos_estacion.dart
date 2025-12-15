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
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<BiciViewmodel>();
    return Card(
      child: Padding(
        padding: const EdgeInsetsGeometry.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Nombre: ${vm.estacionSeleccionada?.name ?? "Dato no encontrado"}",
            ),
            Text(
              "Dirección: ${vm.estacionSeleccionada?.address ?? "Dato no encontrado"}",
            ),
            Text(
              "Bicis Disponibles: ${vm.estadoEstacionSeleccionada?.numBikesAvailable ?? "Dato no encontrado"}",
            ),
            Text(
              "EFIT: ${vm.estadoEstacionSeleccionada?.bicisEfit ?? "Dato no encontrado"}",
            ),
            Text(
              "FIT: ${vm.estadoEstacionSeleccionada?.bicisFit ?? "Dato no encontrado"}",
            ),
            Text(
              "Cantidad de anclajes disponibles:: ${vm.estadoEstacionSeleccionada?.cantidadAnclajesDisponibles ?? "Dato no encontrado"}",
            ),
          ],
        ),
      ),
    );
  }
}
