import 'package:flutter/material.dart';
import 'package:speeddatingapp/UI/Login/loginMain.dart';
import 'package:speeddatingapp/Classes/classSizeConfig.dart';
import 'package:speeddatingapp/navigator/profileScreen.dart';
import 'Classes/classRoutes.dart';

void main() {
  runApp(const SpeedDatingApp());
}

class SpeedDatingApp extends StatelessWidget {
  const SpeedDatingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'Roboto'),
      home: Builder(
        builder: (BuildContext context) {
          SizeConfig().initState(context);
          return const ProfileScreen();
        },
      ),
      routes: getRoutes(),
    );
    //});
  }
}
