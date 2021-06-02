import 'package:flutter/material.dart';
import 'package:ilovemarajo/app/Views/HomePage/Views/InfoPage/Controller/info_controller.dart';
import 'package:ilovemarajo/app/Views/HomePage/Views/InfoPage/Model/avaliacao_model.dart';
import 'package:ilovemarajo/app/Views/HomePage/Views/InfoPage/Widgets/card_avaliacao.dart';

class AvaliacaotabBar extends StatefulWidget {
  final int idLocal;
  AvaliacaotabBar({required this.idLocal});

  @override
  _AvaliacaotabBarState createState() => _AvaliacaotabBarState();
}

class _AvaliacaotabBarState extends State<AvaliacaotabBar> {

  InfoController infoController = InfoController();

  @override
    void initState() {
      // TODO: implement initState
      super.initState();
      infoController.getAvaliacoes(widget.idLocal)
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
      return StreamBuilder<List<AvaliacaoModel>>(
        stream: infoController.dados.stream,
        builder: (context, snapshot) {

          if(!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(backgroundColor: Colors.red),
            );
          }

          List<AvaliacaoModel> dados = snapshot.data!;

          if (dados.isEmpty) {
            return Center(
              child: Text('Sem avaliações :('),
            );
          }

          return ListView.builder(
            itemCount: dados.length,
            itemBuilder: (context,index){
              return CardAvaliacao(
                avaliacaoModel: dados[index],
              );
            },
          );
        }
      );
  }
}