import 'package:app_escola_ecoaprender/themes/themeEscola.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class ComunicadoDetalhePage extends StatelessWidget {
  final DateTime data;
  final String grupo;
  final String titulo;
  final String descricao;

  ComunicadoDetalhePage(
      {@required this.data,
      @required this.grupo,
      @required this.titulo,
      @required this.descricao});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: ThemeEscola.corPrimaria,
        title: new Text("Comunicado"),
      ),
      body: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: Text(
                titulo,
                style: TextStyle(
                    color: ThemeEscola.tituloFontColor,
                    fontSize: ThemeEscola.tituloFontSize,
                    fontWeight: ThemeEscola.tituloFontWeight),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                grupo + ' - ' + DateFormat('dd/MM/yyyy').format(data),
                style: TextStyle(
                    color: ThemeEscola.tituloPequenoFontColor,
                    fontSize: ThemeEscola.tituloPequenoFontSize,
                    fontWeight: ThemeEscola.tituloPequenoFontWeight),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: Text(
                descricao,
                style: TextStyle(
                    color: ThemeEscola.padraoFontColor,
                    fontSize: ThemeEscola.padraoFontSize,
                    fontWeight: ThemeEscola.padraoFontWeight),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
