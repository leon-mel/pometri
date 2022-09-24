import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import '../Classes/classSizeConfig.dart';


class NewPadding extends StatelessWidget {
  final String image1;
  final String text1;
  final String text3;

  const NewPadding({
    Key? key,
    required this.image1,
    required this.text1,
    required this.text3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Bounce(
              onPressed: () {},
              duration: const Duration(milliseconds: 200),
              child: Container(
                width: SizeConfig.blockSizeVertical * 18,
                height: SizeConfig.blockSizeVertical * 18,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 0),
                      )
                    ]),
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Image(
                      fit: BoxFit.cover,
                      height: 100,
                      width: 100,
                      image: AssetImage(image1),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Column(
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      text3,
                      style: TextStyle(
                          fontSize: SizeConfig.blockSizeVertical * 3.3,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Text(
                    text1,
                    style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                        decoration: TextDecoration.none),
                  )
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}
