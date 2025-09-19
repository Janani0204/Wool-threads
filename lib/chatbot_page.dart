import 'package:flutter/material.dart';

class ChatbotPage extends StatefulWidget {
  const ChatbotPage({super.key});

  @override
  State<ChatbotPage> createState() => _ChatbotPageState();
}

class _ChatbotPageState extends State<ChatbotPage> {
  final TextEditingController _controller = TextEditingController();
  String _botResponse = '';

  bool isWoolRelated(String query) {
    final keywords = ['wool', 'yarn', 'fiber', 'thread', 'textile', 'sheep', 'spinning'];
    return keywords.any((kw) => query.toLowerCase().contains(kw));
  }

  void handleQuery(String query) {
    if (!isWoolRelated(query)) {
      setState(() {
        _botResponse = "I'm here to chat only about wool-related topics. 🐑";
      });
      return;
    }

    // Replace this with your actual backend call
    setState(() {
      _botResponse = "Processing your wool-related question... 🧶";
    });

    // Example: send query to backend here
    // final response = await sendQueryToBackend(query);
    // setState(() => _botResponse = response);
  }

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
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Icon(
              Icons.chat_bubble,
              size: 100,
              color: Color(0xFF0077B6),
            ),
            const SizedBox(height: 20),
            const Text(
              'Ask me anything about wool!',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0077B6),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Type your question...',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0077B6),
              ),
              onPressed: () {
                handleQuery(_controller.text);
              },
              child: const Text('Send'),
            ),
            const SizedBox(height: 20),
            Text(
              _botResponse,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

