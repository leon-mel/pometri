

import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseLogin{

}

class CheckDatabaseConnection {
  void checkFirestoreConnection() async {
    try {
      await FirebaseFirestore.instance
          .collection('user')
          .get();
      print('Verbindung zur Firestore-Datenbank erfolgreich!');
    } catch (e) {
      print('Fehler bei der Verbindung zur Firestore-Datenbank: $e');
    }
  }
}


Future<void> getLoginField(String collection, String userID,String field ) async {
  try {
    // Referenz zur Sammlung und zum Dokument
    CollectionReference<Map<String, dynamic>> collectionReference =
    FirebaseFirestore.instance.collection(collection);
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
    await collectionReference.doc(userID).get();

    // Überprüfe, ob das Dokument existiert
    if (documentSnapshot.exists) {
      // Daten aus dem Dokument extrahieren
      Map<String, dynamic>? data = documentSnapshot.data();

      // Überprüfe, ob das Feld vorhanden ist
      if (data!.containsKey(field)) {
        dynamic fieldValue = data![field];
        print(fieldValue);
      } else {
        print('Das Feld $field existiert nicht im Dokument.');
      }
    } else {
      print('Dokument FatSalt nicht gefunden.');
    }
  } catch (e) {
    print('Fehler beim Abrufen der Daten: $e');
  }
}




