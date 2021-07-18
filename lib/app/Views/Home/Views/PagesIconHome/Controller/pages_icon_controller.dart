import 'dart:async';

import 'package:ilovemarajo/app/Views/Home/Views/PagesIconHome/Models/praiaModel.dart';
import 'package:ilovemarajo/app/Views/Home/Views/PagesIconHome/Service/pages_icon_service.dart';
import 'package:mobx/mobx.dart';
part 'pages_icon_controller.g.dart';


class PagesIconController = _PagesIconController with _$PagesIconController;

abstract class _PagesIconController with Store {
  
  PagesIconService service = PagesIconService();

  @observable
  StreamController<List<PraiaModel>> dados = StreamController<List<PraiaModel>>();

  @action
  pegarPraiasDoMunicipios(String municipio) async {
    List<PraiaModel> dadosPraiasMuncipio = await service.pegarPraiasDoMunicipios(municipio);
    dados.add(dadosPraiasMuncipio);
  }
}