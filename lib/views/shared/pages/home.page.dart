import 'package:app_escola_ecoaprender/controllers/home.controller.dart';
import 'package:app_escola_ecoaprender/themes/themeEscola.dart';
import 'package:app_escola_ecoaprender/views/shared/pages/login.page.dart';
import 'package:app_escola_ecoaprender/views/shared/widgets/home-link.widget.dart';
import 'package:app_escola_ecoaprender/views/shared/widgets/menu-lateral.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'comunicado.page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return homePage(context);
  }

  Widget homePage(BuildContext context) {
    usuarioLogado(context);

    return Scaffold(
      appBar: new AppBar(
        backgroundColor: ThemeEscola.corPrimaria,
        title: new Text("Eco Aprender"),
      ),
      drawer: new Drawer(child: MenuLateral()),
      body: ListView(
        children: <Widget>[
          HomeLink(
            link: 'Comunicado',
            corDeFundo: ThemeEscola.homeLinkComunicadoCorDeFundo,
            pagina: (BuildContext context) => new ComunicadoPage(),
          ),
        ],
      ),
    );
  }

  void navegarParaLogin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  HomeController obterHomeController(BuildContext context) {
    HomeController controller =
        Provider.of<HomeController>(context, listen: false);

    return controller;
  }

  void usuarioLogado(BuildContext context) async {
    HomeController controller = obterHomeController(context);
    bool estaLogado = await controller.usuarioLogado();
    if (!estaLogado) {
      navegarParaLogin(context);
    }
  }
}
