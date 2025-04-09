import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:howfarchat/constant/app_image.dart';
import 'package:howfarchat/services/chat_services.dart';
import 'package:provider/provider.dart';

// Ensure that ChatService is available to the ChatpageWidget
class ChatpageWidget extends StatefulWidget {
  final String receiverUserEmail;
  final String receiverUserID;
  const ChatpageWidget(
      {super.key,
      required this.receiverUserEmail,
      required this.receiverUserID, required String message});

  @override
  State<ChatpageWidget> createState() => _ChatpageWidgetState();
}

class _ChatpageWidgetState extends State<ChatpageWidget> {
  TextEditingController _messageController = TextEditingController();
  late FocusNode _textFieldFocusNode;

  @override
  void initState() {
    super.initState();
    _messageController = TextEditingController();
    _textFieldFocusNode = FocusNode();
  }

  @override
  void dispose() {
    _messageController.dispose();
    _textFieldFocusNode.dispose();
    super.dispose();
  }

  void sendMessage(ChatService chatService) async {
    if (_messageController.text.isNotEmpty) {
      await chatService.sendMessage(
          widget.receiverUserID, _messageController.text);
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    final chatService = Provider.of<ChatService>(context, listen: false);

    return Scaffold(
      backgroundColor: const Color(0xFF1A2947),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A2947),
        leading: Padding(
          padding: const EdgeInsets.only(left: 22, top: 0, bottom: 3),
          child: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_outlined,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () {
              Navigator.pop(context); // Navigate back
            },
          ),
        ),
        title: Container(
          width: 268,
          height: 49,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(AppImage.image1),
                ),
              ),
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'profile name',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  // Implement your phone button functionality here
                },
                icon: const Icon(
                  Icons.phone_outlined,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              IconButton(
                onPressed: () {
                  // Implement your video button functionality here
                },
                icon: const Icon(
                  Icons.videocam_outlined,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              IconButton(
                onPressed: () {
                  // Implement your menu button functionality here
                },
                icon: const Icon(
                  Icons.menu,
                  color: Colors.white,
                  size: 24,
                ),
              ),
            ],
          ),
        ],
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8),
                child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: chatService.getMessages(
                      chatService.currentUser!.uid, widget.receiverUserID),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    }

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                      return const Center(child: Text('No messages yet'));
                    }

                    return ListView.builder(
                      reverse: true,
                      itemCount: snapshot.data!.docs.length,
                      itemBuilder: (context, index) {
                        var data = snapshot.data!.docs[index].data();
                        var isSentByMe =
                            data['senderId'] == chatService.currentUser!.uid;

                        return Align(
                          alignment: isSentByMe
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            margin: const EdgeInsets.symmetric(vertical: 4),
                            decoration: BoxDecoration(
                              color: isSentByMe ? Colors.blue : Colors.grey,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              data['message'],
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _messageController,
                      focusNode: _textFieldFocusNode,
                      decoration: InputDecoration(
                        labelText: 'Type your message',
                        prefixIcon: const Icon(Icons.emoji_emotions_outlined),
                        suffixIcon: IconButton(
                          onPressed: () => sendMessage(chatService),
                          icon: const Icon(Icons.send_sharp),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      // Implement your microphone button functionality here
                    },
                    icon: const Icon(
                      Icons.mic_none,
                      color: Colors.white,
                      size: 24,
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
