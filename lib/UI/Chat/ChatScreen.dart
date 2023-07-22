import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);
  static String route = "ChatScreen";

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final CollectionReference _messagesCollection = FirebaseFirestore.instance
      .collection('messages');
  final Map<String, String> _smileyDictionary = {
    // Hier kann ausgewählt werden welche Zeichen-Smileys zu welchen Ascii-Emojis umgewandelt werden sollen
    ':)': '😊',
    ':-)': '😊',
    '(:': '😊',
    '(-:': '😊',
    ':D': '😄',
    ':-D': '😄',
    ';)': '😉',
    ';-)': '😉',
    ':(': '😞',
    ':-(': '😞',
    '<3': '♥',
    ':|': '😐',
    ':-|': '😐',
    '|:': '😐',
    '|-:': '😐',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: _messagesCollection
            .where('sender', whereIn: ['Person A', 'Person B'])
            .orderBy('timestamp')
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          final messages = snapshot.data?.docs ?? [];
          final chatMessages = messages.map((document) {
            final text = document['text'];
            final sender = document['sender'];
            final timestamp = (document['timestamp'] as Timestamp).toDate();

            String emojiText = text; //Hier werden Smileys entspr. des o.g. Dictionarys mit den in der Nachricht enthaltenen ASCII-Symbolen ausgetauscht
            _smileyDictionary.forEach((key, value) {
              emojiText = emojiText.replaceAll(key, value);
            });

            return types.TextMessage(
              author: types.User(id: sender),
              createdAt: timestamp.millisecondsSinceEpoch,
              // Timestamp in Unix Zeit
              id: document.id,
              text: emojiText,
            );
          }).toList();

          return Chat(
            messages: chatMessages.reversed.toList(),
            // Chat wird dadurch von oben nach unten angezeigt
            onSendPressed: _sendMessage,
            user: const types.User(id: 'Person A'), // Platzhalter für UserID
          );
        },
      ),
    );
  }

  void _sendMessage(types.PartialText message) async {
    if (message.text
        .isNotEmpty) { //falls Text nicht leer ist, wird Nachricht nach Smileys in Form von Zeichen abgesucht und diese werden gg. Emojis in Ascii ausgetauscht
      String keywordText = message.text;
      _smileyDictionary.forEach((key, value) {
        keywordText = keywordText.replaceAll(value, key);
      });

      // DateTime wird zu Firestore Timestamp konvertiert
      final timestamp = Timestamp.fromDate(DateTime.now());

      await _messagesCollection.add({
        'text': keywordText,
        'sender': 'Person A',
        //hier muss noch der Name der Person angegeben werden, wenn Matching implementiert
        'timestamp': timestamp,
      });
    }
  }
}