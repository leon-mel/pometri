import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:speeddatingapp/domain/entities/classSizeConfig.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:speeddatingapp/navigator/bloc/profile_screen_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static String route = "ProfileScreen";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileScreenBloc, ProfileScreenState>(
      bloc: BlocProvider.of<ProfileScreenBloc>(context)
        ..add(ProfileScreenLoadingEvent()),
      builder: (context, state) {
        if (state is ProfileScreenLoading) {
          return const SizedBox(
            height: 20,
            width: 20,
            child: CircularProgressIndicator(
              color: Colors.red,
            ),
          );
        } else if (state is ProfileScreenLoaded) {
          return ProfileShowCase(
            userAboutMe: state.user[0].uAboutMe,
            userAge: state.user[0].uAge,
            userLocation: state.user[0].uLocation,
            userName: state.user[0].uName,
            userInterest: state.user[0].uInterest,
          );
        } else if (state is ProfileScreenError) {
          return ErrorMessage(message: state.message);
        }
        return Container(
          color: Colors.amber,
        );
      },
    );
  }
}

class ErrorMessage extends StatelessWidget {
  final String message;
  const ErrorMessage({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.warning,
          size: 50,
          color: Colors.white,
        ),
        Text(
          message,
          style: const TextStyle(decoration: TextDecoration.none, fontSize: 22),
        )
      ],
    );
  }
}

class ProfileShowCase extends StatelessWidget {
  final userName;
  final userAge;
  final userLocation;
  final userAboutMe;
  final List<String>? userInterest;
  const ProfileShowCase({
    Key? key,
    required this.userName,
    required this.userAge,
    required this.userLocation,
    required this.userAboutMe,
    required this.userInterest,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          height: SizeConfig.screenHeight,
          width: SizeConfig.screenWidth,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                  alignment: Alignment.bottomCenter,
                  clipBehavior: Clip.none,
                  children: [
                    SizedBox(
                      height: SizeConfig.screenHeight / 2,
                      width: SizeConfig.screenWidth,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(25),
                            bottomRight: Radius.circular(25)),
                        child: Image.asset(
                          'assets/user.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ]),
              Padding(
                padding: EdgeInsets.only(
                    left: SizeConfig.blockSizeHorizontal * 5,
                    top: SizeConfig.blockSizeHorizontal * 10),
                child: Row(
                  children: [
                    Text(
                      userName + ", ",
                      style: TextStyle(
                          fontSize: 26,
                          decoration: TextDecoration.none,
                          color: Colors.grey[500]),
                    ),
                    Text(
                      userAge.toString(),
                      style: TextStyle(
                          fontSize: 26,
                          decoration: TextDecoration.none,
                          color: Colors.grey[500]),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: SizeConfig.blockSizeHorizontal * 5,
                    top: SizeConfig.blockSizeHorizontal * 2),
                child: Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.grey[500]?.withOpacity(0.5),
                      size: 16,
                    ),
                    Text(
                      userLocation + ", ",
                      style: TextStyle(
                          fontSize: 14,
                          decoration: TextDecoration.none,
                          color: Colors.grey[500]?.withOpacity(0.5)),
                    ),
                    Text("47 km",
                        style: TextStyle(
                            fontSize: 14,
                            decoration: TextDecoration.none,
                            color: Colors.grey[500]?.withOpacity(0.5)))
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: SizeConfig.blockSizeHorizontal * 5,
                    top: SizeConfig.blockSizeHorizontal * 10),
                child: Text(
                  "About me",
                  style: TextStyle(
                      fontSize: 22,
                      decoration: TextDecoration.none,
                      color: Colors.grey[500]),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: SizeConfig.blockSizeHorizontal * 5,
                    top: SizeConfig.blockSizeHorizontal * 2),
                child: Text(
                  userAboutMe,
                  style: TextStyle(
                      fontSize: 14,
                      decoration: TextDecoration.none,
                      color: Colors.grey[500]?.withOpacity(0.5)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    left: SizeConfig.blockSizeHorizontal * 5,
                    top: SizeConfig.blockSizeHorizontal * 10),
                child: Text(
                  "Interests",
                  style: TextStyle(
                      fontSize: 22,
                      decoration: TextDecoration.none,
                      color: Colors.grey[500]),
                ),
              ),
              Wrap(children: [
                for (var i in userInterest!)
                  Padding(
                    padding: EdgeInsets.only(
                        left: SizeConfig.blockSizeHorizontal * 5,
                        top: SizeConfig.blockSizeHorizontal * 3),
                    child: Container(
                      decoration: BoxDecoration(
                          border:
                              Border.all(color: Colors.grey.withOpacity(0.5)),
                          borderRadius: BorderRadius.circular(15)),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Text(
                          i,
                          style: TextStyle(
                              fontSize: 14,
                              decoration: TextDecoration.none,
                              color: Colors.grey[500]?.withOpacity(0.8),
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
              ])
            ],
          ),
        ),
      ),
    );
  }
}

class DecisionButton extends StatelessWidget {
  final Color? color;
  final Color iconColor;
  final IconData icon;
  const DecisionButton({
    Key? key,
    required this.color,
    required this.icon,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 80,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 5,
                spreadRadius: 4,
                offset: const Offset(0, 4))
          ]),
      child: Icon(icon, size: 45, color: iconColor),
    );
  }
}
