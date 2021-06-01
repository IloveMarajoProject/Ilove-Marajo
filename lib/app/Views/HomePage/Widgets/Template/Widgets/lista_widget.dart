import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:ilovemarajo/app/Views/HomePage/Models/praia.dart';
import 'package:ilovemarajo/app/Views/HomePage/Views/InfoPage/info_page.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ListaWidget extends StatelessWidget{
  final PraiaModel? praiaModel;
  final VoidCallback onTapNavigator;
  ListaWidget({this.praiaModel, required this.onTapNavigator});

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

  String get estrelasLocal {

    if(praiaModel != null){
      return praiaModel!.avaliacao.toString();
    }
    return '4.5';
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.blue,
      onTap: () => this.onTapNavigator(),
      child: CachedNetworkImage(
        imageUrl: fotoLocal,
        placeholder: (context, url) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: CircularProgressIndicator(backgroundColor: Colors.red)),
        ),
        imageBuilder:(context, imageProvider) => Container(
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
                  alignment: Alignment.topRight,
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white24,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(estrelasLocal,
                            style: TextStyle(fontSize: 20,color: Colors.white)
                          ),
                          Icon(Icons.star,color: Colors.white,)
                        ],
                      ),
                    ),
                  )
                ),

                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20,bottom: 20,top: 110),
                    child: AutoSizeText(
                      nomeLocal,
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.white,
                        fontWeight: FontWeight.bold
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