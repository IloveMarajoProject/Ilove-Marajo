import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ilovemarajo/app/Views/HomePage/Views/InfoPage/Widgets/bottom_nav_bar.dart';
import 'package:ilovemarajo/app/Views/HomePage/Models/praia.dart';
import 'package:ilovemarajo/app/Views/HomePage/Views/InfoPage/Widgets/card_avaliacao.dart';
class InfoPage extends StatefulWidget {
  final PraiaModel praiaModel;
  InfoPage(this.praiaModel);
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> with SingleTickerProviderStateMixin {


  String get descricao {
    if (widget.praiaModel != null){
      return widget.praiaModel.descricao!;
    }

    return 'Erro na descrição';
  }

  List<Widget> listaTabBar = [
    Tab(text: 'Descrição'),
    Tab(text: 'Avaliações'),
    Tab(text: 'Fotos'),
  ];

  List<Widget> listaConteudoTabBar () {
    return [
     ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              descricao,
              style: TextStyle(
                fontSize: 18
              ),
            ),
          ),
        ],
      ),
      ListView(
        children: [
          CardAvaliacao(),
          CardAvaliacao(),
          CardAvaliacao(),
        ],
      ),
      Container(
        child: Center(
          child: Text('Display Tab 3', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
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
                      image: NetworkImage(widget.praiaModel.foto.toString())
                    )
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
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
                        widget.praiaModel.nomePraia.toString(),
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
      ),

      bottomNavigationBar: BottomNavBarWidget(
        praiaModel: widget.praiaModel,
      ),
    );
  }

}