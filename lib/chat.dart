import 'package:flutter/material.dart';
import 'package:skl_ui_app_1/chatin.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.9),
      body: Column(
        children: [
          // Custom AppBar with rounded bottom edges
          Container(
            decoration: BoxDecoration(
              color: Colors.yellow[900],
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
              title: const Text(
                'Chats',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 10, // Number of chat items
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder:(context) => ChatinPage(),));
                    },
                    child: Card(
                      color: Colors.white,
                      child: Container(
                        padding: const EdgeInsets.all(20.0), // Increased padding
                        child: Row(
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.grey[300],
                              child: const Icon(Icons.person, color: Colors.black),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Chat ${index + 1}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18, // Increased font size
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  const Text(
                                    'Terakhir kali dibaca',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 16),
                            Text(
                              '20:00 PM',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Halaman detail chat
class ChatDetailPage extends StatelessWidget {
  final String chatTitle;

  const ChatDetailPage({super.key, required this.chatTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(chatTitle),
        backgroundColor: Colors.yellow[900],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Text(
          'Welcome to $chatTitle conversation!',
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
      backgroundColor: Colors.black.withOpacity(0.9),
    );
  }
}
