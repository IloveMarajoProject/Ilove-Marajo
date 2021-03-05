import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class DraggleTela extends StatefulWidget {

 final ScrollController controller;

  DraggleTela(this.controller);
  @override
  _DraggleTelaState createState() => _DraggleTelaState();
}

class _DraggleTelaState extends State<DraggleTela> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        PhysicalModel(
          color: Colors.black,
          elevation: 8.0,
          borderRadius: BorderRadius.circular(52),
          child: Container(
            height: 60,
            width: 200,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(50)
            ),
            child: Flexible(
              child: Center(
                  child: AutoSizeText(
                    'Escolha o municipio',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white,fontSize: 34.0),)),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 70),
          child: ListView(
            controller: widget.controller,
            children: [
              listaMunicipios('Salvaterra'),
              listaMunicipios('Salvaterra'),
              listaMunicipios('Salvaterra'),
              listaMunicipios('Salvaterra'),
              listaMunicipios('Salvaterra'),
              listaMunicipios('Salvaterra'),
              listaMunicipios('Salvaterra'),
              listaMunicipios('Salvaterra'),
              listaMunicipios('Salvaterra'),
            ],
          ),
        )
      ],
    );
  }
}



Widget listaMunicipios(String nome){
  return Padding(
    padding: const EdgeInsets.only(bottom: 20),
    child: GestureDetector(
      child: Flexible(
        child: Center(
            child: AutoSizeText(
                nome,
                style: GoogleFonts.roboto(
                    fontSize: 26.0,
                    fontWeight: FontWeight.w700,
                    color: Colors.green
                )
            )),
      ),
      onTap: (){},
    ),
  );
}
