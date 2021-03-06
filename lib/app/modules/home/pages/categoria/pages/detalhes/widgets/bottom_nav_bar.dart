import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ilovemarajo/app/modules/home/models/praiaModel.dart';
import 'package:ilovemarajo/app/modules/home/pages/categoria/pages/detalhes/page/avaliar/avaliar_page.dart';
import 'package:map_launcher/map_launcher.dart';

class BottomNavBarWidget extends StatelessWidget {
  final PraiaModel praiaModel;
  BottomNavBarWidget({
    required this.praiaModel
  });
 

  double get latitude {
    return double.parse(praiaModel.lat.toString());
  }

  double get longitude {
    return double.parse(praiaModel.lon.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [

            Expanded(
              child: InkWell(
                onTap: (){
                  openMapsSheet(context);
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child: Text(
                      'Ir ao local',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white
                      ),
                    )
                  ),
                ),
              )
            ),
            SizedBox(width: 20),
            Expanded(
              child: InkWell(
                onTap: (){
                  showCupertinoDialog(
                    context: context,
                    builder: (_){
                      return AvaliarPage();
                    }
                  );
                },
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Center(
                    child: Text(
                      'Avaliar',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white
                      ),
                    )
                  ),
                ),
              )
            ),
          ],
        ),
      );
  }

  openMapsSheet(context) async {
    try {
      final coords = Coords(
        latitude, 
        longitude);
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
}