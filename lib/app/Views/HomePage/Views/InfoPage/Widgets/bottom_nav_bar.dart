import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ilovemarajo/app/Views/HomePage/Models/praia.dart';
import 'package:ilovemarajo/app/Views/HomePage/Views/InfoPage/Controller/info_controller.dart';
import 'package:map_launcher/map_launcher.dart';

class BottomNavBarWidget extends StatelessWidget {
  final PraiaModel praiaModel;

  BottomNavBarWidget({required this.praiaModel});
  InfoController controller = InfoController();
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Center(
                child: Observer(
                  builder: (_) {
                    return IconButton(
                      color: controller.isButtonFavorite? 
                        Colors.yellow
                        :
                        Colors.white
                      ,
                      icon: controller.isButtonFavorite?
                        Icon(Icons.star)
                        :
                        Icon(Icons.star_border)
                      ,
                      iconSize: 35,
                      onPressed: (){
                        controller.isButtonFavorite?
                          controller.removeBotao()
                          :
                          controller.enableBotao();
                      }
                    );
                  }
                )
              ),
            ),


            SizedBox(width: 20),

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
            )
          ],
        ),
      );
  }
  //Metodo que abre o mapa
  openMapsSheet(context) async {
    try {
      final coords = Coords(
        double.parse(praiaModel.lat.toString()), 
        double.parse(praiaModel.long.toString()));
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