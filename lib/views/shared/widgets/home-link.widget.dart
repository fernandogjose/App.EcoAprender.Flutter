import 'package:app_escola_ecoaprender/themes/themeEscola.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeLink extends StatelessWidget {
  final String link;
  final Color corDeFundo;
  final Function pagina;

  HomeLink(
      {@required this.link, @required this.corDeFundo, @required this.pagina});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: EdgeInsets.only(top: 1),
        child: Container(
          padding: EdgeInsets.all(50),
          color: corDeFundo,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                link,
                style: TextStyle(
                  color: ThemeEscola.homeLinkFontColor,
                  fontSize: ThemeEscola.homeLinkFontSize,
                  fontWeight: ThemeEscola.homeLinkFontWeight,
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        // Navigator.of(context).pop();
        Navigator.push(
          context,
          new MaterialPageRoute(builder: pagina),
        );
      },
    );
  }
}
