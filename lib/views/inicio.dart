import 'package:bici_coruna/components/datos_estacion.dart';
import 'package:bici_coruna/viewmodels/bici_viewmodel.dart';
import 'package:bici_coruna/components/selectorEstaciones.dart';
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
      appBar: AppBar(title: const Text('Bici Coruna')),
      body: Padding(padding: const EdgeInsets.all(16), child: _buildBody(vm)),
    );
  }
}

Widget _buildBody(BiciViewmodel vm) {
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
  return Center(
    child: Column(children: [DatosEstacion(), Selectorestaciones()]),
  );
}
