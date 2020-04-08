import 'package:app_escola_ecoaprender/models/login.model.dart';
import 'package:app_escola_ecoaprender/models/usuario.model.dart';
import 'package:dio/dio.dart';
import '../models/response.model.dart';
import '../settings.dart';

class LoginRepository {
  Future<UsuarioModel> entrar(LoginModel request) async {
    var url = "${Settings.apiUrl}/login/entrar";

    Response response = await Dio().get(url);
    ResponseModel responseModel = ResponseModel.fromJson(response.data);
    UsuarioModel usuarioModel = UsuarioModel.fromJson(responseModel.objeto);

    return usuarioModel;
  }
}
