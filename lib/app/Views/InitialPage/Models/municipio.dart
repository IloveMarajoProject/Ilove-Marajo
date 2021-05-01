class MunicipioModel {
  int? id_municipios;
  String? nome_municipios;

  MunicipioModel({this.id_municipios, this.nome_municipios});

  MunicipioModel.fromJson(Map<String, dynamic> json) {
    id_municipios= json['id'];
    nome_municipios = json['nome_municipios'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id_municipios'] = this.id_municipios;
    data['nome_municipios'] = this.nome_municipios;
    return data;
  }
  static List<MunicipioModel> fromJsonList(List list) {
    if (list == null) {
      return null!;
    }

    return list.map((item) => MunicipioModel.fromJson(item)).toList();
  }
}