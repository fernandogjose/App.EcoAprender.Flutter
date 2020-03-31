import 'package:app_escola_ecoaprender/controllers/comunicado.controller.dart';
import 'package:app_escola_ecoaprender/themes/themeEscola.dart';
import 'package:app_escola_ecoaprender/views/shared/widgets/comunicado-lista.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ComunicadoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ComunicadoController controller =
        Provider.of<ComunicadoController>(context);

    return Scaffold(
      appBar: new AppBar(
        backgroundColor: ThemeEscola.azul,
        title: new Text("Comunicados"),
      ),
      body: ComunicadoLista(comunicados: controller.comunicados),
    );
  }
}
