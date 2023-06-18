import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);
  static String route = "SettingPageUI";

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool valNotifyMatch = true;
  bool valNotifyChat = false;
  bool valNotifyOffline = false;
  bool valHobby = true;
  bool valLiebe= true;
  bool valFreunde = true;

  changeNotificationMatch(bool newValue) {
    setState(() {
      valNotifyMatch = newValue;
    });
  }

  changeNotificationChat(bool newValue) {
    setState(() {
      valNotifyChat = newValue;
    });
  }

  changeNotificationOffline(bool newValue) {
    setState(() {
      valNotifyOffline = newValue;
    });
  }

 changeSearchHobby(bool newValue) {
    setState(() {
      valHobby = newValue;
    });
  }

 changeSearchLiebe(bool newValue) {
    setState(() {
      valLiebe = newValue;
    });
  }

  changeSearchFreunde(bool newValue) {
    setState(() {
      valFreunde = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Settings',
                style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.bold)),
            ),
        body: Container(
            padding: const EdgeInsets.all(18),
            child: ListView(children: [
              const SizedBox(height: 5),
              const Row(
                children: [
                  Icon(
                    Icons.person,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 5),
                  Text('Account',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold)),
                ],
              ),
              const Divider(height: 20, thickness: 1),
              const SizedBox(height: 3),
              buildAccountOption(context, 'Change password'),
              buildAccountOption(context, 'Change email'),
              buildAccountOption(context, 'Language'),
              buildAccountOption(context, 'Privacy'),
              buildAccountOption(context, 'Delete Account'),
              const SizedBox(height: 25),
              const Row(
                children: [
                  Icon(Icons.volume_up_outlined, color: Colors.blue),
                  SizedBox(width: 5),
                  Text('Notifications',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
                ],
              ),
              const Divider(height: 20, thickness: 1),
              const SizedBox(height: 3),
              buildNotificationOption(
                  'Matches', valNotifyMatch, changeNotificationMatch),
              buildNotificationOption(
                  'Messages', valNotifyChat, changeNotificationChat),
              buildNotificationOption(
                  'Inactivity', valNotifyOffline, changeNotificationOffline),
              const SizedBox(height: 25),
              const Row(
                children: [
                  Icon(
                    Icons.group_add_outlined,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 5),
                  Text('Searchsettings',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold)),
                ],
              ),
              const Divider(height: 20, thickness: 1),
              const SizedBox(height: 3),
              buildSearchOption('Love', valLiebe, Icons.favorite, Colors.red, changeSearchLiebe),
              buildSearchOption('Friends', valFreunde, Icons.person, Colors.blue, changeSearchFreunde),
              buildSearchOption('Hobby', valHobby, Icons.piano_outlined, Colors.black, changeSearchHobby),
              const SizedBox(height: 10),
            ])));
  }

  Padding buildNotificationOption(
      String title, bool value, Function onChangeMethod) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[600])),
          Transform.scale(
              scale: 0.7,
              child: CupertinoSwitch(
                activeColor: Colors.blue,
                trackColor: Colors.grey,
                value: value,
                onChanged: (bool newValue) {
                  onChangeMethod(newValue);
                },
              ))
        ],
      ),
    );
  }

  Padding buildSearchOption(
      String title, bool value, IconData icon, Color color, Function onChangeMethod) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
           Row(
             mainAxisAlignment: MainAxisAlignment.start,
             children: [
               Icon(icon, color: color),
               Text(title,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[600])),
             ],
           ),
          Transform.scale(
              scale: 0.7,
              child: CupertinoSwitch(
                activeColor: color,
                trackColor: Colors.grey,
                value: value,
                onChanged: (bool newValue) {
                  onChangeMethod(newValue);
                },
              )
            ),
        ],
      ),
    );
  }

  GestureDetector buildAccountOption(BuildContext context, String title) {
    return GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(title),
                  content: const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Option 1'),
                      Text('Option 2'),
                      Text('Option 3'),
                    ],
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: const Text('close'))
                  ],
                );
              });
        },
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(title,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey[600])),
                  const Icon(Icons.arrow_forward_ios, color: Colors.grey)
                ])));
  }
}
