import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ilovemarajo/app/Views/Home/Models/praia.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ilovemarajo/app/Views/Home/Views/PagesIconHome/Views/InfoPage/info_page.dart';

enum OptionsNavigator{
  praias,
  restaurantes,
  hoteis
}

class ListaWidget extends StatelessWidget{
  final PraiaModel? praiaModel;
  final OptionsNavigator optionsNavigator;
  ListaWidget({this.praiaModel, required this.optionsNavigator});

  String get nomeLocal {
    if(praiaModel != null){
      return praiaModel!.nomePraia.toString();
    }
    return 'Erro';
  }

  String get fotoLocal {
    if(praiaModel != null){
      return praiaModel!.foto.toString();
    }
    return 'Erro';
  }

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: fotoLocal,
      placeholder: (context, url) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: CircularProgressIndicator(backgroundColor: Colors.red)),
      ),
      imageBuilder:(context, imageProvider) => InkWell(
        onTap: (){
          switch (optionsNavigator) {
            case OptionsNavigator.praias:
              Navigator.of(context).push(
                MaterialPageRoute(builder: (_) => InfoPage(
                  praiaModel: praiaModel, 
                  imageProvider: imageProvider
                  )
                )
              );
              break;

            case OptionsNavigator.hoteis:
              print('teste');
              break;

            case OptionsNavigator.restaurantes:
              print('teste');
              break;
          }
        },
        child: Container(
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 7,
                offset: Offset(5, 8), // changes position of shadow
              ),         
            ],
            image: DecorationImage(
              fit: BoxFit.cover,
              image: imageProvider
            )
          ),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.black.withOpacity(0.3),
            ),
            child: Column(
              children: [

                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(top: 150),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 80,vertical: 15),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12)
                        )
                      ),
                      child: AutoSizeText(
                        nomeLocal,
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}