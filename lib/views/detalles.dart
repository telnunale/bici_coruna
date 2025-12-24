import 'package:bici_coruna/components/alinear_datos.dart';
import 'package:bici_coruna/components/datos_estacion.dart';
import 'package:bici_coruna/components/grafico_bicis.dart';
import 'package:bici_coruna/components/grafico_ocupacion.dart';
import 'package:bici_coruna/viewmodels/bici_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class Detalles extends StatelessWidget {
  final BiciViewmodel vm;
  const Detalles({super.key, required this.vm});

  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(
        child: Center(
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
              grafico(vm),
              Container(
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
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
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _exportPdf(BuildContext context, BiciViewmodel vm) async {
    final doc = pw.Document();
    String fecha = DateFormat('dd/MM/yyyy HH:mm').format(DateTime.now());
    String fechaUltimaActualizacion=DateFormat('dd/MM/yyyy HH:mm').format(vm.lastUpdate)
    ;
 
    doc.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (_) => [
          pw.Text(
            'Informe de la estación ${vm.estacionSeleccionada?.name}',
            style: pw.TextStyle(fontSize: 20),
          ),
          pw.Divider(),
          alinearDatosPdf(
            "Fecha de generación del informe:",
            fecha,
          ),

          alinearDatosPdf(
            "Fecha de la última actualización:",
            fechaUltimaActualizacion,
          ),         
          alinearDatosPdf("Nombre:", vm.estacionSeleccionada?.name),
          alinearDatosPdf("Dirección:", vm.estacionSeleccionada?.address),
          alinearDatosPdf("Esta activa?",  vm.estadoEstacionSeleccionada?.status == "IN_SERVICE" ? "Si" : "No" ),
          alinearDatosPdf(
            "Bicis disponibles:",
            vm.estadoEstacionSeleccionada?.numBikesAvailable.toString(),
          ),
          alinearDatosPdf(
            "EFIT disponibles:",
            vm.estadoEstacionSeleccionada?.bicisEfit.toString(),
          ),
          alinearDatosPdf(
            "FIT disponibles:",
            vm.estadoEstacionSeleccionada?.bicisFit.toString(),
          ),
          alinearDatosPdf(
            "Anclajes disponibles:",
            vm.estadoEstacionSeleccionada?.cantidadAnclajesDisponibles
                .toString(),
          ),
          alinearDatosPdf("Compensa bajar", vm.compensaBajar ? ' Si' : ' No'),

          
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