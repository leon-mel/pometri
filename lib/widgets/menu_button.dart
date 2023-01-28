import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import '../UI/Options/Optionmenu.dart';
import '../UI/Login/loginMain.dart';
import '../navigator/profileScreen.dart';


class NewRow extends StatelessWidget {
  final IconData icon_1;
  final String text;
  final String route;

  const NewRow({
    Key? key,
    required this.icon_1,
    required this.text,
    required this.route,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Bounce(
      onPressed: (){
        if(route=="ProfileScreen"){
          Navigator.pushNamed(context, ProfileScreen.route);
        }
        if(route=="Login"){
          Navigator.popAndPushNamed(context, Login.route);
        }
        if(route=="OuD"){
          Navigator.pushNamed(context, Optionmenu.route);
        }
      },
      duration: const Duration(milliseconds: 200),
      child: Row(children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 8.0, bottom: 5),
          child: Icon(
            icon_1,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ]),
    );
  }
}

