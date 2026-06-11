import 'package:flutter/material.dart';
import 'package:whats_app_clone/models/chat_data_model.dart';
import 'package:whats_app_clone/models/message_model.dart';

class ChatDetailsScreen extends StatefulWidget {
  const ChatDetailsScreen({super.key, required this.chatData});
  final ChatDataModel chatData;

  @override
  State<ChatDetailsScreen> createState() => _ChatDetailsScreenState();
}

class _ChatDetailsScreenState extends State<ChatDetailsScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<MessageModel> _messages = [
    MessageModel(text: "أهلاً بك!", time: "10:00 ص", isMe: false),
    MessageModel(text: "كيف حالك؟", time: "10:01 ص", isMe: false),
    MessageModel(text: "الحمد لله، بخير. وأنت؟", time: "10:05 ص", isMe: true),
    MessageModel(text: "بخير والحمد لله", time: "10:06 ص", isMe: false),
  ];

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        _messages.add(MessageModel(
          text: _controller.text,
          time: TimeOfDay.now().format(context),
          isMe: true,
        ));
        _controller.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B141A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1F2C34),
        leadingWidth: 70,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Row(
            children: [
              const Icon(Icons.arrow_back, color: Colors.white),
              CircleAvatar(
                radius: 18,
                backgroundImage: AssetImage(widget.chatData.imagePath),
              ),
            ],
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.chatData.name,
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
            const Text(
              "متصل الآن",
              style: TextStyle(color: Colors.white70, fontSize: 12),
            ),
          ],
        ),
        actions: const [
          Icon(Icons.videocam, color: Colors.white),
          SizedBox(width: 15),
          Icon(Icons.call, color: Colors.white),
          SizedBox(width: 15),
          Icon(Icons.more_vert, color: Colors.white),
          SizedBox(width: 10),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/chat_bg.png"), // Assuming a background image exists or just a color
            fit: BoxFit.cover,
            opacity: 0.06,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: _messages.length,
                itemBuilder: (context, index) {
                  final message = _messages[index];
                  return Align(
                    alignment: message.isMe ? Alignment.centerRight : Alignment.centerLeft,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: message.isMe ? const Color(0xFF005C4B) : const Color(0xFF1F2C34),
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(12),
                          topRight: const Radius.circular(12),
                          bottomLeft: message.isMe ? const Radius.circular(12) : Radius.zero,
                          bottomRight: message.isMe ? Radius.zero : const Radius.circular(12),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            message.text,
                            style: const TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            message.time,
                            style: const TextStyle(color: Colors.white54, fontSize: 10),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: const Color(0xFF1F2C34),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 10),
                          const Icon(Icons.emoji_emotions_outlined, color: Colors.white54),
                          const SizedBox(width: 10),
                          Expanded(
                            child: TextField(
                              controller: _controller,
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                hintText: "رسالة",
                                hintStyle: TextStyle(color: Colors.white54),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          const Icon(Icons.attach_file, color: Colors.white54),
                          const SizedBox(width: 10),
                          const Icon(Icons.camera_alt, color: Colors.white54),
                          const SizedBox(width: 10),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  GestureDetector(
                    onTap: _sendMessage,
                    child: const CircleAvatar(
                      backgroundColor: Color(0xFF00A884),
                      radius: 24,
                      child: Icon(Icons.send, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
