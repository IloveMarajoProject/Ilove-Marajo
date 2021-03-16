import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hasura_connect/hasura_connect.dart';
import 'package:ilovemarajo/Util/VariaveisGlobais.dart';
import 'package:ilovemarajo/Views/HomePage/Widgets/ListaWidget.dart';
import 'package:ilovemarajo/Views/InfoPage/InfoPage.dart';

class PagePesquisa extends StatefulWidget {

  int? id;
  String? nomeDaPesquisa;
  PagePesquisa({this.id,this.nomeDaPesquisa});

  @override
  _PagePesquisaState createState() => _PagePesquisaState();
}

class _PagePesquisaState extends State<PagePesquisa> {
  HasuraConnect hasuraConnect = HasuraConnect(HASURA_URL);
  int _index = 0;
  var pontosTuristicos;

  StreamController _controller = StreamController();

  hasura_GetdadosPontosTuristicos()async{
    Snapshot snapshot = await hasuraConnect.subscription(

      """
      subscription MySubscription {
        Municipios_by_pk(id: ${widget.id.toString()}) {
          id
          nome
          PontosTuristicos(where: {nome: {_similar: "${widget.nomeDaPesquisa}"}}) {
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
      snapshot.listen((data)async{
        pontosTuristicos = await data["data"]["Municipios_by_pk"]["PontosTuristicos"];
        _controller.add(pontosTuristicos);
        print(pontosTuristicos);
        print(widget.nomeDaPesquisa);
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
      appBar: AppBar(
        actionsIconTheme: IconThemeData(color: Colors.white),
        title: Text(
          widget.nomeDaPesquisa.toString()),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SafeArea(
        child: StreamBuilder(
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
            }else if(pontosTuristicos.isEmpty){
              return Center(
                child: Text(
                  'Dados não encontrados :(',
                  style: TextStyle(
                    fontSize: 20
                  ),
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
                      //Navegar para tela de informações
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context)=>InfoPage(
                          nome: pontosTuristicos[index]["nome"],
                          texto: pontosTuristicos[index]["descricao"],
                          perfil: pontosTuristicos[index]["perfil"],
                          latitude: pontosTuristicos[index]["latitude"],
                          longitude: pontosTuristicos[index]["longitude"],
                          ))
                      );
                    },
                    //Lista////////////////////////
                    child: ListaWidgets(
                      nome: pontosTuristicos[index]["nome"],
                      perfil: pontosTuristicos[index]["perfil"],
                    ),
                  ),
                );
              },
            );
          }
        )),
    );
  }
}