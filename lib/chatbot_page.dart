import 'package:flutter/material.dart';

class ChatbotPage extends StatelessWidget {
  const ChatbotPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Chatbot',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color(0xFF0077B6),
        centerTitle: true,
      ),
      body: Container(
        color: const Color.fromARGB(255, 182, 215, 254),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.chat_bubble,
                size: 100,
                color: Color(0xFF0077B6),
              ),
              const SizedBox(height: 20),
              const Text(
                'How can I assist you today?',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0077B6),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0077B6),
                ),
                onPressed: () {
                  // Implement chatbot functionality here
                },
                child: const Text('Start Chat'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
