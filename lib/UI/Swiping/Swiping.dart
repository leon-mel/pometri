import 'package:flutter/material.dart';
import 'package:speeddatingapp/domain/entities/classSizeConfig.dart';
import 'package:speeddatingapp/homemenu/decision.dart';

class SwipingPage extends StatelessWidget {
  const SwipingPage({Key? key}) : super(key: key);
  static String route = "Swiping";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          IconButton(
              onPressed: () {
                Navigator.popAndPushNamed(context, DecisionPage.route);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              )),
          IconButton(
              onPressed: () {},
              icon: const Badge(
                child: Icon(
                  Icons.notifications,
                  color: Colors.black,
                ),
              ))
        ]),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: SizeConfig.screenHeight / 1.4,
          width: SizeConfig.screenWidth,
          child: Stack(children: [
            Container(
              decoration: BoxDecoration(
                  image:
                      DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/User_1.jpg")),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 4,
                          blurRadius: 4,
                          offset: Offset(3, 3)
                        )]),
            ),
            Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              gradient: LinearGradient(colors: [
                Color.fromARGB(200, 0, 0, 0).withOpacity(0.4),
                Color.fromARGB(0, 0, 0, 0)
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter )
            ),
          ),
          Column(
            children: [
              Text("Agnes, 22")
            ],
          )
            
          ]),
        ),
      ),
    );
  }
}
