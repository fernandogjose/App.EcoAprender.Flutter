import 'package:app_escola_ecoaprender/themes/themeEscola.dart';
import 'package:app_escola_ecoaprender/views/shared/pages/comunicado.page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuLateral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeEscola.corPrimarioClaro2,
      child: ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: ThemeEscola.corPrimario,
            ),
            accountName: new Text(
              'Fernando José',
              style: TextStyle(fontSize: 18),
            ),
            accountEmail: new Text(
              'fernandogjose@gmail.com',
              style: TextStyle(fontSize: 14),
            ),
            currentAccountPicture: new CircleAvatar(
              backgroundColor: ThemeEscola.corPrimario,
              backgroundImage: new NetworkImage(
                  'https://www.flaticon.com/premium-icon/icons/svg/668/668709.svg'),
            ),
          ),
          new ListTile(
            title: new Text(
              'Comunicados',
              style: TextStyle(
                color: ThemeEscola.corPrimarioEscuro,
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (BuildContext context) => new ComunicadoPage()));
            },
          ),
          new Divider(
            color: ThemeEscola.corPrimarioEscuro,
            height: 2.0,
          ),
          new ListTile(
            title: new Text(
              'Comunicados',
              style: TextStyle(
                color: ThemeEscola.corPrimarioEscuro,
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (BuildContext context) => new ComunicadoPage()));
            },
          ),
        ],
      ),
    );
  }
}
