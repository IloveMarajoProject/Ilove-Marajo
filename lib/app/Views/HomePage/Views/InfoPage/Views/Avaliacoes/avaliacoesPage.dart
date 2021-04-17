import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ilovemarajo/app/Util/Controller/GoogleLoginController/google_controller.dart';
import 'package:ilovemarajo/app/Views/HomePage/Views/InfoPage/Views/Avaliacoes/Controller/avaliacao_controller.dart';

class Avaliacao extends StatefulWidget {
  final DocumentSnapshot documentSnapshot;

  Avaliacao(this.documentSnapshot);
  @override
  _AvaliacaoState createState() => _AvaliacaoState();
}

class _AvaliacaoState extends State<Avaliacao> {
  FocusNode focusNode = new FocusNode();
  AvaliacaoController _controller = AvaliacaoController();
  GoogleLoginController _GoogleControllerPage = GoogleLoginController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseAuth.instance
      .authStateChanges()
      .listen((user) {
        setState(() {
          _GoogleControllerPage.setUser(user);            
        });
      });
  }
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Avaliar',style: TextStyle(color: Colors.black)),
        centerTitle: true,
        leading: IconButton(
          iconSize: 30,
          color: Colors.black,
          icon: Icon(Icons.keyboard_arrow_down_outlined),
          onPressed: (){
            focusNode.unfocus();
            Navigator.of(context).pop();
          }
        ),

        actions: [
          Observer(
            builder: (_) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: _controller.isButtonActivate?()async{
                    await enviarAvaliacao(
                      star: _controller.estrelas,
                      texto: _controller.pesquisa
                    ).then((value) {
                      _controller.editingController.clear();
                      _controller.removeAvaliacao();
                      focusNode.unfocus();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Mensagem enviada"),
                          backgroundColor: Colors.blue,
                        )
                      );
                      Navigator.of(context).pop();
                    }).catchError((e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Erro ao enviar mensagem"),
                          backgroundColor: Colors.red,
                        )
                      );
                    });
                  }
                  :
                  null
                  , 
                  child: Text('Enviar')
                ),
              );
            }
          )
        ],
      ),
      body: Form(
        key: _controller.validacao,
        child: Observer(
          builder: (_){
            return Column(
              children: [
                Center(
                  child: RatingBar(
                    initialRating: 0,
                    itemSize: 55,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    ratingWidget: RatingWidget(
                      full: Icon(Icons.star,color: Colors.yellow,),
                      empty: Icon(Icons.star),
                      half: Icon(Icons.star)
                    ),
                    itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
                    onRatingUpdate: (rating) {
                      _controller.setEstrelas(rating);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Toque em uma estrela para classificar',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    height: size.height*.3,
                    color: Colors.black12,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        focusNode: focusNode,
                        controller: _controller.editingController,
                        onChanged: (value){
                          _controller.setAvaliacao(value);
                        },
                        keyboardType: TextInputType.multiline,
                        maxLength: 140,
                        maxLines: null,
                        decoration: InputDecoration.collapsed(
                          hintText: 'Digite um novo sentimento',
                        ),
                      ),
                    ),
                  ),
                ),
                
              ],
            );
          }
        ),
      ),
    );
  }

  Future enviarAvaliacao({String? texto,double? star}) async {
    Map<String, dynamic> data = {
      "uid" : _GoogleControllerPage.currentUser!.uid.toString(),
      "star": star,
      "nome": _GoogleControllerPage.currentUser!.displayName.toString(),
      "texto": texto,
      "Time": FieldValue.serverTimestamp()
    };
    return await FirebaseFirestore.instance.collection('Avaliacoes').doc(widget.documentSnapshot['nome']).collection('notas').add(data);
  } 
}