class UsuarioModel {
  int id;
  String nome;
  String email;
  String senha;
  String foto;

  UsuarioModel({this.id, this.nome, this.email, this.senha, this.foto});

  UsuarioModel.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    nome = json['Nome'];
    email = json['Email'];
    senha = json['Senha'];
    foto = json['Foto'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Nome'] = this.nome;
    data['Email'] = this.email;
    data['Senha'] = this.senha;
    data['Foto'] = this.foto;
    return data;
  }
}