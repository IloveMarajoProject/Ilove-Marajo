import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ilovemarajo/app/Shared/Exception/publicMessageException.dart';
import 'package:ilovemarajo/app/Shared/VariaveisGlobais.dart';
import 'package:ilovemarajo/app/modules/initial/models/municipio.dart';

class InitialService {

  InitialService();

  Future<List<MunicipioModel>> pegarMunicipios() async {

    try {

      Response response = await  Dio().get(UrlApiBase.urlBase + 'municipios');
      print(response.data);
      return MunicipioModel.fromJsonList(response.data);

    } on DioError catch (e) {
       if (e.error is SocketException) {
        throw new PublicMessageException('Verifique sua conexão');
      }
      throw PublicMessageException('Erro ao carregar dados');
    }

  }
  
}