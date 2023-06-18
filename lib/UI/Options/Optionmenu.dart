import 'package:flutter/material.dart';
import 'Preferences/Preferences.dart';
import 'SettingsPageUI.dart';

class Optionmenu extends StatelessWidget {
  const Optionmenu({Key? key}) : super(key: key);
  static String route = "OuD";

  @override
  Widget build(BuildContext context) {
    void oeffneFehler() {
      showDialog<AlertDialog>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text(
                'A premiumversion isn\u0027t aviable right now. It will be implemented soon',
                style: TextStyle(
                    fontSize: 16.0,
                    color: Color(0xFF000000),
                    fontFamily: "Roboto"),
              ),
              actions:  [
                ElevatedButton.icon(
                  label: const Text('looking forward to it', style: TextStyle(color: Colors.white, fontSize: 14)),
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(
                    Icons.thumb_up_off_alt_outlined,
                  ),
                ),
              ],
            );
          });
    } //void oeffneFehler()

    return Scaffold(
          appBar: AppBar(title: const Text('Options')),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                  ElevatedButton(
                  style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(const Size(200, 40)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ))),
                  onPressed: null,
                  child: const Text('Blocked users'),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          const Color.fromRGBO(249, 196, 66, 100)),
                      fixedSize: MaterialStateProperty.all(const Size(200, 40)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0)))),
                    onPressed: oeffneFehler,
                    child: const Text('Premium'),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(const Size(200, 40)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ))),
                    onPressed: () => {
                    Navigator.pushNamed(context, SettingPage.route),
                    },
                    child: const Text('Settings'),
                  ),
                  const SizedBox(height: 40),
                ElevatedButton(
                  style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(const Size(200, 40)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ))),
                  onPressed: () => {
                    Navigator.pushNamed(context, Preferences.route),
                  },
                  child: const Text('Preferences'),
                ),
                const SizedBox(height: 40),
              ],
              )
            ),
          );
  }
}