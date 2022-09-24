import 'package:flutter/material.dart';

import '../Classes/classSizeConfig.dart';
import '../widgets/menu_point.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double xOffset = 0;
  double yOffset = 0;

  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      height: SizeConfig.screenHeight,
      width: SizeConfig.screenWidth,
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(isDrawerOpen ? 0.85 : 1.00)
        ..rotateZ(isDrawerOpen ? -50 : 0),
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: isDrawerOpen
              ? BorderRadius.circular(40)
              : BorderRadius.circular(0)),
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 50,
          ),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  isDrawerOpen
                      ? GestureDetector(
                          child: const Icon(Icons.arrow_back_ios),
                          onTap: () {
                            setState(() {
                              xOffset = 0;
                              yOffset = 0;
                              isDrawerOpen = false;
                            });
                          },
                        )
                      : GestureDetector(
                          child: const Icon(Icons.menu),
                          onTap: () {
                            setState(() {
                              xOffset = SizeConfig.blockSizeHorizontal * 80;
                              yOffset = SizeConfig.blockSizeVertical * 15.1;
                              isDrawerOpen = true;
                            });
                          },
                        ),
                  const Text('Pometri',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black87,
                          decoration: TextDecoration.none)),
                  Container(),
                ],
              )),
          const SizedBox(
            height: 40,
          ),
          SizedBox(
            height: SizeConfig.blockSizeVertical * 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const <Widget>[
                NewPadding(
                  image1: 'assets/herz.jpg',
                  text1: 'this will start the algorithm',
                  text3: 'Date',
                ),
                NewPadding(
                  image1: 'assets/pencil.png',
                  text1: 'here you can change your criteries',
                  text3: 'Criteries',
                ),
                NewPadding(
                  image1: 'assets/chat.png',
                  text1: 'here you can chat with your matches',
                  text3: 'Chat',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
