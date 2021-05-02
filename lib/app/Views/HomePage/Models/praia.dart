class PraiaModel {
  String? nomeMunicipios;
  String? nomePraia;
  String? descricao;
  String? foto;
  double? avaliacao;
  String? lat;
  String? long;

  PraiaModel(
      {this.nomeMunicipios,
      this.nomePraia,
      this.descricao,
      this.foto,
      this.avaliacao,
      this.lat,
      this.long});

  PraiaModel.fromJson(Map<String, dynamic> json) {
    nomeMunicipios = json['nome_municipios'];
    nomePraia = json['nome_praia'];
    descricao = json['descricao'];
    foto = json['foto'];
    avaliacao = json['avaliacao'] is int ? (json['avaliacao'] as int).toDouble() : json['avaliacao'];
    lat = json['lat'];
    long = json['long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome_municipios'] = this.nomeMunicipios;
    data['nome_praia'] = this.nomePraia;
    data['descricao'] = this.descricao;
    data['foto'] = this.foto;
    data['avaliacao'] = this.avaliacao;
    data['lat'] = this.lat;
    data['long'] = this.long;
    return data;
  }

  static List<PraiaModel> fromJsonList (List list){
    if(list == null){
      return null!;
    }

    return list.map((e) => PraiaModel.fromJson(e)).toList();
  }
}