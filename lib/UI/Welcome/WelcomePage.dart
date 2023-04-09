import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:speeddatingapp/UI/Welcome/WelcomePages/Welcome_1.dart';
import 'package:speeddatingapp/UI/Welcome/WelcomePages/Welcome_2.dart';
import 'package:speeddatingapp/UI/Welcome/WelcomePages/Welcome_3.dart';
import 'package:speeddatingapp/UI/Welcome/WelcomePages/Welcome_4.dart';

class WelcomePage extends StatelessWidget {
  WelcomePage({Key? key}) : super(key: key);

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
          )
        ],
      ),
    );
  }
}
