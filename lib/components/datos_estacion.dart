import 'package:bici_coruna/components/alinear_datos.dart';
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
              "Detalles de la estación",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const Divider(height: 2),
            alinearDatos("Nombre:", vm.estacionSeleccionada?.name),
            alinearDatos("Dirección:", vm.estacionSeleccionada?.address),
            alinearDatos(
              "Bicis disponibles:",
              vm.estadoEstacionSeleccionada?.numBikesAvailable.toString(),
            ),
            alinearDatos(
              "EFIT disponibles:",
              vm.estadoEstacionSeleccionada?.bicisEfit.toString(),
            ),
            alinearDatos(
              "FIT disponibles:",
              vm.estadoEstacionSeleccionada?.bicisFit.toString(),
            ),
            alinearDatos(
              "Anclajes disponibles:",
              vm.estadoEstacionSeleccionada?.cantidadAnclajesDisponibles
                  .toString(),
            ),
          ],
        ),
      ),
    );
  }
}
