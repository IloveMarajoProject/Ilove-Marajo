import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ilovemarajo/app/Util/Exception/publicMessageException.dart';
import 'package:ilovemarajo/app/Util/VariaveisGlobais.dart';
import 'package:ilovemarajo/app/Views/Home/Models/praia.dart';

class HomeService {

  HomeService();

  Future<List<PraiaModel>> pegarPraiasDoMunicipios(String municipio) async {

    try {
      Response response = await  Dio().get(UrlApiBase.urlBase + 'praias-municipio?municipio=$municipio');
      return PraiaModel.fromJsonList(response.data);
      
    } on DioError catch (e) {
      if (e.error is SocketException) {
        throw new PublicMessageException('Verifique sua conexão');
      }
      throw PublicMessageException('Erro ao carregar dados');
    }

  }
}