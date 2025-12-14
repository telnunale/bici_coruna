import 'package:bici_coruna/components/info_row.dart';
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
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<BiciViewmodel>();
    return Card(
      child: Padding(
        padding: const EdgeInsetsGeometry.all(16),
        child: Column(
          children: [
            InfoRow(label: "Nombre: ", value: vm.estacionSeleccionada?.name),
            InfoRow(
              label: "Dirección: ",
              value: vm.estacionSeleccionada?.address,
            ),
            InfoRow(
              label: "Bicis Disponibles: ",
              value:
                  vm.estadoEstacionSeleccionada?.numBikesAvailable.toString() ??
                  "0",
            ),

            /*InfoRow(
              label: "EFIT: ",
              value: vm.estadoEstacionSeleccionada?.bicisEfit.toString(),
            ),
            InfoRow(
              label: "FIT: ",
              value: vm.estadoEstacionSeleccionada?.bicisFit.toString(),
            ),*/
          ],
        ),
      ),
    );
  }
}
