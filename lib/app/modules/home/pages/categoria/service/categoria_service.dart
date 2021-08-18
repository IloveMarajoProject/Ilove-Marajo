import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ilovemarajo/app/Shared/Exception/publicMessageException.dart';
import 'package:ilovemarajo/app/Shared/VariaveisGlobais.dart';
import 'package:ilovemarajo/app/modules/home/models/praiaModel.dart';

class CategoriaService {
  

  Future<List<PraiaModel>> pegarPraiasDoMunicipios(String municipio) async {

    try {
      Response response = await  Dio().get(UrlApiBase.urlBase + 'praias-municipio?nome_municipio=$municipio');
      return PraiaModel.fromJsonList(response.data);
      
    } on DioError catch (e) {
      if (e.error is SocketException) {
        throw new PublicMessageException('Verifique sua conexão');
      }
      throw PublicMessageException('Erro ao carregar dados');
    }

  }
}