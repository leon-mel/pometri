import 'package:flutter/material.dart';

import 'Einstellungen.dart';
//Optionen und Datenschutz

class OuD extends StatelessWidget {
  const OuD({Key? key}) : super(key: key);
  static String route = "OuD";

  @override
  Widget build(BuildContext context) {
    void oeffneFehler() {
      showDialog<AlertDialog>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text(
                'Eine Premiumfunktion wird erst zukünftig implementiert',
                style: TextStyle(
                    fontSize: 16.0,
                    color: Color(0xFF000000),
                    fontFamily: "Roboto"),
              ),
              actions:  [
                ElevatedButton.icon(
                  label: const Text('Ich freue mich drauf', style: TextStyle(color: Colors.white, fontSize: 14)),
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
          appBar: AppBar(title: Text('Optionen')),
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
                  child: const Text('Blockierte Nutzer'),
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
                    Navigator.pushNamed(context, SettingPageUI.route),
                    },
                    child: const Text('Einstellungen'),
                  ),
                  const SizedBox(height: 40),

              ],
              )
            ),
          );
  }
}