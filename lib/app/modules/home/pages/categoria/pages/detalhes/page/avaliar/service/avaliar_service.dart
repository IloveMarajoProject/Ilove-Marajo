import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ilovemarajo/app/Shared/VariaveisGlobais.dart';
import 'package:ilovemarajo/app/Shared/exception/publicMessageException.dart';

class AvaliarService {

  Future enviarAvaliacao ({double? nota, String? nome, String? comentario, int? idLocal}) async {
    try {
      await Dio().post(
        UrlApiBase.urlBase + 'avaliar-praia',
        data: {
          'nota': nota,
          'nome_usuario': nome,
          'comentario': comentario,
          'id_local': idLocal
        }  
      );

    } on DioError catch (e) {
      if (e.error is SocketException) {
        throw new PublicMessageException('Erro de conexão!! Verifique sua conexão');
      }
      throw PublicMessageException('Erro ao enviar avaliação');
    }
  }
}