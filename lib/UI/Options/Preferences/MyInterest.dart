import 'package:flutter/material.dart';

class MyInterest extends StatelessWidget {
  final String title;
  const MyInterest({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('tapped'); 
      },
      child: Container(
        width: double.maxFinite,
        height: 70,
        margin: const EdgeInsets.only(top:20,left: 40,right: 40, bottom: 20),
        decoration: BoxDecoration(
            color:Colors.lightBlue,
            borderRadius: BorderRadius.circular(20)
        ),
        child: Center(
          child: Text(
            title,
            style: const TextStyle(
                fontSize: 20,
                color:Colors.white
            ),
          ),
        ),
      )
    );
  }
}
