import 'package:flutter/material.dart';

class ChatinPage extends StatefulWidget {
  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatinPage> {
  final TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> messages = [
    {'text': 'Halo Gus, apa kabar?', 'isMe': true, 'name': 'Ridwan'},
    {'text': 'Halo Ridwan, kabar baik. Kamu gimana?', 'isMe': false, 'name': 'Agus'},
    {'text': 'Alhamdulillah, baik juga.', 'isMe': true, 'name': 'Ridwan'},
    {'text': 'Lagi sibuk apa nih?', 'isMe': false, 'name': 'Agus'},
    {'text': 'Lagi ngerjain tugas SKL dari Mr.Syahril', 'isMe': true, 'name': 'Ridwan'},
    {'text': 'oalah, saya sudah selesai dari kemaren tugas itu, tapi saya cuma buat yang sederhana saja applikasinya', 'isMe': false, 'name': 'Agus'},
  ];

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        messages.add({'text': _controller.text, 'isMe': true, 'name': 'Ridwan'});
        _controller.clear();

        // Simulate a response from Agus after a delay
        Future.delayed(Duration(seconds: 1), () {
          setState(() {
            messages.add({'text': 'Oh gitu ya, mantap!', 'isMe': false, 'name': 'Agus'});
          });
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.9),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: const BorderRadius.vertical(bottom: Radius.circular(30)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: AppBar(
            title: const Text('Chat', style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Color.fromARGB(255, 255, 119, 0)),
              onPressed: () {
                Navigator.pop(context); // Navigate back to previous page
              },
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.settings, color: Color.fromARGB(255, 255, 119, 0)),
                onPressed: () {
                  // Settings action
                },
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                final isMe = message['isMe'];
                final name = message['name'];

                return Align(
                  alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: isMe ? Color.fromARGB(255, 255, 119, 0) : Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: isMe ? Radius.circular(10) : Radius.circular(0),
                        bottomRight: isMe ? Radius.circular(0) : Radius.circular(10),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: 5),
                        Text(
                          message['text'],
                          style: const TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            height: 70,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      hintText: 'Ketik pesan...',
                      hintStyle: TextStyle(color: Colors.white54),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Color.fromARGB(255, 255, 119, 0)),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
