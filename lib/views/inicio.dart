import 'package:bici_coruna/viewmodels/bici_viewmodel.dart';
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

    return Scaffold(
      appBar: AppBar(
        title: const Text('Bici Coruna'),        
      ),      
     // body: Padding(padding: const EdgeInsets.all(16), child:),
    );
  }
}
