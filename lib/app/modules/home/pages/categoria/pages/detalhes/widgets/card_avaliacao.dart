import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ilovemarajo/app/modules/home/pages/categoria/pages/detalhes/models/avaliacao_model.dart';

class CardAvaliacao extends StatelessWidget {
  final AvaliacaoModel avaliacaoModel;
  CardAvaliacao({required this.avaliacaoModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Padding(
              padding: const EdgeInsets.only(left: 14,top: 10),
              child: Text(avaliacaoModel.nomeUsuario.toString()),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10,top: 5),
              child: RatingBar(
                initialRating: avaliacaoModel.nota!,
                itemSize: 15,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                ratingWidget: RatingWidget(
                  full: Icon(Icons.star,color: Colors.yellow,),
                  empty: Icon(Icons.star),
                  half: Icon(Icons.star)
                ),
                itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                onRatingUpdate: (_){},
                ignoreGestures: true,
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 5),
              child: Text(avaliacaoModel.comentario.toString()),
            )

          ],
        ),
      ),
    );
  }
}