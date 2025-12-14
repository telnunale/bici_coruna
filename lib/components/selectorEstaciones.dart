import 'package:bici_coruna/viewmodels/bici_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Selectorestaciones extends StatelessWidget{
  const Selectorestaciones({super.key});
   
  @override
  Widget build(BuildContext context){
    return ElevatedButton(onPressed:()=> _mostrarSelector(context), child: Text("Seleccionar estacion"));    
  }


  void _mostrarSelector(BuildContext context) {
    final vm = context.read<BiciViewmodel>();
    showModalBottomSheet(
      context: context,
      builder: (context) => ListView.builder(
        itemCount: vm.totalEstaciones,

        itemBuilder: (context, index) {
          return ListTile(
            title: Text(vm.estaciones[index].name),
            subtitle: Text(vm.estaciones[index].address),
          );
        },
      ),
    );
  }
}
