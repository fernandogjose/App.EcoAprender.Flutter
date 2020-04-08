import 'package:dio/dio.dart';
import '../models/comunicado.model.dart';
import '../models/response.model.dart';
import '../settings.dart';

class ComunicadoRepository {
  Future<List<ComunicadoModel>> listar() async {
    var url = "${Settings.apiUrl}/comunicado/listar";
    
    Response response = await Dio().get(url);
    ResponseModel responseModel = ResponseModel.fromJson(response.data);

    return (responseModel.objeto as List)
        .map((comunicado) => ComunicadoModel.fromJson(comunicado))
        .toList();
  }
}
