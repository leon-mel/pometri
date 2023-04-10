import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:speeddatingapp/UI/Welcome/WelcomePages/Welcome_1.dart';
import 'package:speeddatingapp/UI/Welcome/WelcomePages/Welcome_2.dart';
import 'package:speeddatingapp/UI/Welcome/WelcomePages/Welcome_3.dart';
import 'package:speeddatingapp/UI/Welcome/WelcomePages/Welcome_4.dart';
import 'package:speeddatingapp/domain/entities/classRoutes.dart';
import 'package:speeddatingapp/homemenu/navigation.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({Key? key}) : super(key: key);
  static String route = "Welcome";
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: [
              WelcomeOne(),
              WelcomeTwo(),
              WelcomeThree(),
              WelcomeFour()
            ],
          ),
          Container(
            alignment: Alignment(0, 0.75),
            child: SmoothPageIndicator(
              controller: _controller,
              count: 4,
            ),
          ),
          Container(
            alignment: Alignment(0, 0.90),
            child: MaterialButton(
              color: Colors.black38,
              onPressed: () => Navigator.popAndPushNamed(context, NavigationScreen.route) ,
              child: Text(
                "Get me in",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[200]),
              ),
            ),
          )
        ],
      ),
    );
  }
}
