import 'package:app_escola_ecoaprender/controllers/login.controller.dart';
import 'package:app_escola_ecoaprender/models/login.model.dart';
import 'package:app_escola_ecoaprender/models/usuario.model.dart';
import 'package:app_escola_ecoaprender/themes/themeEscola.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  var request = new LoginModel();

  @override
  Widget build(BuildContext contex) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              // e-mail
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "e-mail",
                  labelStyle: TextStyle(
                    color: ThemeEscola.formularioLabelFontColor,
                    fontWeight: ThemeEscola.formularioLabelFontWeight,
                    fontSize: ThemeEscola.formularioLabelFontSize,
                  ),
                ),
                style: TextStyle(
                  color: ThemeEscola.formularioInputFontColor,
                  fontWeight: ThemeEscola.formularioInputFontWeight,
                  fontSize: ThemeEscola.formularioInputFontSize,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'e-mail inválido';
                  }
                  return null;
                },
                onSaved: (value) {
                  request.email = value;
                },
              ),

              // Espaço entre os campos
              SizedBox(height: 10),

              // senha
              TextFormField(
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "senha",
                  labelStyle: TextStyle(
                    color: ThemeEscola.formularioLabelFontColor,
                    fontWeight: ThemeEscola.formularioLabelFontWeight,
                    fontSize: ThemeEscola.formularioLabelFontSize,
                  ),
                ),
                style: TextStyle(
                  color: ThemeEscola.formularioInputFontColor,
                  fontWeight: ThemeEscola.formularioInputFontWeight,
                  fontSize: ThemeEscola.formularioInputFontSize,
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'senha inválido';
                  }
                  return null;
                },
                onSaved: (value) {
                  request.senha = value;
                },
              ),

              // Espaço entre os campos
              SizedBox(height: 10),

              // Botão entrar
              FlatButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      _formKey.currentState.save();
                      entrar(context);
                    }
                  },
                  child: Text("Entrar"))
            ],
          ),
        ),
      ),
    );
  }

  entrar(BuildContext context) async {
    LoginController controller = Provider.of<LoginController>(context);
    UsuarioModel response = await controller.entrar(this.request);

    // login com sucesso, navegar até a homepage
    if (response != null) {
      return;
    }

    // login com erro, exibir a mensagem
    final snackbar = SnackBar(content: Text('E-mail ou Senha inválidos'));
    _scaffoldKey.currentState.showSnackBar(snackbar);
  }
}
