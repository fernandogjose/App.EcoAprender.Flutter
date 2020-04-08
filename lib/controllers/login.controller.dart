import 'dart:convert';

import 'package:app_escola_ecoaprender/models/erro.model.dart';
import 'package:app_escola_ecoaprender/models/login.model.dart';
import 'package:app_escola_ecoaprender/models/usuario.model.dart';
import 'package:app_escola_ecoaprender/repositories/login.repository.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends ChangeNotifier {
  final LoginRepository loginRepository = new LoginRepository();
  List<ErroModel> erros;
  UsuarioModel usuario = new UsuarioModel();

  Future<UsuarioModel> entrar(LoginModel request) async {
    try {
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();

      this.usuario = await loginRepository.entrar(request);
      await sharedPreferences.setString("usuario", jsonEncode(this.usuario));

      return this.usuario;
    } catch (ex) {
      this.usuario = null;
      return this.usuario;
    }
  }
}
