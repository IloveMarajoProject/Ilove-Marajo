import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ilovemarajo/app/Util/Exception/publicMessageException.dart';
import 'package:ilovemarajo/app/Util/VariaveisGlobais.dart';
import 'package:ilovemarajo/app/Views/HomePage/Views/InfoPage/Model/avaliacao_model.dart';

class InfoPageService {
    Future getAvaliacoes ({required int idLocal}) async{
    try {

      Response response = await Dio().get(UrlApiBase.urlBase + 'avaliacoes-praia?id_local=$idLocal');
      return AvaliacaoModel.fromJsonList(response.data);

    } on DioError catch (e) {
      if (e.error is SocketException) {
        throw new PublicMessageException('Erro de conexão!! Verifique sua conexão');
      }
      throw PublicMessageException('Erro ao buscar avaliações');
    }
  }
}