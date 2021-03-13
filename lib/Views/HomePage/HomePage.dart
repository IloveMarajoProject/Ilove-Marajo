import 'dart:async';
import 'dart:convert';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:ilovemarajo/Api/Api.dart';
import 'package:ilovemarajo/Api/ProdutosModel.dart';

import 'Widgets/ListaWidget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _index = 0;
  int _selectedIndex = 0;
  
  List<Produtos>? produtos;
  StreamController _controller = StreamController<Iterable>();

  _getProdutos(){
    Api.getMunicipios().then((response) {
      setState(() {
          Iterable lista = json.decode(response.body);
          produtos = lista.map((e) => Produtos.fromJson(e)).toList();
          _controller.add(lista);
      });
    });
  }
  @override
    void initState() {
      // TODO: implement initState
      super.initState();
      _getProdutos();
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
                        itemCount: produtos?.length,
                        controller: PageController(viewportFraction: 0.7),
                        onPageChanged: (int index) => setState(() => _index = index),
                        itemBuilder: (context,index){
                          return ListaWidgets(
                            imageURL: produtos?[index].image,
                            indexHome: _index,
                            indexPage: index,
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
