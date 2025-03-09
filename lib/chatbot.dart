import 'package:flutter/material.dart';

class Chatbot extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<Chatbot> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, String>> _messages = [];
  final Map<String, String> _staticResponses = {
    'what is aquaclense?': 'AquaClense is an innovative waste management system designed to clean stagnant and flowing water bodies using physics-based solutions.',
    'how does it work?': 'AquaClense uses fluid dynamics and suction technology to channel waste into collection bins, tailored to the specific dimensions of water bodies.',
    'price?': 'Pricing for AquaClense varies by model and customization. Please contact us for a detailed quote!',
    'support': 'For support, please reach out to us via the Contact Us page or email us at support@aquaclense.com.',
    'default': 'Sorry, I didn’t understand that. Try asking about AquaClense features, pricing, or support!',
  };

  void _sendMessage() {
    final message = _messageController.text.trim().toLowerCase();
    if (message.isEmpty) return;

    setState(() {
      _messages.add({'sender': 'user', 'text': message});
    });

    _messageController.clear();

    // Find a matching response or use the default
    String response = _staticResponses['default']!;
    for (var key in _staticResponses.keys) {
      if (message.contains(key)) {
        response = _staticResponses[key]!;
        break;
      }
    }

    setState(() {
      _messages.add({'sender': 'bot', 'text': response});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat with AquaBot"),
        backgroundColor: Colors.blue[900],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                final isUser = message['sender'] == 'user';
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Row(
                    mainAxisAlignment: isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
                    children: [
                      if (!isUser)
                        const CircleAvatar(
                          backgroundColor: Colors.blue,
                          child: Text("A", style: TextStyle(color: Colors.white)),
                        ),
                      const SizedBox(width: 8),
                      Flexible(
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: isUser ? Colors.blue[100] : Colors.grey[200],
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            message['text']!,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      if (isUser)
                        const CircleAvatar(
                          backgroundColor: Colors.grey,
                          child: Text("U", style: TextStyle(color: Colors.white)),
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: "Type your message...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),
                const SizedBox(width: 8),
                IconButton(
                  icon: const Icon(Icons.send),
                  color: Colors.blue,
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }
}