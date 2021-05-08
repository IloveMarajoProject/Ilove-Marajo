import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ilovemarajo/app/Util/Exception/publicMessageException.dart';
import 'package:ilovemarajo/app/Util/VariaveisGlobais.dart';
import 'package:ilovemarajo/app/Views/HomePage/Models/praia.dart';

class HomeService {

  HomeService();

  Future<List<PraiaModel>> pegarPraisDoMunicipios(String municipio) async {

    try {
      Response response = await  Dio().get(UrlApiBase.urlBase + 'prais-municipio?municipios=$municipio');
      return PraiaModel.fromJsonList(response.data);
      
    } on DioError catch (e) {
      if (e.error is SocketException) {
        throw new PublicMessageException('Verifique sua conexão');
      }
      throw PublicMessageException('Erro desconhecido');
    }

  }
}