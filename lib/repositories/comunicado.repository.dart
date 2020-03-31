import 'package:dio/dio.dart';
import '../models/comunicado.model.dart';
import '../models/response.model.dart';
import '../settings.dart';

class ComunicadoRepository {
  Future<List<Comunicado>> listar() async {
    var url = "${Settings.apiUrl}/comunicado/listar";

print(url);
    Response response = await Dio().get(url);
    ResponseGenerico responseGenerico = ResponseGenerico.fromJson(response.data);

    return (responseGenerico.objeto as List)
        .map((comunicado) => Comunicado.fromJson(comunicado))
        .toList();
  }
}
