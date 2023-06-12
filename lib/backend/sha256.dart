import 'dart:convert';
import 'package:crypto/crypto.dart';

String shaEncode(String valueToHash) {
  List<int> bytes = utf8.encode(valueToHash); // Stringparameter valueToHash konvertieren in List<int>
  var digest = sha256.convert(bytes); // Hashingprozess durchführen
  return digest.toString(); // Variable digest in String umwandeln und zurückgeben
}