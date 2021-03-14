import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class InfoPage extends StatefulWidget {
  String imageURL;
  InfoPage(this.imageURL);
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                      image: NetworkImage(widget.imageURL),
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
                              Icons.notifications,
                              color: Colors.black,
                            )),
                      ],
                  )),
                  Positioned(
                      bottom: 0,
                      right: 10,
                      child: Container(
                        height: 40,
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.circular(32)
                        ),
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
                    "Praia Grande",
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
                    "Texto",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            )
          ],
        )),
    );
  }
}