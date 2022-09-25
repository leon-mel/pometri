import 'package:flutter/material.dart';

import '../Classes/classSizeConfig.dart';
import '../UI/Options/Optionmenu.dart';
import '../widgets/menu_point.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double xOffset = 0;
  double yOffset = 0;
  String uname = "Leon";
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
          gradient: const LinearGradient(
              colors: [Color(0xffff4d6d), Color(0xffff8fa3)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
          //color: Colors.white,
          borderRadius: isDrawerOpen
              ? BorderRadius.circular(40)
              : BorderRadius.circular(0)),
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.stretch,
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
                          child: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                          onTap: () {
                            setState(() {
                              xOffset = 0;
                              yOffset = 0;
                              isDrawerOpen = false;
                            });
                          },
                        )
                      : GestureDetector(
                          child: const Icon(
                            Icons.menu,
                            color: Colors.white,
                          ),
                          onTap: () {
                            setState(() {
                              xOffset = SizeConfig.blockSizeHorizontal * 80;
                              yOffset = SizeConfig.blockSizeVertical * 15.1;
                              isDrawerOpen = true;
                            });
                          },
                        ),
                  const Text(
                      'Bochum', //shows the current location at a later point
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          decoration: TextDecoration.none)),
                  IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Optionmenu.route);
                      },
                      icon: Icon(
                        Icons.settings,
                        color: Colors.white,
                      )),
                ],
              )),
          SizedBox(
            height: SizeConfig.safeBlockHorizontal * 2,
          ),
          Container(
            padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 5),
            child: Align(
              alignment: Alignment.topLeft,
              child: CircleAvatar(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: const Image(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/leon_1.jpg'),
                  ),
                ),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.only(
                  top: SizeConfig.safeBlockVertical * 4,
                  left: SizeConfig.safeBlockHorizontal * 5,
                  bottom: SizeConfig.safeBlockHorizontal*5),
              child: Align(
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: TextSpan(
                      text: "Welcome ",
                      style: const TextStyle(
                          fontSize: 34, fontWeight: FontWeight.w500),
                      children: <TextSpan>[
                        const TextSpan(
                            text: "back \n",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xff590d22))),
                        TextSpan(text: uname)
                      ]),
                ),
              )
              // Column(
              //   mainAxisAlignment: MainAxisAlignment.spaceAround,
              //   children: const <Widget>[
              //     NewPadding(
              //       image1: 'assets/herz.jpg',
              //       text1: 'this will start the algorithm',
              //       text3: 'Date',
              //     ),
              //     NewPadding(
              //       image1: 'assets/pencil.png',
              //       text1: 'here you can change your criteries',
              //       text3: 'Criteries',
              //     ),
              //     NewPadding(
              //       image1: 'assets/chat.png',
              //       text1: 'here you can chat with your matches',
              //       text3: 'Chat',
              //     ),
              //   ],
              // )
              ),
          Divider(
            color: Colors.white,
            thickness: 1.5,
            indent: SizeConfig.safeBlockHorizontal * 5,
            endIndent: SizeConfig.safeBlockHorizontal *35,
          )
        ],
      ),
    );
  }
}
