import 'package:flutter/material.dart';
import 'package:speeddatingapp/UI/Login/loginMain.dart';
import 'package:speeddatingapp/domain/entities/classSizeConfig.dart';
import 'package:speeddatingapp/navigator/bloc/profile_screen_bloc.dart';
import 'package:speeddatingapp/navigator/profileScreen.dart';
import 'domain/entities/classRoutes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
          return MultiBlocProvider(providers: [
            BlocProvider<ProfileScreenBloc>(
              create: (BuildContext context) => ProfileScreenBloc(),
            )
          ], child: const ProfileScreen());
        },
      ),
      routes: getRoutes(),
    );
    //});
  }
}
