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


Future<bool> getLoginField(String collection, String userID,String field, String fieldVar) async {

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
        dynamic fieldValue = data[field];
        if(fieldValue == fieldVar){
          return true;
        }
      } else {
        print('Das Feld $field existiert nicht im Dokument.');
      }
    } else {
      print('Benutzername oder Kennwort falsch.');
    }
  }

  catch (e) {
    if(e is AssertionError && e.toString().contains('path.isNotEmpty')){
      print('Benutzername NULL.');
    } else {
      print('Fehler beim Abrufen der Daten: $e');
    }
  }
  return false;
}



void writeToFirebaseUser(
    String username,
    String firstName,
    String lastName,
    DateTime birthDate,
    String email,
    String mobNumber,
    String streetAddress,
    String addressNumber,
    String city,
    String postCode,
    String country) {

  // Firestore-Referenz erstellen
  CollectionReference usersCollection = FirebaseFirestore.instance.collection('user');

  // Neues Dokument erstellen mit dem Benutzernamen als ID
  DocumentReference userDoc = usersCollection.doc(username);

  // Daten in das Dokument schreiben
  userDoc.set({
    'first_name': firstName,
    'last_name': lastName,
    'date_of_birth': Timestamp.fromDate(birthDate),
    'email': email,
    'mobilenumber': {
      'country_code': '+49',
      'number': mobNumber,
    },
    'address': {
      'street': streetAddress,
      'streetnumber': addressNumber,
      'city': city,
      'postal_code': postCode,
      'country': country,
    },
    'regVerification': {
      'regFlag': 1,
      'regTimestamp': DateTime.now().add(const Duration(hours: 72))
    },
  }).then((value) {
    // Erfolgreiches Schreiben in die Datenbank
    print('Daten wurden erfolgreich in die Firebase-Datenbank geschrieben!');
  }).catchError((error) {
    // Fehler beim Schreiben in die Datenbank
    print('Fehler beim Schreiben in die Firebase-Datenbank: $error');
  });
}

void writeToFirebaseLogin(
    String username,
    String password) {

  // Firestore-Referenz erstellen
  CollectionReference usersCollection = FirebaseFirestore.instance.collection('login');

  // Neues Dokument erstellen mit dem Benutzernamen als ID
  DocumentReference userDoc = usersCollection.doc(username);

  // Daten in das Dokument schreiben
  userDoc.set({
    'password': password,
    'userRef': username,

  }).then((value) {
    // Erfolgreiches Schreiben in die Datenbank
    print('Daten wurden erfolgreich in die Firebase-Datenbank geschrieben!');
  }).catchError((error) {
    // Fehler beim Schreiben in die Datenbank
    print('Fehler beim Schreiben in die Firebase-Datenbank: $error');
  });
}




