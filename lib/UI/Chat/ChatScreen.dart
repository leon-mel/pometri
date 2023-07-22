import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';

class ChatScreen extends StatefulWidget {
  static String route = "ChatScreen";

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _textController = TextEditingController();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _messagesCollection =
  FirebaseFirestore.instance.collection('messages');

  // Dictionary to map smiley keywords to emojis
  final Map<String, String> _smileyDictionary = {
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
        title: Text('Chat'),
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
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          final messages = snapshot.data?.docs ?? [];
          final chatMessages = messages.map((document) {
            final text = document['text'];
            final sender = document['sender'];
            final timestamp = (document['timestamp'] as Timestamp).toDate();

            // Replace smiley keywords with emojis
            String emojiText = text;
            _smileyDictionary.forEach((key, value) {
              emojiText = emojiText.replaceAll(key, value);
            });

            return types.TextMessage(
              author: types.User(id: sender),
              createdAt: timestamp.millisecondsSinceEpoch, // Convert to Unix timestamp in milliseconds
              id: document.id,
              text: emojiText,
            );
          }).toList();

          return Chat(
            messages: chatMessages.reversed.toList(), // Reverse the list
            onSendPressed: _sendMessage,
            user: types.User(id: 'Person A'), // Replace with the current user's ID
          );
        },
      ),
    );
  }

  void _sendMessage(types.PartialText message) async {
    if (message.text.isNotEmpty) {
      // Replace emojis with smiley keywords before storing in the database
      String keywordText = message.text;
      _smileyDictionary.forEach((key, value) {
        keywordText = keywordText.replaceAll(value, key);
      });

      // Convert DateTime to Firestore Timestamp
      final timestamp = Timestamp.fromDate(DateTime.now());

      await _messagesCollection.add({
        'text': keywordText,
        'sender': 'Person A',
        'timestamp': timestamp,
      });
    }
  }
}