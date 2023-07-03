import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _messagesCollection.orderBy('timestamp').snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text('Loading...');
                }

                return ListView(
                  reverse: true,
                  children: [...snapshot.data?.docs.map((DocumentSnapshot document) {
                    return ListTile(
                      title: Text(document['text']),
                      subtitle: Text(document['sender']),
                    );
                  }) ?? []],
                );
              },
            ),
          ),
          Divider(),
          ListTile(
            leading: IconButton(
              icon: Icon(Icons.send),
              onPressed: () {
                _sendMessage(_textController.text);
              },
            ),
            title: TextFormField(
              controller: _textController,
              decoration: InputDecoration(labelText: 'Enter a message'),
            ),
          ),
        ],
      ),
    );
  }

  void _sendMessage(String text) async {
    if (text.isNotEmpty) {
      await _messagesCollection.add({
        'text': text,
        'sender': 'John Doe',
        'timestamp': DateTime.now(),
      });
      _textController.clear();
    }
  }
}