import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WelcomeTwo extends StatelessWidget {
  const WelcomeTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: Colors.grey[200],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Find your Love..",
            style: TextStyle(
                fontSize: 40, fontWeight: FontWeight.w600, color: Colors.grey),
          ),
          Container(
            color: Colors.grey[200],
            child: Center(
                child: Lottie.network(
                    "https://assets2.lottiefiles.com/packages/lf20_SLZG2B.json")),
          ),
          Container()
        ],
      ),
    ));
  }
}
