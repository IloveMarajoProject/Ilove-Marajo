import 'package:hasura_connect/hasura_connect.dart';
import 'package:ilovemarajo/app/Util/VariaveisGlobais.dart';

class HasuraServiceApi {

  HasuraConnect hasuraConnect = HasuraConnect(HASURA_URL);

  pegarMunicipios() async {

    Snapshot snapshot = await hasuraConnect.subscription(VariaveisQuery.pegarMunicipios);
    
    snapshot.listen((data) { 
      return data;
    }).onError((e){
      print(e);
    });
    
  }

}