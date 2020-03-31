import 'package:app_escola_ecoaprender/models/comunicado.model.dart';
import 'package:app_escola_ecoaprender/themes/themeEscola.dart';
import 'package:app_escola_ecoaprender/views/shared/widgets/loader.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class ComunicadoLista extends StatelessWidget {
  final List<Comunicado> comunicados;

  ComunicadoLista({@required this.comunicados});

  @override
  Widget build(BuildContext context) {
    return Loader(
      callback: lista,
      object: comunicados,
    );
  }

  Widget lista() {
    return ListView.separated(
      itemCount: comunicados.length,
      separatorBuilder: (BuildContext context, int index) => Divider(
        color: ThemeEscola.corPrimariaClaro,
      ),
      itemBuilder: (BuildContext context, int index) {
        Comunicado comunicado = comunicados[index];

        return ListTile(
          title: Text(comunicado.grupo + ' - ' + comunicado.titulo),
          subtitle: Text(DateFormat('dd/MM/yyyy').format(comunicado.data)),
        );
      },
    );
  }
}
