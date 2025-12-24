import 'package:flutter/material.dart';
import 'package:pdf/widgets.dart' as pw;

Widget alinearDatos(String titulo, String? res) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4),
    child: Row(
      children: [
        Expanded(flex: 1, child: Text(titulo)),
        Expanded(flex: 2, child: Text(res ?? "Dato no encontrado")),
      ],
    ),
  );
}


pw.Widget alinearDatosPdf(String titulo, String? res) {
  return pw.Padding(
    padding: const pw.EdgeInsets.symmetric(vertical: 4),
    child: pw.Row(
      children: [
        pw.Expanded(flex: 1, child: pw.Text(titulo)),
        pw.Expanded(flex: 2, child: pw.Text(res ?? "Dato no encontrado")),
      ],
    ),
  );
}
