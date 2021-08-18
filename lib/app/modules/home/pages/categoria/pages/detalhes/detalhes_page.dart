import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ilovemarajo/app/modules/home/models/praiaModel.dart';
import 'package:ilovemarajo/app/modules/home/pages/categoria/pages/detalhes/widgets/bottom_nav_bar.dart';
import 'package:ilovemarajo/app/modules/home/pages/categoria/pages/detalhes/widgets/tab_bar_views/descricao_tab.dart';

class DetalhesPage extends StatefulWidget {
  final PraiaModel praiaModel;
  final ImageProvider<Object> imageProvider;
  DetalhesPage({required this.praiaModel, required this.imageProvider});
  @override
  _DetalhesPageState createState() => _DetalhesPageState();
}

class _DetalhesPageState extends State<DetalhesPage> with SingleTickerProviderStateMixin {
  List<Widget> listaTabBar = [
    Tab(text: 'Descrição'),
    Tab(text: 'Avaliações'),
    Tab(text: 'Fotos'),
  ];

  List<Widget> listaConteudoTabBar () {
    return [
      DescricaoTab(widget.praiaModel),
      Container(),
      Container(),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalhes'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * .4,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: widget.imageProvider
              )
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  widget.praiaModel.nomePraia!,
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                    )
                  ),
              )
            ),
          ),

          DefaultTabController(
            length: listaTabBar.length,
            initialIndex: 0, 
            child: Expanded(
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