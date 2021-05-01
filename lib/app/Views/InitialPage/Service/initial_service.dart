import 'package:dio/dio.dart';
import 'package:ilovemarajo/app/Util/VariaveisGlobais.dart';
import 'package:ilovemarajo/app/Views/InitialPage/Models/municipio.dart';

class InitialService {

  InitialService();

  Future<List<MunicipioModel>> pegarMunicipios() async {

    try {

      Response response = await  Dio().get(UrlApiBase.urlBase + 'municipios');
      return MunicipioModel.fromJsonList(response.data);

    } catch (e) {
      throw e;
    }

  }
  
}