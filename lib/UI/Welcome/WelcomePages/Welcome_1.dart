import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WelcomeOne extends StatelessWidget {
   WelcomeOne({Key? key}) : super(key: key);

final LottieBuilder MatchingAnimation =  Lottie.network("https://assets8.lottiefiles.com/packages/lf20_1t8na1gy.json");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.grey[200],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            "Welcome Buddy!",
            style: TextStyle(
                fontSize: 40, fontWeight: FontWeight.w600, color: Colors.grey),
          ),
          Container(
            color: Colors.grey[200],
            child: Center(
                child: MatchingAnimation),
          ),
          Container(),
          
          
        ],
      ),
    ));
  }
}
