import 'dart:async';
import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ilovemarajo/Api/Api.dart';
import 'package:ilovemarajo/Api/ProdutosModel.dart';
import 'package:ilovemarajo/Util/VariaveisGlobais.dart';
import 'package:ilovemarajo/Views/InfoPage/InfoPage.dart';

import 'Widgets/ListaWidget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;
  
  //Inicializa o servidor com a URL
  HasuraConnect hasuraConnect = HasuraConnect(HASURA_URL);


  //variavel que pega o retorno do metodo #hasura_GetdadosMunicipios# para poder listar os municipios
  var pontosTuristicos;
  StreamController _controller = StreamController();

  //Metodo que pega os dados do servidor
  hasura_GetdadosPontosTuristicos()async{
    Snapshot snapshot = await hasuraConnect.subscription(

      """
      subscription MySubscription {
        Municipios_by_pk(id: 1) {
          id
          nome
          PontosTuristicos {
            id
            nome
            descricao
            perfil
            longitude
            latitude
          }
        }
      }
      """
    );
      snapshot.listen((data) {
        pontosTuristicos = data["data"]["Municipios_by_pk"]["PontosTuristicos"];
        _controller.add(pontosTuristicos);
        print(pontosTuristicos);
      }).onError((err) {
        print(err);
      });
  }
  @override
    void initState() {
      super.initState();
      hasura_GetdadosPontosTuristicos();
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: SafeArea(
       child: Column(
         children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: AutoSizeText(
                      'Explore',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.share,
                    size: 30,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: TextField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                    ),
                    hintText: 'Para onde deseja ir?',
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.black,
                    )),
              ),
            ),

            Expanded(
              child: Container(
                child: StreamBuilder(
                  initialData: 'Carregando dados',
                  stream: _controller.stream,
                  builder: (context, snapshot) {

                    if(snapshot.hasError){
                      return Center(
                        child: Text('Erro inesperado :('),
                      );
                    }else if(!snapshot.hasData){
                      return Center(
                        child: CircularProgressIndicator(
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                      return PageView.builder(
                        itemCount: pontosTuristicos.length,
                        controller: PageController(viewportFraction: 0.7),
                        onPageChanged: (int index) => setState(() => _index = index),
                        itemBuilder: (context,index){
                          return Transform.scale(
                            scale: index == _index ? 1.0 : 0.9,
                            child: GestureDetector(
                              onTap: (){
                                Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context)=>InfoPage(
                                    nome: pontosTuristicos[index]["nome"],
                                    texto: pontosTuristicos[index]["descricao"],
                                    perfil: pontosTuristicos[index]["perfil"],
                                    ))
                                );
                              },
                              child: ListaWidgets(
                                nome: pontosTuristicos[index]["nome"],
                                perfil: pontosTuristicos[index]["perfil"],
                              ),
                            ),
                          );
                        },
                      );
                  }
                ),
              ),
            )
         ],
       )),
    );
  }
}
