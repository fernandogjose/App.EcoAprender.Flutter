import 'package:app_escola_ecoaprender/themes/themeEscola.dart';
import 'package:app_escola_ecoaprender/views/shared/widgets/menu-lateral.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          backgroundColor: ThemeEscola.corPrimaria,
          title: new Text("Eco Aprender"),
        ),
        drawer: new Drawer(child: MenuLateral()),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[],
          ),
        ));
  }
}
