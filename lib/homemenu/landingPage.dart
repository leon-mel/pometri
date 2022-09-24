import 'package:flutter/material.dart';

import 'drawer_screen.dart';
import 'home_screen.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);
  static String route = "LandingPage";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: const [
        DrawerScreen(),
        HomeScreen(),
      ]),
    );
  }
}
