import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speeddatingapp/domain/entities/classSizeConfig.dart';
import 'package:speeddatingapp/domain/entities/classUser.dart';
import 'package:speeddatingapp/domain/usecases/user_usecases.dart';
import 'package:speeddatingapp/homemenu/decision.dart';

import 'bloc/swiping_bloc.dart';

class SwipingPage extends StatelessWidget {
  const SwipingPage({Key? key}) : super(key: key);
  static String route = "Swiping";

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SwipingBloc, SwipingState>(
      bloc: BlocProvider.of<SwipingBloc>(context)
        ..add(SwipingLoadingEvent())
        ,
      builder: (context, state) {
        if (state is SwipingLoadingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is SwipingLoadedState) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.popAndPushNamed(
                              context, DecisionPage.route);
                        },
                        icon: const Icon(
                          Icons.arrow_back_ios,
                          color: Colors.black,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Badge(
                          child: Icon(
                            Icons.notifications,
                            color: Colors.black,
                          ),
                        ))
                  ]),
            ),
            body: Column(
              children: [
                Draggable(
                    feedback: UserCard(
                      uAge: state.users[0].uAge,
                      uImage: state.users[0].imageUrls,
                      uInterest: state.users[0].uInterest[0],
                      uLocation: state.users[0].uLocation,
                      uName: state.users[0].uName,
                    ),
                    childWhenDragging: UserCard(
                      uAge: state.users[1].uAge,
                      uImage: state.users[1].imageUrls,
                      uInterest: state.users[1].uInterest[1],
                      uLocation: state.users[1].uLocation,
                      uName: state.users[1].uName,
                    ),
                    onDragEnd: (drag) {
                      if (drag.velocity.pixelsPerSecond.dx < 0) {
                        context.read<SwipingBloc>()
                          ..add(SwipeLeft(user: state.users[0]));
                        print("Swiped Left");
                      } else {
                        context.read<SwipingBloc>()
                          ..add(SwipeRight(user: state.users[0]));
                        print("Swiped Right");
                      }
                    },
                    child: UserCard(
                      uAge: state.users[0].uAge,
                      uImage: state.users[0].imageUrls,
                      uInterest: state.users[0].uInterest[0],
                      uLocation: state.users[0].uLocation,
                      uName: state.users[0].uName,
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(),
                    ChoiceButton(
                      icon: Icons.clear_rounded,
                    ),
                    ChoiceButton(
                      icon: CupertinoIcons.heart_fill,
                    ),
                    ChoiceButton(
                      icon: Icons.star,
                    ),
                    Container(),
                  ],
                )
              ],
            ),
          );
        } else {
          return Placeholder();
        }
      },
    );
  }
}

class ChoiceButton extends StatelessWidget {
  final IconData icon;
  const ChoiceButton({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withAlpha(50),
              spreadRadius: 4,
              blurRadius: 4,
              offset: Offset(3, 3),
            )
          ]),
      child: Icon(
        icon,
        color: Colors.red,
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  final uImage;
  final uName;
  final uAge;
  final uInterest;
  final uLocation;
  const UserCard({
    Key? key,
    required this.uImage,
    required this.uName,
    required this.uInterest,
    required this.uLocation,
    required this.uAge,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: SizeConfig.screenHeight / 1.4,
        width: SizeConfig.screenWidth,
        child: Stack(children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover, image: AssetImage(uImage[0])),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 4,
                      blurRadius: 4,
                      offset: Offset(3, 3))
                ]),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                gradient: LinearGradient(colors: [
                  Color.fromARGB(200, 0, 0, 0).withOpacity(0.4),
                  Color.fromARGB(0, 0, 0, 0)
                ], begin: Alignment.bottomCenter, end: Alignment.topCenter)),
          ),
          Positioned(
            bottom: 30,
            left: 20,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                "$uName" + "$uAge",
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
              Text(
                "$uInterest" + "$uLocation",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              Row(
                children: [
                  UserImageSmall(),
                  UserImageSmall(),
                  UserImageSmall(),
                  UserImageSmall()
                ],
              )
            ]),
          )
        ]),
      ),
    );
  }
}

class UserImageSmall extends StatelessWidget {
  const UserImageSmall({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8, right: 8),
      height: 60,
      width: 60,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/User_1.jpg"), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(5)),
    );
  }
}
