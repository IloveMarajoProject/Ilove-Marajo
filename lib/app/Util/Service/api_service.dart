import 'package:dio/dio.dart';
import 'package:ilovemarajo/app/Util/VariaveisGlobais.dart';
import 'package:http/http.dart' as http;

class ApiDioBuilder {

  Future pegarMunicipios()async{

    try {

      Uri rotaUrl =  Uri.parse(UrlApiBase.urlBase + '/municipios');
      var response = await http.get(rotaUrl);

      return response;

    } catch (e) {
      print(e);
    }

  }
  
}