import 'package:dio/dio.dart';
import 'package:ilovemarajo/app/Util/VariaveisGlobais.dart';
import 'package:ilovemarajo/app/Views/HomePage/Models/praia.dart';

class HomeService {

  HomeService();

  Future<List<PraiaModel>> pegarPraisDoMunicipios(String municipio) async {

    try {
      Response response = await  Dio().get(UrlApiBase.urlBase + 'prais-municipio?municipios=$municipio');
      final dados = response.data;
      return PraiaModel.fromJsonList(response.data);
      
    } catch (e) {
      throw e;
    }

  }
}