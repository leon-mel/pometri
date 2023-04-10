import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:speeddatingapp/UI/Welcome/WelcomePages/Welcome_1.dart';
import 'package:speeddatingapp/UI/Welcome/WelcomePages/Welcome_2.dart';
import 'package:speeddatingapp/UI/Welcome/WelcomePages/Welcome_3.dart';
import 'package:speeddatingapp/UI/Welcome/WelcomePages/Welcome_4.dart';
import 'package:speeddatingapp/domain/entities/classRoutes.dart';
import 'package:speeddatingapp/homemenu/landingPage.dart';
import 'package:speeddatingapp/homemenu/navigation.dart';

import 'bloc/welcome_bloc.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({Key? key}) : super(key: key);
  static String route = "Welcome";
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WelcomeBloc, WelcomeState>(
      bloc: WelcomeBloc(),
      builder: (context, state) {
        return Scaffold(
          body: Stack(
            children: [
              PageView(
                physics: const ClampingScrollPhysics(),
                controller: _controller,
                children: const [
                  WelcomeOne(),
                  WelcomeTwo(),
                  WelcomeThree(),
                  WelcomeFour()
                ],
              ),
              Container(
                alignment: const Alignment(0, 0.75),
                child: SmoothPageIndicator(
                  controller: _controller,
                  count: 4,
                ),
              ),
              Container(
                alignment: Alignment(0, 0.90),
                child: CupertinoButton(
                  color: Colors.grey[700],
                  child: Text("Get me in !"),
                  onPressed: () => Navigator.popAndPushNamed(
                      context, NavigationScreen.route),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
