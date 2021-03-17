import 'package:auto_size_text/auto_size_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:ilovemarajo/Views/InfoPage/Componentes/Comentarios.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';
class InfoPage extends StatefulWidget {
  String? nome;
  String? texto;
  String? perfil;
  String? latitude;
  String? longitude;
  InfoPage({this.nome,this.texto,this.perfil,this.latitude,this.longitude});
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
      // TODO: implement initState
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
      body: Form(
        key: validacao,
        child: SafeArea(
          child: ListView(
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 2 + 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(widget.perfil.toString()),
                      ),
                    ),
                  ),
                  Positioned(
                      top: 20,
                      right: 10,
                      left: 10,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.white,
                              child: IconButton(
                                icon: Icon(Icons.arrow_back),
                                onPressed: (){
                                  Navigator.of(context).pop();
                                },
                                color: Colors.black,
                              )),
                          CircleAvatar(
                              radius: 20,
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.favorite_rounded,
                                color: Colors.black,
                              )),
                        ],
                    )),
                    Positioned(
                        bottom: 10,
                        right: 15,
                        child: ElevatedButton(
                          onPressed: (){
                            openMapsSheet(context);
                          },
                          child: Center(
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Ir ao local",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20)
                                  ),
                                  WidgetSpan(
                                    child: Icon(
                                      Icons.location_on,
                                      size: 20,
                                      color: Colors.white,
                                      ),
                                  ),
                                ]
                              ))),
                    )),

                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    AutoSizeText(
                      widget.nome.toString(),
                      maxLines: 1,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    AutoSizeText(
                      widget.texto.toString(),
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    AutoSizeText(
                      "Comentários",
                      maxLines: 1,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: TextFormField(
                        controller: mensagem,
                        validator: (value){
                          if(value!.isEmpty){
                            return "Campo vazio!!";
                          }
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(40)),
                            ),
                            hintText: 'Comente algo sobre o lugar',
                            suffixIcon: IconButton(
                              icon: Icon(Icons.send),
                              onPressed: (){
                                //Valida se o usuario está logado ou não
                                if (currentUser == null) {
                                  _getUser();
                                
                                //Valida se o usuario escreveu algo ou não
                                } else if(validacao.currentState!.validate()){
                                  enviarMensagem(
                                    texto: mensagem.text
                                  );
                                  ScaffoldMessenger.of(context)
                                  .showSnackBar(
                                    SnackBar(
                                      content: Text('Mensagem enviada'),)
                                    );
                                  mensagem.clear();
                                }
                              },
                              color: Colors.black,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              

              StreamBuilder<QuerySnapshot>(
                stream: FirebaseFirestore.instance.collection(widget.nome.toString()).snapshots(),
                builder: (context, snapshot) {

                  List<DocumentSnapshot>? documentos = snapshot.data?.docs.reversed.toList();

                  if(snapshot.hasError){
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: Text('Erro inesperado :('),
                      ),
                    );
                  }else if(!snapshot.hasData){
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }else if(documentos!.isEmpty){
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Center(
                        child: Text(
                          "Sem comentarios :(",
                          style: TextStyle(
                            fontSize: 20
                          ),
                          ),
                      ),
                    );
                  }
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: documentos.length,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context,index){
                      return Comentarios(
                        nome: documentos[index]['nome'],
                        perfil: documentos[index]['Photourl'],
                        texto: documentos[index]['texto'],
                      );
                    },
                  );
                }
              )

            ],
          )),
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
    return await FirebaseFirestore.instance.collection(widget.nome.toString()).add(data);
  }


  //Metodo que abre o mapa
  openMapsSheet(context) async {
    try {
      final coords = Coords(double.parse(widget.latitude!), double.parse(widget.longitude!));
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