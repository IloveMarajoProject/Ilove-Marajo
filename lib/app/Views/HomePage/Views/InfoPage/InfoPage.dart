import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ilovemarajo/app/Views/HomePage/Views/InfoPage/Views/Avaliacoes/avaliacoesPage.dart';
import 'package:ilovemarajo/app/Views/HomePage/Views/InfoPage/Widgets/avaliacoes.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';
class InfoPage extends StatefulWidget {
  final DocumentSnapshot documentSnapshot;

  InfoPage(this.documentSnapshot);
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {

  final GoogleSignIn googleSignIn = GoogleSignIn();
  User? currentUser; 
  TextEditingController mensagem = TextEditingController();
  GlobalKey<FormState> validacao = GlobalKey<FormState>();
  @override
    void initState() {
      super.initState();
      FirebaseAuth.instance
        .authStateChanges()
        .listen((user) {
          setState(() {
            currentUser = user!;            
          });
        });
    }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * .5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(22),
                        bottomRight: Radius.circular(22),
                      ),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(widget.documentSnapshot['foto'].toString())
                      )
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        color: Colors.white,
                        icon: Icon(Icons.keyboard_arrow_left),
                        iconSize: 35,
                        onPressed: (){
                          Navigator.of(context).pop();
                        }
                      ),
                      IconButton(
                        color: Colors.white,
                        icon: Icon(Icons.star_border),
                        iconSize: 35,
                        onPressed: (){}
                      )
                    ],
                  ),

                  Positioned(
                    bottom: 10,
                    right: 0,
                    left: 0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: AutoSizeText(
                              widget.documentSnapshot['nome'].toString(),
                              maxLines: 1,
                              style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: Colors.white
                              ),
                            ),
                          ),
                          ElevatedButton.icon(
                            onPressed: (){
                              openMapsSheet(context);
                            },
                            icon: Icon(Icons.location_on),
                            label: Text('Ir ao local')),
                        ],
                      ),
                    ),
                  ),

                ],
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  widget.documentSnapshot['descricao'].toString(),
                  style: TextStyle(
                    fontSize: 18
                  ),
                ),
              ),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10,top: 10,bottom: 10),
                    child: Text(
                      'Avaliações',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      ),  
                    ),
                  ),
                  TextButton.icon(
                    onPressed: (){
                      showGeneralDialog(
                        context: context,
                        barrierDismissible: false,
                        barrierColor: Colors.black.withOpacity(0.5),
                        transitionDuration: Duration(milliseconds: 200),
                        pageBuilder: (context, anim1, anim2) {
                          return Avaliacao();
                        },
                        transitionBuilder: (context, anim1, anim2, child) {
                          return SlideTransition(
                            position: Tween(begin: Offset(0, 1), end: Offset(0, 0))
                                .animate(anim1),
                            child: child,
                          );
                        },
                      );
                    },
                    icon: Icon(Icons.edit),
                    label: Text('Avaliar'))
                ],
              ),
              Container(
                height: 250,
                child: ListView(
                  physics: ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: [
                    AvaliacoesContainer(),
                    AvaliacoesContainer(),
                    AvaliacoesContainer(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }


  //Metodo que envia a mensagem
  Future enviarMensagem({String? texto})async{
    Map<String, dynamic> data = {
      "uid" : currentUser!.uid,
      "nome": currentUser!.displayName,
      "texto": texto,
      "Photourl": currentUser!.photoURL,
      "Time": FieldValue.serverTimestamp()
    };
    //return await FirebaseFirestore.instance.collection(widget.nome.toString()).add(data);
  }


  //Metodo que abre o mapa
  openMapsSheet(context) async {
    try {
      final coords = Coords(
        double.parse(widget.documentSnapshot['latitude'].toString()), 
        double.parse(widget.documentSnapshot['longitude'].toString()));
      final title = "Local";
      final availableMaps = await MapLauncher.installedMaps;

      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Container(
                child: Wrap(
                  children: <Widget>[
                    for (var map in availableMaps)
                      ListTile(
                       onTap: () => map.showMarker(
                         coords: coords,
                         title: title,
                        ),
                        title: Text(map.mapName),
                        leading: SvgPicture.asset(
                          map.icon,
                          height: 30.0,
                          width: 30.0,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      );
    } catch (e) {
      print(e);
    }
  }
  
  //Faz login com o Google
  Future<User?> _getUser() async {
    if (currentUser != null) return currentUser;

    try {
      final GoogleSignInAccount googleSignInAccount = (await googleSignIn
          .signIn())!;
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount
          .authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
        accessToken: googleSignInAuthentication.accessToken,
      );

      var authResult = await FirebaseAuth.instance
          .signInWithCredential(credential);

      final User user = authResult.user!;

      return user;
    } catch (error) {
      return null!;
    }
  }
}