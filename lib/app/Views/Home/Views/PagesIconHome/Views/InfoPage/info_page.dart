import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ilovemarajo/app/Views/Home/Models/praia.dart';
import 'package:ilovemarajo/app/Views/Home/Views/PagesIconHome/Views/InfoPage/Widgets/TabBarWidgets/avaliacoes_tab.dart';
import 'package:ilovemarajo/app/Views/Home/Views/PagesIconHome/Views/InfoPage/Widgets/TabBarWidgets/descricao_tab.dart';
import 'package:ilovemarajo/app/Views/Home/Views/PagesIconHome/Views/InfoPage/Widgets/TabBarWidgets/fotos_tab.dart';
import 'package:ilovemarajo/app/Views/Home/Views/PagesIconHome/Views/InfoPage/Widgets/bottom_nav_bar.dart';

class InfoPage extends StatefulWidget {
  final PraiaModel? praiaModel;
  final ImageProvider<Object> imageProvider;
  InfoPage({this.praiaModel, required this.imageProvider});
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> with SingleTickerProviderStateMixin {


  String get descricao {
    if (widget.praiaModel != null){
      return widget.praiaModel!.descricao.toString();
    }

    return 'Erro na descrição';
  }

  String get nomeLocal {
    if (widget.praiaModel != null){
      return widget.praiaModel!.nomePraia.toString();
    }

    return 'Erro no nome';
  }

  int? get idLocal {
    if (widget.praiaModel != null){
      return widget.praiaModel!.idPraia;
    }
    return 1;
  }

  List<Widget> listaTabBar = [
    Tab(text: 'Descrição'),
    Tab(text: 'Avaliações'),
    Tab(text: 'Fotos'),
  ];

  List<Widget> listaConteudoTabBar () {
    return [
      DescricaoTabBar(descricao: descricao),
      AvaliacaotabBar(idLocal: idLocal!),
      FotosTaoBar()
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .46,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(22),
                    bottomRight: Radius.circular(22),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: widget.imageProvider
                  )
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  vertical: 30,
                  horizontal: 10
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(32)
                ),
                child: IconButton(
                  color: Colors.black,
                  icon: Icon(Icons.keyboard_arrow_left),
                  iconSize: 35,
                  onPressed: (){
                    Navigator.of(context).pop();
                  }
                ),
              ),

              Positioned(
                bottom: 10,
                right: 0,
                left: 0,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Expanded(
                    child: AutoSizeText(
                      nomeLocal,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),


          DefaultTabController(
            length: listaTabBar.length,
            initialIndex: 0, 
            child: Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    child: TabBar(
                      labelColor: Colors.green,
                      unselectedLabelColor: Colors.black,
                      tabs: listaTabBar
                    ),
                  ),
                  Flexible(
                    child: TabBarView(
                      children: listaConteudoTabBar()
                    ),
                  )
          
                ],
              ),
            )
          )

        ],
      ),

      bottomNavigationBar: BottomNavBarWidget(
        praiaModel: widget.praiaModel,
      ),
    );
  }

}