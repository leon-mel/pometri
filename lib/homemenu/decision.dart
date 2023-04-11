import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:lottie/lottie.dart';
import 'package:speeddatingapp/domain/entities/classSizeConfig.dart';
import 'package:speeddatingapp/homemenu/navigation.dart';

class DecisionPage extends StatelessWidget {
  const DecisionPage({Key? key}) : super(key: key);

  static String route = "Decision";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(children: [
          IconButton(
            onPressed: () {
              Navigator.popAndPushNamed(context, NavigationScreen.route);
            },
            color: Colors.black,
            icon: Icon(Icons.arrow_back_ios),
          )
        ]),
      ),
      body: Center(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          Text(
            "What do you want to do?",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          ),
          Bounce(
            onPressed: () => null,
            duration: Duration(milliseconds: 120),
            child: Container(
              height: SizeConfig.blockSizeVertical * 25,
              width: SizeConfig.blockSizeVertical * 40,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 5),
                        blurRadius: 5,
                        color: Colors.black.withOpacity(0.5))
                  ]),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "Match Making",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Center(
                    child: Lottie.network(
                        "https://assets3.lottiefiles.com/packages/lf20_wJStSx.json"),
                  ),
                ],
              ),
            ),
          ),
          Bounce(
            duration: Duration(milliseconds: 120),
            onPressed: () => null,
            child: Container(
              height: SizeConfig.blockSizeVertical * 25,
              width: SizeConfig.blockSizeVertical * 40,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        offset: const Offset(0, 5),
                        blurRadius: 5,
                        color: Colors.black.withOpacity(0.5))
                  ]),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "Swiping",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                  ),
                  Center(
                    child: Lottie.network(
                        "https://assets8.lottiefiles.com/packages/lf20_irLRS7.json"),
                  ),
                ],
              ),
            ),
          ),
          Container()
        ]),
      ),
    );
  }
}
