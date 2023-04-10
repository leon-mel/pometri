import 'package:flutter/cupertino.dart';
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
            alignment: const Alignment(0, 0.90),
            child: CupertinoButton(
              color: Colors.grey[500],
              child: Text("Get me in !"),
              onPressed: () => null,
            ),
          )
        ],
      ),
    );
  }
}
