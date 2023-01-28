import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:speeddatingapp/navigator/profileScreen.dart';

import '../widgets/menu_button.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: HexColor("FB6D6C"),
      child: Padding(
        padding: const EdgeInsets.only(top: 50, left: 40, bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(children: <Widget>[
              Bounce(
                onPressed: () {
                  Navigator.pushNamed(context, ProfileScreen.route);
                },
                duration: const Duration(milliseconds: 200),
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
              const SizedBox(
                width: 10,
              ),
              const Text(
                'Leon',
                style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
              )
            ]),
            // ignore: prefer_const_literals_to_create_immutables
            Column(children: <Widget>[
              const NewRow(
                icon_1: Icons.person_outline,
                text: 'Profile',
                route: 'ProfileScreen',
              ),
              const SizedBox(
                height: 20,
              ),
              const NewRow(
                icon_1: Icons.error_outline,
                text: 'Settings',
                route: 'OuD',
              ),
              const SizedBox(
                height: 20,
              ),
              const NewRow(
                icon_1: Icons.announcement_outlined,
                text: 'Support',
                route: '',
              ),
              const SizedBox(
                height: 20,
              ),
              const NewRow(
                icon_1: Icons.lightbulb_outline,
                text: 'Help',
                route: '',
              ),
              const SizedBox(
                height: 20,
              ),
            ]),
            Row(
              children: <Widget>[
                const NewRow(
                  icon_1: Icons.cancel,
                  text: 'Log out',
                  route: 'Login',
                ),
                const SizedBox(
                  width: 10,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
