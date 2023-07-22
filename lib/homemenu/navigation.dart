import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:speeddatingapp/UI/Chat/ChatScreen.dart';
import 'package:speeddatingapp/UI/Options/SettingsPageUI.dart';
import 'package:speeddatingapp/homemenu/cubit/bottom_navigation_cubit.dart';
import 'package:speeddatingapp/homemenu/decision.dart';
import 'package:speeddatingapp/homemenu/home_screen_new.dart';
import 'package:speeddatingapp/homemenu/navbar_items.dart';
import 'package:speeddatingapp/navigator/profileScreen.dart';


class NavigationScreen extends StatelessWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  static String route = "Navigator";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar:
          BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
        builder: (context, state) {
          return BottomNavigationBar(
            currentIndex: state.selectedIndex,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "Profile"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.chat), label: "Chat"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings), label: "Settings"),
            ],
            onTap:
                // select different BottomNavigationBarItems
                (index) {
              if (index == 0) {
                BlocProvider.of<BottomNavigationCubit>(context)
                    .getNavBar(NavbarItem.home);
              } else if (index == 1) {
                BlocProvider.of<BottomNavigationCubit>(context)
                    .getNavBar(NavbarItem.profile);
              } else if (index == 2) {
                BlocProvider.of<BottomNavigationCubit>(context)
                    .getNavBar(NavbarItem.chat);
              } else if (index == 3) {
                BlocProvider.of<BottomNavigationCubit>(context)
                    .getNavBar(NavbarItem.settings);
              }
            },
          );
        },
      ),
      body: BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
        builder: (context, state) {
          if (state.navbarItem == NavbarItem.home) {
            return const Center(child: HomeScreenNew());
          } else if (state.navbarItem == NavbarItem.profile) {
            return const Center(child: ProfileScreen());
          } else if (state.navbarItem == NavbarItem.chat) {
            return const Center(child: ChatScreen());
          } else if (state.navbarItem == NavbarItem.settings) {
            return const Center(child: SettingPage());
          }
          return Container();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.popAndPushNamed(context, DecisionPage.route);
        },
        backgroundColor: Colors.red.withOpacity(0.95),
        child: const Icon(
          CupertinoIcons.heart_solid,
          size: 40,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
