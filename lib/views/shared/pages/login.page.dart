import 'package:app_escola_ecoaprender/controllers/login.controller.dart';
import 'package:app_escola_ecoaprender/models/login.model.dart';
import 'package:app_escola_ecoaprender/models/usuario.model.dart';
import 'package:app_escola_ecoaprender/themes/themeEscola.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  LoginModel request = new LoginModel(email: '', senha: '');

  @override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext contex) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        // linha do box
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              // box verde degrade
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.5,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      ThemeEscola.corPrimaria,
                      ThemeEscola.corPrimariaClaro,
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(100),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.school,
                      size: 100,
                      color: ThemeEscola.branco,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: 30,
                          top: 40,
                        ),
                        child: Text(
                          "login Eco Aprender",
                          style: TextStyle(
                              color: ThemeEscola.branco,
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    )
                  ],
                ),
              ),

              // formulário
              Container(
                padding: EdgeInsets.only(top: 50),
                child: Column(
                  children: <Widget>[
                    // e-mail
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 50,
                      padding: EdgeInsets.only(
                        top: 4,
                        left: 16,
                        right: 16,
                        bottom: 4,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                        color: ThemeEscola.branco,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          icon: Icon(Icons.email, color: Colors.grey),
                          hintText: 'e-mail',
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          request.email = value;
                        },
                      ),
                    ),

                    // senha
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 50,
                      margin: EdgeInsets.only(top: 30),
                      padding: EdgeInsets.only(
                        top: 4,
                        left: 16,
                        right: 16,
                        bottom: 4,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                        color: ThemeEscola.branco,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          icon: Icon(Icons.security, color: Colors.grey),
                          hintText: 'senha',
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          request.senha = value;
                        },
                      ),
                    ),

                    // botão de entrar
                    InkWell(
                      child: Container(
                        margin: EdgeInsets.only(top: 80),
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: 50,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                ThemeEscola.corPrimaria,
                                ThemeEscola.corPrimariaClaro
                              ],
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(50))),
                        child: Center(
                          child: Text(
                            'Entrar',
                            style: TextStyle(
                              color: ThemeEscola.branco,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                      onTap: () {
                        entrar(context);
                      },
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

  entrar(BuildContext context) async {
    // Validaçoes do form
    final snackbar = SnackBar(content: Text('E-mail ou Senha inválidos'));
    if (request.email.trim() == '' || request.senha.trim() == '') {
      _scaffoldKey.currentState.showSnackBar(snackbar);
      return;
    }

    // chama o login
    LoginController controller = Provider.of<LoginController>(context);
    UsuarioModel response = await controller.entrar(this.request);

    // login com sucesso, navegar até a homepage
    if (response != null) {
      return;
    }

    // login com erro, exibir a mensagem
    _scaffoldKey.currentState.showSnackBar(snackbar);
  }
}
