class PraiaModel {
  int? idPraia;
  String? nomePraia;
  String? descricao;
  String? foto;
  String? lat;
  String? lon;
  double? avaliacao;
  String? municipio;

  PraiaModel(
      {this.idPraia,
      this.nomePraia,
      this.descricao,
      this.foto,
      this.lat,
      this.lon,
      this.avaliacao,
      this.municipio});

  PraiaModel.fromJson(Map<String, dynamic> json) {
    idPraia = json['id_praia'];
    nomePraia = json['nome_praia'];
    descricao = json['descricao'];
    foto = json['foto'];
    lat = json['lat'];
    lon = json['lon'];
    avaliacao = json['avaliacao'] is int ? (json['avaliacao'] as int).toDouble() : json['avaliacao'];
    municipio = json['municipio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_praia'] = this.idPraia;
    data['nome_praia'] = this.nomePraia;
    data['descricao'] = this.descricao;
    data['foto'] = this.foto;
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    data['avaliacao'] = this.avaliacao;
    data['municipio'] = this.municipio;
    return data;
  }

  static List<PraiaModel> fromJsonList (List lista){
    if (lista == null) {
      return null!;
    }
    return lista.map((e) => PraiaModel.fromJson(e)).toList();
  }

}