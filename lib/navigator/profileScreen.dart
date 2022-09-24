import 'package:flutter/material.dart';
import 'package:flutter_bounce/flutter_bounce.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static String route = "ProfileScreen";

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final double coverHeight = 280;
  final profileHeight = 144;

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          
          buildTop(),
          buildContent(),
        ],
      ),
    );
  }

  Widget buildTop() {
    final bottom = profileHeight / 2;
    final top = coverHeight - profileHeight / 2;
    return Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
        Container(
          margin: EdgeInsets.only(bottom: bottom),
          child: buildCover()),
        
        Positioned(
          top: top,
          child: buildProfileImage(),
        )]
        );
  }

  Widget buildCover() => Container(
        color: Colors.red,
        width: double.infinity,
        height: coverHeight,
        child: Padding(
          padding: const EdgeInsets.only(top: 40, left: 15),
          child: Align(
            alignment: Alignment.topLeft,
            child:  Bounce(
              onPressed: (){
                Navigator.of(context).pop();
              },
              duration: const Duration(milliseconds: 200),
              child: const Icon(Icons.arrow_back_ios_new_outlined, color: Colors.white,))
          ),
        ),
      );

  Widget buildProfileImage() => CircleAvatar(
    radius: profileHeight / 2,
    backgroundColor: Colors.grey.shade800,
    backgroundImage: const AssetImage("assets/leon_1.jpg"),
  );    

  
}

Widget buildContent() => Container(
  child: Column(
    children: 
      [Column(children: [
        const Text("Leon", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
        Text("searching for dates", style: TextStyle(fontSize: 14, color: Colors.grey[600]),)
      ],),const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildCriteriesIcon("assets/herz.jpg"),
            const SizedBox(width: 12,),
            buildCriteriesIcon("assets/women gender icon.jpg"),
            const SizedBox(width: 12,),
            // buildCriteriesIcon("assets/male-gender-icon.jpg"),
            // const SizedBox(width: 12,),
          ],
        ),
      const SizedBox(height: 50),
        
        Padding(
        padding: const EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const Text("Info", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
            const SizedBox(height: 16,),
            const Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Text("hey fellows. this is my pometri-profile! hope you enjoy it. this text is kind of a placeholder for presentation purpose.hey fellows. this is my pometri-profile! hope you enjoy it. this text is kind of a placeholder for presentation purpose.hey fellows. this is my pometri-profile! hope you enjoy it. this text is kind of a placeholder for presentation purpose.hey fellows. this is my pometri-profile! hope you enjoy it. this text is kind of a placeholder for presentation purpose. anyways, i hope you like it", style: const TextStyle(fontSize: 14, height: 1.4),),
            )
        ]),
      ),
    ],
  )
);
Widget buildCriteriesIcon(String image1) {

return CircleAvatar(
    backgroundColor: Colors.white,
    radius: 25,
    backgroundImage: AssetImage(image1),

  );
}
  
    
  
