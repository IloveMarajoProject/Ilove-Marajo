class AvaliacaoModel {
  int? idAvaliacao;
  String? nomeUsuario;
  double? nota;
  String? comentario;
  int? idLocal;

  AvaliacaoModel(
      {this.idAvaliacao,
      this.nomeUsuario,
      this.nota,
      this.comentario,
      this.idLocal});

  AvaliacaoModel.fromJson(Map<String, dynamic> json) {
    idAvaliacao = json['id_avaliacao'];
    nomeUsuario = json['nome_usuario'];
    nota = json['nota'] is int ? (json['nota'] as int).toDouble() : json['nota'];
    comentario = json['comentario'];
    idLocal = json['id_local'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_avaliacao'] = this.idAvaliacao;
    data['nome_usuario'] = this.nomeUsuario;
    data['nota'] = this.nota;
    data['comentario'] = this.comentario;
    data['id_local'] = this.idLocal;
    return data;
  }

  static List<AvaliacaoModel> fromJsonList (List lista){
    if(lista == null){
      return null!;
    }

    return lista.map((e) => AvaliacaoModel.fromJson(e)).toList();
  }
}