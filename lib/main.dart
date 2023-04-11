import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:speeddatingapp/UI/Login/loginContainerBody.dart';
import 'package:speeddatingapp/UI/Login/loginMain.dart';
import 'package:speeddatingapp/UI/Welcome/WelcomePage.dart';
import 'package:speeddatingapp/UI/Welcome/bloc/welcome_bloc.dart';
import 'package:speeddatingapp/domain/entities/classSizeConfig.dart';
import 'package:speeddatingapp/homemenu/cubit/bloc/home_bloc.dart';
import 'package:speeddatingapp/homemenu/cubit/bottom_navigation_cubit.dart';
import 'package:speeddatingapp/homemenu/decision.dart';
import 'package:speeddatingapp/homemenu/navigation.dart';
import 'package:speeddatingapp/injection.dart' as di;
import 'package:speeddatingapp/navigator/bloc/profile_screen_bloc.dart';
import 'package:speeddatingapp/navigator/profileScreen.dart';
import 'domain/entities/classRoutes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();
  runApp(const SpeedDatingApp());
}

class SpeedDatingApp extends StatelessWidget {
  const SpeedDatingApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ProfileScreenBloc>(
            create: (BuildContext context) => ProfileScreenBloc(),
          ),
          BlocProvider<BottomNavigationCubit>(
              create: (BuildContext context) => BottomNavigationCubit()),
          BlocProvider<HomeBloc>(
            create: (BuildContext context) => HomeBloc(),
          ),
          BlocProvider<WelcomeBloc>(
              create: (BuildContext context) => WelcomeBloc())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(fontFamily: 'Roboto'),
          home: Builder(
            builder: (BuildContext context) {
              SizeConfig().initState(context);
              return const Login();
            },
          ),
          routes: getRoutes(),
        ));
  }
}
