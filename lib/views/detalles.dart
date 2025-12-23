import 'package:bici_coruna/components/datos_estacion.dart';
import 'package:bici_coruna/components/grafico_bicis.dart';
import 'package:bici_coruna/viewmodels/bici_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class Detalles extends StatelessWidget {
  final BiciViewmodel vm;
  const Detalles({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Card(
            child: ListTile(
              leading: Icon(
                vm.compensaBajar ? Icons.directions_bike : Icons.close,
                color: vm.compensaBajar ? Colors.green : Colors.red,
              ),
              title: vm.compensaBajar
                  ? Text("Ahora mismo compensa bajar")
                  : Text(
                      "Ahora mismo no compensa bajar debido a la poca cantidad de bicis disponibles",
                    ),
            ),
          ),
          DatosEstacion(),
          graficoBicis(vm),
          TextButton(
            onPressed: () {
              _exportPdf(context, vm);
            },
            child: const Text('Imprimir pdf'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Volver atras'),
          ),
        ],
      ),
    );
  }

  void _exportPdf(BuildContext context, BiciViewmodel vm) async {
    final doc = pw.Document();
    String fecha = DateTime.now().toString().split(".").first;

    doc.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (_) => [
          pw.Text(
            'Informe de la estación ${vm.estacionSeleccionada?.name}',
            style: pw.TextStyle(fontSize: 20),
          ),
          pw.Text("Fecha de generación del informe: $fecha"),

          pw.Text("Fecha de la última actualización: ${vm.lastUpdate}"),
          pw.SizedBox(height: 8),
          pw.Text(
            "Nombre: ${vm.estacionSeleccionada?.name ?? "Dato no encontrado"}",
          ),
          pw.Text(
            "Dirección: ${vm.estacionSeleccionada?.address ?? "Dato no encontrado"}",
          ),
          pw.Text(
            'Total bicis disponibles: ${vm.estadoEstacionSeleccionada?.listaBicisDisponibles.length}',
          ),
          pw.Text('Bici Fit: ${vm.estadoEstacionSeleccionada?.bicisFit}'),
          pw.Text('Bici EFit: ${vm.estadoEstacionSeleccionada?.bicisEfit}'),
          pw.Text(
            'Anclajes disponibles: ${vm.estadoEstacionSeleccionada?.cantidadAnclajesDisponibles}',
          ),
          pw.Text("Compensa bajar: ${vm.compensaBajar}"),
          
        ],
      ),
    );

    await Printing.layoutPdf(onLayout: (_) async => doc.save());
  }
}
/*
• Generar un PDF con toda la información de la estación en el momento actual:

• Datos estáticos.

• Estado actual.

• Fecha/hora de generación.

• Fecha/hora de actualización de los datos.*/ 