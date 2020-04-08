import 'package:flutter/widgets.dart';
import '../models/erro.model.dart';
import '../models/comunicado.model.dart';
import '../repositories/comunicado.repository.dart';

class ComunicadoController extends ChangeNotifier {
  final comunicadoRepository = new ComunicadoRepository();
  List<ComunicadoModel> comunicados;
  List<ErroModel> erros;

  ComunicadoController() {
    listar();
  }

  listar() {
    comunicadoRepository.listar().then((response) {
      this.comunicados = response;
      notifyListeners();
    }).catchError((erros) {
      this.erros = erros;
    });
  }
}
