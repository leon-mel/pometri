import 'package:flutter/material.dart';

//Klasse SizeConfig mit Methode.
//Beim Aufruf von SizeConfig kann die Variable blockSizeParameter abgerufen
//werden, um Widgets dynamisch entsprechend der Bildschirmauflösung zu
//skalieren. Dabei entspricht blockSizeParameter 1/100 der Bildschirmhöhe
//oder -breite, je nachdem was davon größer ist.

class SizeConfig {
  static late MediaQueryData mediaQueryData;
  static late MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;
  static late double _safeAreaHorizontal;
  static late double _safeAreaVertical;
  static late double safeBlockHorizontal;
  static late double safeBlockVertical;

  void initState(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = mediaQueryData.size.width;
    screenHeight = mediaQueryData.size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
    _safeAreaHorizontal = _mediaQueryData.padding.left + _mediaQueryData.padding.right;
    _safeAreaVertical = _mediaQueryData.padding.top + _mediaQueryData.padding.bottom;
    safeBlockHorizontal = (screenWidth - _safeAreaHorizontal) / 100;
    safeBlockVertical = (screenHeight - _safeAreaVertical) / 100;
  }
}
