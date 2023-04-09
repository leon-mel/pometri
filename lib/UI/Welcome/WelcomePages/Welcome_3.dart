import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WelcomeThree extends StatelessWidget {
  const WelcomeThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.grey[200],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            ".. or just new Friends",
            style: TextStyle(
                fontSize: 40, fontWeight: FontWeight.w600, color: Colors.grey),
          ),
          Container(
            color: Colors.grey[200],
            child: Center(
                child: Lottie.network(
                    "https://assets1.lottiefiles.com/packages/lf20_2cghrrpi.json")),
          ),
          Container()
        ],
      ),
    ));
  }
}
