import 'package:bici_coruna/components/grafico_ocupacion.dart';
import 'package:bici_coruna/viewmodels/bici_viewmodel.dart';
import 'package:bici_coruna/components/selectorEstaciones.dart';
import 'package:bici_coruna/views/detalles.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _Inicio();
}

class _Inicio extends State<Inicio> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<BiciViewmodel>();

    if (vm.loading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Bici Coruna'),
            Text(
              "Última actualización -> ${vm.lastUpdate.day}/${vm.lastUpdate.month}/${vm.lastUpdate.year}  ${vm.lastUpdate.hour}:${vm.lastUpdate.minute}",
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: _buildBody(context, vm),
      ),
    );
  }
}

Widget _buildBody(BuildContext context, BiciViewmodel vm) {
  if (vm.loading) {
    return const Center(child: CircularProgressIndicator());
  }

  if (vm.error != null) {
    return Center(
      child: Text('Error: ${vm.error}', textAlign: TextAlign.center),
    );
  }

  if (vm.estaciones.isEmpty) {
    return const Center(child: Text('No hay datos'));
  }
  //Detalles de estacion, el grafico y el pdf de esa estacion en una pantalla diferente
  // debes mostrar de que fecha y hora son los datos recibidos de la api

  return Center(
    child: SingleChildScrollView(
      child: Column(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsetsGeometry.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    " ${vm.estacionSeleccionada?.name ?? "Dato no encontrado"}",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Center(
                    child: TextButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Detalles(vm: vm),
                        ),
                      ),
                      child: Text("Ver detalles"),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Selectorestaciones(),
          grafico(vm),
        ],
      ),
    ),
  );
}
