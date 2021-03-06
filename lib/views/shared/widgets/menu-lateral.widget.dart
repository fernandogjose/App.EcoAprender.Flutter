import 'package:app_escola_ecoaprender/controllers/menu-lateral.controller.dart';
import 'package:app_escola_ecoaprender/models/usuario.model.dart';
import 'package:app_escola_ecoaprender/themes/themeEscola.dart';
import 'package:app_escola_ecoaprender/views/shared/pages/comunicado.page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuLateral extends StatefulWidget {
  @override
  _MenuLateralState createState() => _MenuLateralState();
}

class _MenuLateralState extends State<MenuLateral> {
  UsuarioModel usuarioLogado = new UsuarioModel(nome: 'Eco Aprender', email: 'ecoaprender@email.com');

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeEscola.corPrimariaClaro2,
      child: ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: ThemeEscola.corPrimaria,
            ),
            accountName: new Text(
              usuarioLogado.nome,
              style: TextStyle(fontSize: 18),
            ),
            accountEmail: new Text(
              usuarioLogado.email,
              style: TextStyle(fontSize: 14),
            ),
            currentAccountPicture: new CircleAvatar(
              backgroundColor: ThemeEscola.corPrimaria,
              backgroundImage: AssetImage('assets/logo-eco-aprender.png'),
            ),
          ),
          new ListTile(
            title: new Text(
              'Comunicados',
              style: TextStyle(
                color: ThemeEscola.corPrimariaEscuro,
                fontSize: 18,
              ),
            ),
            onTap: () {
              // Navigator.of(context).pop();
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (BuildContext context) => new ComunicadoPage()));
            },
          ),
          new Divider(
            color: ThemeEscola.corPrimariaEscuro,
            height: 2.0,
          ),
          new ListTile(
            title: new Text(
              'Sair',
              style: TextStyle(
                color: ThemeEscola.corPrimariaEscuro,
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  '/', (Route<dynamic> route) => false);
            },
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    obterUsuarioLogado();
    super.initState();
  }

  void obterUsuarioLogado() async {
    MenuLateralController controller = Provider.of<MenuLateralController>(context, listen: false);
    UsuarioModel usuario = await controller.obterUsuarioLogado();

    if (usuario == null) {
      return;
    }

    setState(() {
      usuarioLogado = usuario;
    });
  }
}
