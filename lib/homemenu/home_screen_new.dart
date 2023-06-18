import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bounce/flutter_bounce.dart';
import 'package:speeddatingapp/domain/entities/classSizeConfig.dart';

import 'cubit/bloc/home_bloc.dart';

class HomeScreenNew extends StatelessWidget {
  const HomeScreenNew({Key? key}) : super(key: key);

  static String route = "HomeScreenNew";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      bloc: BlocProvider.of<HomeBloc>(context)..add(HomeLoading()),
      builder: (context, state) {
        if (state is HomeLoadingState) {
          return const CircularProgressIndicator(
            color: Colors.red,
          );
        } else if (state is HomeLoadedState) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                const   CustomHeader(),
                  Padding(
                    padding:
                        const EdgeInsets.only(bottom: 18.0, left: 18, right: 18, top: 10),
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
                        const Column(
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
                        IconButton(
                          icon: const Badge(
                              isLabelVisible: false,
                              child: Icon(
                                Icons.notifications,
                                size: 35,
                              )),
                          onPressed: () {},
                        ),
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
                    child: Bounce(
                      duration: const Duration(milliseconds: 120),
                      onPressed: () {},
                      child: Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Container(
                            constraints: BoxConstraints(
                                maxHeight: SizeConfig.blockSizeVertical * 70,
                                maxWidth: SizeConfig.blockSizeVertical * 50,
                                minHeight: SizeConfig.blockSizeVertical * 40),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                            state.user[0].imageUrls[0],
                                          ))),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(35.0),
                            child: Container(
                                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              Colors.grey[700]!.withOpacity(0.8),
                                          blurRadius: 3)
                                    ]),
                                child: Text(
                                  "Looking for Adventures 😊",
                                  style: TextStyle(
                                      color: Colors.white.withOpacity(0.8)),
                                )),
                          ),
                          Positioned(
                            top: SizeConfig.safeBlockVertical * 58,
                            left: SizeConfig.safeBlockHorizontal * 5,
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.user[0].uName!,
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 20),
                                    ),
                                    Text(
                                      state.user[0].uLocation! + ", 40km 🌍",
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    ),
                                    Text(
                                      state.user[0].uInterest
                                          .toString()
                                          .replaceAll("[", "")
                                          .replaceAll("]", ""),
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 14),
                                    )
                                  ]),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return const Placeholder();
      },
    );
  }
}

class CustomHeader extends StatelessWidget {
  const CustomHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                blurRadius: 10, color: Colors.grey.withOpacity(0.3))
          ],
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15))),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Pometri",
              style: TextStyle(fontSize: 20),
            ),
            Text("❤️")
          ],
        ),
      ),
    );
  }
}
