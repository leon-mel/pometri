import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const Text(
            "Pometri",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: const Column(
          children: [
            Row(
              children: [],
            )
          ],
        ));
  }
}
