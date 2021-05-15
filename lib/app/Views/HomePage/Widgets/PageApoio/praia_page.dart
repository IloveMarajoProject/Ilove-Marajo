import 'package:flutter/material.dart';
import 'package:ilovemarajo/app/Util/Exception/publicMessageException.dart';
import 'package:ilovemarajo/app/Views/HomePage/Controller/home_controller.dart';
import 'package:ilovemarajo/app/Views/HomePage/Models/praia.dart';
import 'package:ilovemarajo/app/Views/HomePage/Views/InfoPage/info_page.dart';
import 'package:ilovemarajo/app/Views/InitialPage/Models/municipio.dart';

import 'Widgets/lista_widget.dart';

class PraiaPage extends StatefulWidget {
  final MunicipioModel dadosMuncipio;
  PraiaPage(this.dadosMuncipio);
  @override
  _PraiaPageState createState() => _PraiaPageState();
}

class _PraiaPageState extends State<PraiaPage> {
  HomeController controller = HomeController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.pegarPraiasDoMunicipios(widget.dadosMuncipio.nome_municipios.toString())
      .catchError((e){
        return ScaffoldMessenger.of(context)
          .showSnackBar(
            SnackBar(
              backgroundColor: Colors.red,
              duration: Duration(seconds: 20),
              content: Text(e.toString())));
      });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Praias'),
          centerTitle: true,
          backgroundColor: Colors.blueAccent[900],
        ),
        body: StreamBuilder<List<PraiaModel>>(
            stream: controller.dados.stream,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text('Erro inesperado :('),
                );
              } else if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(
                    backgroundColor: Colors.red,
                  ),
                );
              }
              List<PraiaModel>? dados = snapshot.data;

              if (dados!.isEmpty) {
                return Center(
                  child: Text('Sem dados cadastrados :)'),
                );
              }
              return ListView.builder(
                itemCount: dados.length,
                itemBuilder: (context, index) {
                  return ListaWidget(
                    praiaModel: dados[index],
                    onTapNavigator: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (_) => InfoPage(dados[index]))
                      );
                    },
                  );
                },
              );
            }
        )
    );
  }
}
