import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:speeddatingapp/UI/Login/loginMain.dart';
import 'package:speeddatingapp/UI/Swiping/bloc/swiping_bloc.dart';
import 'package:speeddatingapp/UI/Welcome/bloc/welcome_bloc.dart';
import 'package:speeddatingapp/domain/entities/classSizeConfig.dart';
import 'package:speeddatingapp/homemenu/cubit/bloc/home_bloc.dart';
import 'package:speeddatingapp/homemenu/cubit/bottom_navigation_cubit.dart';
import 'package:speeddatingapp/navigator/bloc/profile_screen_bloc.dart';
import 'domain/entities/classRoutes.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:speeddatingapp/backend/database.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyDlHfiW-hAJCaxyWpuZ6k2tNcbN1mZMNxE',
      projectId: 'fom-sda',
      appId: '1:113388558408:android:5cc9960e62c3b93a70e07d',
      messagingSenderId: '113388558408',
    ),
  );

  CheckDatabaseConnection().checkFirestoreConnection();
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
              create: (BuildContext context) => WelcomeBloc()),
          BlocProvider<SwipingBloc>(
              create: (BuildContext context) => SwipingBloc()
              // ..add(LoadUserEvent(users: UserUsecases().users))
              )
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
