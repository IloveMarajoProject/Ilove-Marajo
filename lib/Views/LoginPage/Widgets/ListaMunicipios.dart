import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ilovemarajo/Views/HomePage/HomePage.dart';


class ListaMunicipios extends StatefulWidget {


  String nome;
  ListaMunicipios(this.nome);
  @override
  _ListaMunicipiosState createState() => _ListaMunicipiosState();
}

class _ListaMunicipiosState extends State<ListaMunicipios> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        child: Flexible(
          child: Center(
              child: AutoSizeText(
                  widget.nome,
                  style: GoogleFonts.roboto(
                      fontSize: 26.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.green
                  )
              )),
        ),
        onTap: (){
          Navigator.of(context)
            .push(MaterialPageRoute(builder: (context)=>HomePage()));
        },
      ),
    );
  }
}

