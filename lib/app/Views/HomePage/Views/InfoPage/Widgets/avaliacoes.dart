import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class AvaliacoesContainer extends StatelessWidget {
  DocumentSnapshot documentSnapshot;
  AvaliacoesContainer(this.documentSnapshot);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 300,
        decoration: BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10,bottom: 10,top: 10),
              child: AutoSizeText(
                documentSnapshot['nome'],
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: RatingBar(
                initialRating: documentSnapshot['star'],
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

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: AutoSizeText(documentSnapshot['texto']),
              )
            ),

            Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AutoSizeText('Data'),
              ),
            )
          ],
        )
      ),
    );
  }
}