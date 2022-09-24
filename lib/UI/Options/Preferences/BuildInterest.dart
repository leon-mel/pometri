import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BuildInterest extends StatelessWidget{
  final String title;
  final IconData icon;
  final Function onTapmethod;
  final bool value;
  const BuildInterest({Key? key, required this.title, required this.value, required this.icon, required this.onTapmethod}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color farbe;
    if (value==true)  {
      farbe = Colors.green;
    } else  {
      farbe = Colors.grey;
    }

    return GestureDetector(
      onTap: () {
        onTapmethod(!value);
        if (value==true)  {
          farbe = Colors.green;
        } else  {
          farbe = Colors.grey;
        }
      },
      child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(title,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: farbe)
              ),
              Icon(icon, color: farbe),
            ],
          ),
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: farbe),
        ),
        )
    );
  }
}