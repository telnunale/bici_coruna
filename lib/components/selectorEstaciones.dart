import 'package:bici_coruna/viewmodels/bici_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Selectorestaciones extends StatelessWidget {
  const Selectorestaciones({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _mostrarSelector(context),
      child: Text("Seleccionar estacion"),
    );
  }
  void _mostrarSelector(BuildContext context) {
    final vm = context.read<BiciViewmodel>();
    showDialog(
      context: context,
      builder: (context) => Dialog(
        child: SizedBox(
          //height: 400,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(15),
                child: Text("Selecciona tu estacion favorita"),
              ),
              const Divider(height: 1),

              Expanded(
                child: ListView.builder(
                  itemCount: vm.totalEstaciones,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(vm.estaciones[index].name),
                      subtitle: Text(vm.estaciones[index].address),
                      onTap: () => {
                        vm.cargarEstacionPorId(vm.estaciones[index].id),
                        Navigator.pop(context),
                      },
                    );
                  },
                ),
              ),

              const Divider(height: 1),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Volver atras"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
