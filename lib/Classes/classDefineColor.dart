import 'package:flutter/material.dart';

//Labels "Forgot your password?" und "Create new account" im Loginwindow beim
//anklicken kurz einfärben. Farben dafür sind hier definiert.

Color defColor(int a) {
  Color _color1 = Color(0xFF7FFFAB);
  Color _color2 = Color(0xFF00C800);
  if (a == 1) {
    return _color2;
  } else {
    return _color1;
  }
}