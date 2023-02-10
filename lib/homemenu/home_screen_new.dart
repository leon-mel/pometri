import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speeddatingapp/domain/entities/classSizeConfig.dart';

import 'cubit/bloc/home_bloc.dart';

class HomeScreenNew extends StatelessWidget {
  const HomeScreenNew({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 3,
                                color: Colors.grey,
                                offset: Offset(0, 2),
                                spreadRadius: 3)
                          ]),
                      child: const CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage("assets/user.png")),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome back 👋",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey),
                        ),
                        Text(
                          "Maggy",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey),
                        )
                      ],
                    ),
                    SizedBox(
                      width: SizeConfig.safeBlockHorizontal * 20,
                    ),
                    Stack(
                      children: [
                        const Icon(
                          Icons.notifications,
                          size: 35,
                        ),
                        Positioned(
                          left: SizeConfig.blockSizeHorizontal * 5,
                          top: SizeConfig.safeBlockVertical * 3,
                          child: Container(
                            height: 10,
                            width: 10,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle, color: Colors.red),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const Text(
                "A new match for you, Maggy?",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Image.asset(
                        "assets/user_2.png",
                        height: SizeConfig.blockSizeVertical * 55,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(35.0),
                      child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 20.0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.grey[700]!.withOpacity(0.8),
                                    blurRadius: 3)
                              ]),
                          child: Text(
                            "Looking for Adventures",
                            style:
                                TextStyle(color: Colors.white.withOpacity(0.8)),
                          )),
                    ),
                    Positioned(
                      top: SizeConfig.safeBlockVertical * 45,
                      left: SizeConfig.safeBlockHorizontal * 6,
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Matthew",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 20),
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Bochum, 40km",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                  Icon(
                                    Icons.location_on,
                                    color: Colors.white,
                                  )
                                ],
                              )
                            ]),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
