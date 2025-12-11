import 'package:http/http.dart' as http;
import 'dart:convert';

class BiciCorunaApi {
  static const String _base =
      "https://acoruna.publicbikesystem.net/customer/gbfs/v2/gl";

  Future<List<dynamic>> getInformacionEstacion() async {
    final url = Uri.parse('$_base/station_information');
    final res = await http.get(url);

    if (res.statusCode != 200) {
      throw Exception('HTTP ${res.statusCode}');
    }

    final decoded = jsonDecode(res.body);
    if (decoded is! List) {
      throw Exception('Respuesta inesperada');
    }

    return decoded;
  }

   Future<List<dynamic>> getEstadoEstacion() async {
    final url = Uri.parse('$_base/station_status');
    final res = await http.get(url);

    if (res.statusCode != 200) {
      throw Exception('HTTP ${res.statusCode}');
    }

    final decoded = jsonDecode(res.body);
    if (decoded is! List) {
      throw Exception('Respuesta inesperada');
    }

    return decoded;
  }



}
