class ComunicadoModel {
  int id;
  DateTime data;
  String titulo;
  String descricao;
  String grupo;

  ComunicadoModel({this.id, this.data, this.titulo, this.descricao, this.grupo});

  ComunicadoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    data = DateTime.parse(json['data']);
    titulo = json['titulo'];
    descricao = json['descricao'];
    grupo = json['grupo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['data'] = this.data;
    data['titulo'] = this.titulo;
    data['descricao'] = this.descricao;
    data['grupo'] = this.grupo;
    return data;
  }
}
