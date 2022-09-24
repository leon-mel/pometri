import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class SettingPageUI extends StatefulWidget {
  const SettingPageUI({Key? key}) : super(key: key);
  static String route = "SettingPageUI";

  @override
  State<SettingPageUI> createState() => _SettingPageUIState();
}

class _SettingPageUIState extends State<SettingPageUI> {
  bool valNotifyMatch = true;
  bool valNotifyChat = false;
  bool valNotifyOffline = false;
  bool valHobby = true;
  bool valLiebe= true;
  bool valFreunde = true;
  bool valRandom= true;

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

  changeSearchRandom(bool newValue) {
    setState(() {
      valRandom = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text('Einstellungen',
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
              Divider(height: 20, thickness: 1),
              SizedBox(height: 3),
              buildAccountOption(context, 'Passwort ändern'),
              buildAccountOption(context, 'E-Mail ändern'),
              buildAccountOption(context, 'Sprache'),
              buildAccountOption(context, 'Datenschutzrichtlinie'),
              buildAccountOption(context, 'Account löschen'),
              SizedBox(height: 25),
              Row(
                children: [
                  Icon(Icons.volume_up_outlined, color: Colors.blue),
                  SizedBox(width: 5),
                  Text('Benachrichtigungen',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold))
                ],
              ),
              Divider(height: 20, thickness: 1),
              SizedBox(height: 3),
              buildNotificationOption(
                  'Bei Matches', valNotifyMatch, changeNotificationMatch),
              buildNotificationOption(
                  'Bei Chatnachrichten', valNotifyChat, changeNotificationChat),
              buildNotificationOption(
                  'Bei 24h nicht online', valNotifyOffline, changeNotificationOffline),
              SizedBox(height: 25),
              Row(
                children: [
                  Icon(
                    Icons.group_add_outlined,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 5),
                  Text('Suche',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold)),
                ],
              ),
              Divider(height: 20, thickness: 1),
              SizedBox(height: 3),
              buildSearchOption('Liebe', valLiebe, Icons.favorite, Colors.red, changeSearchLiebe),
              buildSearchOption('Freunde', valFreunde, Icons.person, Colors.blue, changeSearchFreunde),
              buildSearchOption('Hobby', valHobby, Icons.piano_outlined, Colors.black, changeSearchHobby),
              SizedBox(height: 10),
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
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
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
                  content: Column(
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
                        child: Text('schließen'))
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
                  Icon(Icons.arrow_forward_ios, color: Colors.grey)
                ])));
  }
}
