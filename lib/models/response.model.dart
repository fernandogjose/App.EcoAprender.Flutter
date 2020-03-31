class ResponseGenerico {
  bool sucesso;
  dynamic objeto;

  ResponseGenerico({this.sucesso, this.objeto});

  ResponseGenerico.fromJson(Map<String, dynamic> json) {
    sucesso = json['sucesso'];
    objeto = json['objeto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Sucesso'] = this.sucesso;
    data['Objeto'] = this.objeto;
    return data;
  }
}
