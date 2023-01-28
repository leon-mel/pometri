import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:speeddatingapp/Classes/classSizeConfig.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static String route = "ProfileScreen";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.screenHeight,
      width: SizeConfig.screenWidth,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
              alignment: Alignment.bottomCenter,
              clipBehavior: Clip.none,
              children: [
                SizedBox(
                  height: SizeConfig.screenHeight / 2,
                  width: SizeConfig.screenWidth,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25)),
                    child: Image.asset(
                      'assets/user.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: SizeConfig.safeBlockVertical * 45,
                  child: SizedBox(
                    width: SizeConfig.screenWidth,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const DecisionButton(
                          color: Colors.white,
                          icon: Icons.close,
                          iconColor: Colors.black,
                        ),
                        DecisionButton(
                          color: Colors.red[800],
                          icon: CupertinoIcons.heart_solid,
                          iconColor: Colors.white,
                        ),
                        const DecisionButton(
                            color: Colors.white,
                            icon: Icons.star,
                            iconColor: Colors.black)
                      ],
                    ),
                  ),
                )
              ]),
          Padding(
            padding: EdgeInsets.only(
                left: SizeConfig.blockSizeHorizontal * 5,
                top: SizeConfig.blockSizeHorizontal * 10),
            child: Row(
              children: [
                Text(
                  "Agnes, ",
                  style:
                      TextStyle(fontSize: 26, decoration: TextDecoration.none),
                ),
                Text(
                  "27",
                  style:
                      TextStyle(fontSize: 26, decoration: TextDecoration.none),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DecisionButton extends StatelessWidget {
  final Color? color;
  final Color iconColor;
  final IconData icon;
  const DecisionButton({
    Key? key,
    required this.color,
    required this.icon,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 5,
                spreadRadius: 4,
                offset: const Offset(0, 4))
          ]),
      child: Icon(icon, size: 45, color: iconColor),
    );
  }
}
