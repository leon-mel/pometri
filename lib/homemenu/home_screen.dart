import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';

import '../domain/entities/classSizeConfig.dart';
import '../UI/Options/Optionmenu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double xOffset = 0;
  double yOffset = 0;
  String uname = "Leon";
  String rname =
      "Anna"; //replaced with a username attribute from a username class at a later point
  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          constraints: BoxConstraints(minHeight: SizeConfig.screenHeight),
          //height: SizeConfig.screenHeight,
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
          child: SingleChildScrollView(
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
                                    xOffset =
                                        SizeConfig.blockSizeHorizontal * 80;
                                    yOffset =
                                        SizeConfig.blockSizeVertical * 15.1;
                                    isDrawerOpen = true;
                                  });
                                },
                              ),
                        const Text(
                            '', //shows the current location at a later point
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                decoration: TextDecoration.none)),
                        IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, Optionmenu.route);
                            },
                            icon: const Icon(
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
                buildGreetings(uname: uname),
                Divider(
                  color: Colors.white,
                  thickness: 1.5,
                  indent: SizeConfig.safeBlockHorizontal * 5,
                  endIndent: SizeConfig.safeBlockHorizontal * 35,
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 6,
                ),
                const buildCenter(),
                buildBottom(rname: rname),
                buildBottom(rname: rname),
                //   buildBottom(rname: rname),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class buildGreetings extends StatelessWidget {
  const buildGreetings({
    Key? key,
    required this.uname,
  }) : super(key: key);

  final String uname;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(
            top: SizeConfig.safeBlockVertical * 4,
            left: SizeConfig.safeBlockHorizontal * 5,
            bottom: SizeConfig.safeBlockHorizontal * 5),
        child: Align(
          alignment: Alignment.centerLeft,
          child: RichText(
            text: TextSpan(
                text: "Welcome ",
                style:
                    const TextStyle(fontSize: 34, fontWeight: FontWeight.w500),
                children: <TextSpan>[
                  const TextSpan(
                      text: "back \n",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff590d22))),
                  TextSpan(text: uname)
                ]),
          ),
        ));
  }
}

class buildCenter extends StatelessWidget {
  const buildCenter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          top: SizeConfig.safeBlockVertical * 4,
          left: SizeConfig.safeBlockHorizontal * 5,
          bottom: SizeConfig.safeBlockHorizontal * 5),
      child: Align(
        alignment: Alignment.centerLeft,
        child: RichText(
          text: const TextSpan(
              text: "A new ",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w300),
              children: <TextSpan>[
                TextSpan(
                    text: "match ", style: TextStyle(color: Color(0xff590d22))),
                TextSpan(text: "for ", style: TextStyle()),
                TextSpan(
                    text: "You?", style: TextStyle(fontWeight: FontWeight.w600))
              ]),
        ),
      ),
    );
  }
}

class buildBottom extends StatelessWidget {
  const buildBottom({
    Key? key,
    required this.rname,
  }) : super(key: key);

  final String rname;

  @override
  Widget build(BuildContext context) {
    return Bounce(
      duration: const Duration(milliseconds: 200),
      onPressed: () {},
      child: Padding(
        padding: EdgeInsets.only(
          top: SizeConfig.safeBlockVertical * 4,
          left: SizeConfig.safeBlockHorizontal * 5,
          bottom: SizeConfig.safeBlockHorizontal * 5,
        ),
        child: Align(
            alignment: Alignment.topLeft,
            child: Row(
              children: [
                const CircleAvatar(backgroundColor: Colors.black),
                Padding(
                  padding:
                      EdgeInsets.only(left: SizeConfig.safeBlockVertical * 2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [Text(rname), const Text("Likes Soccer and Gaming")],
                  ),
                ),
                const Column(
                  children: [], //accept or decline
                )
              ],
            )),
      ),
    );
  }
}
