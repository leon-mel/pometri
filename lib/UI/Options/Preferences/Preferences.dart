import 'package:flutter/material.dart';
import 'BuildInterest.dart';

class Preferences extends StatefulWidget {
  const Preferences({Key? key}) : super(key: key);
  static String route = "Preferences";

  @override
  State<Preferences> createState() => _PreferencesState();
}

class _PreferencesState extends State<Preferences> {
  bool valBouldern = false;
  bool valSoccer = false;
  bool valMaterialArts = false;
  bool valInstruments = false;
  bool valSing = false;
  bool valWriting = false;
  bool valPainting = false;
  bool valAllFood = true;
  bool valVegetarian = false;
  bool valVegan = false;
  bool valHalal = false;

  changeAllFood(bool newValue) {
    setState(() {
      valAllFood = newValue;
    });
  }
  changeVegetarian(bool newValue) {
    setState(() {
      valVegetarian = newValue;
    });
  }  changeVegan(bool newValue) {
    setState(() {
      valVegan = newValue;
    });
  }  changeHalal(bool newValue) {
    setState(() {
      valHalal = newValue;
    });
  }
  changeBouldern(bool newValue) {
    setState(() {
      valBouldern = newValue;
    });
  }

  changeSoccer(bool newValue) {
    setState(() {
      valSoccer = newValue;
    });
  }

  changeMaterialArts(bool newValue) {
    setState(() {
      valMaterialArts = newValue;
    });
  }

  changeInstruments(bool newValue) {
    setState(() {
      valInstruments = newValue;
    });
  }

  changeSing(bool newValue) {
    setState(() {
      valSing = newValue;
    });
  }

  changePainting(bool newValue) {
    setState(() {
      valPainting = newValue;
    });
  }

  changeWriting(bool newValue) {
    setState(() {
      valWriting = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Preferences',
              style: TextStyle(
                  fontSize: 24,
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.bold)),
        ),
        body: Container(
            padding: const EdgeInsets.all(18),
            child: ListView(children: [
              SizedBox(height: 5),
              Row(
                children: [
                  Icon(
                    Icons.interests,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 5),
                  Text('Interests',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold)),
                ],
              ),
              Divider(height: 20, thickness: 1),
              SizedBox(height: 3),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  BuildInterest(title: ' Bouldern', value: valBouldern, icon: Icons.sports_handball, onTapmethod: changeBouldern),
                  SizedBox(width: 20, height: 10,),
                  BuildInterest(title:' Soccer', value: valSoccer, icon: Icons.sports_soccer_sharp, onTapmethod: changeSoccer),
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  BuildInterest(title:' Material Arts', value: valMaterialArts,  icon: Icons.sports_kabaddi, onTapmethod: changeMaterialArts),
                  SizedBox(width: 20, height: 10,),
                ],
              ),
              SizedBox(height: 25),
              Row(
                children: [
                  Icon(Icons.fastfood_sharp, color: Colors.blue),
                  SizedBox(width: 5),
                  Text('Diet',
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
                ],
              ),
              Divider(height: 20, thickness: 1),
              SizedBox(height: 3),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  BuildInterest(title:' AllFood', value: valAllFood, icon: Icons.fastfood, onTapmethod: changeAllFood),
                  SizedBox(width: 20, height: 10,),
                  BuildInterest(title:' Vegetarian', value: valVegetarian, icon: Icons.apple,onTapmethod: changeVegetarian),
                ],
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  BuildInterest(title:' Vegan', value: valVegan, icon: Icons.apple, onTapmethod: changeVegan),
                  SizedBox(width: 20, height: 10,),
                  BuildInterest(title:' Halal', value: valHalal, icon: Icons.apple, onTapmethod: changeHalal),
                ],
              ),
              SizedBox(height: 25),
              Row(
                children: [
                  Icon(
                    Icons.movie_creation_outlined,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 5),
                  Text('Creativity',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold)),
                ],
              ),
              Divider(height: 20, thickness: 1),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  BuildInterest(title:' Instruments', value: valInstruments, icon: Icons.queue_music, onTapmethod: changeInstruments),
                  SizedBox(width: 20, height: 10,),
                  BuildInterest(title:' Singing', value: valSing, icon: Icons.mic_rounded, onTapmethod: changeSing),
                  ],
               ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  BuildInterest(title:' Writing', value: valWriting, icon: Icons.brush_outlined, onTapmethod: changeWriting),
                  SizedBox(width: 20, height: 10,),
                  BuildInterest(title:' Painting', value: valPainting, icon: Icons.palette_outlined, onTapmethod: changePainting),
                ],
              ),
            ]
          )
        )
    );
  }
}
