class ResponseModel {
  bool sucesso;
  dynamic objeto;

  ResponseModel({this.sucesso, this.objeto});

  ResponseModel.fromJson(Map<String, dynamic> json) {
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
