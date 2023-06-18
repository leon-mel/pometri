import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:lottie/lottie.dart';
import 'package:speeddatingapp/UI/Swiping/Swiping.dart';
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
            icon: const Icon(Icons.arrow_back_ios),
          ),
          
        ]),
      ),
      body: Center(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          const Text(
            "What do you want to do?",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          ),
          Bounce(
            onPressed: () {},
            duration: const Duration(milliseconds: 120),
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
                  const Padding(
                    padding: EdgeInsets.all(15.0),
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
            duration: const Duration(milliseconds: 120),
            onPressed: () => Navigator.popAndPushNamed(context, SwipingPage.route),
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
                  const Padding(
                    padding: EdgeInsets.all(15.0),
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
