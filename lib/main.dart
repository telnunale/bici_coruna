import 'package:bici_coruna/data/bici_coruna_api.dart';
import 'package:bici_coruna/data/bici_coruna_repositorio.dart';
import 'package:bici_coruna/viewmodels/bici_viewmodel.dart';
import 'package:bici_coruna/views/inicio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  final api = BiciCorunaApi();
  final repo = BiciCorunaRepositorio(api);
  runApp(MyApp(repo: repo));
}

class MyApp extends StatelessWidget {
  final BiciCorunaRepositorio repo;
  const MyApp({super.key, required this.repo});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BiciViewmodel(repo)..cargarEstaciones(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Informes API - Aula',
        home: Inicio(),
      ),
    );
  }
}
