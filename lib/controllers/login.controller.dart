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

  void limparSession() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    if (sharedPreferences.containsKey("usuario")) {
      sharedPreferences.remove("usuario");
    }
  }

  Future<UsuarioModel> entrar(LoginModel request) async {
    try {
      this.usuario = await loginRepository.entrar(request);
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      
      print(jsonEncode(this.usuario));
      await sharedPreferences.setString("usuario", jsonEncode(this.usuario));
      return this.usuario;
    } catch (ex) {
      this.usuario = null;
      return this.usuario;
    }
  }
}
