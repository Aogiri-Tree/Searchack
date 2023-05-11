import 'package:flutter/material.dart';
import 'package:searchack/main.dart';
import 'package:searchack/pages/main/chat/widgets/chat_widget.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0.0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Чаты",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          const ChatWidget(
            name: 'Данила Калиш',
            lastMessage: 'Понял, спасибо!',
            imageUrl:
                'https://petapixel.com/assets/uploads/2023/03/weic2307f-2048x1718.jpg',
            time: '7',
            who: 'Вы',
          ),
          const SizedBox(
            height: 10,
          ),
          hackChats.isEmpty ? const SizedBox() : hackChats.first,
          // HackChatWidget(
          //   name: hacks.all![1].hackName!,
          //   lastMessage: 'Понял, спасибо!',
          //   imageUrl: hacks.all![1].imageUrl!,
          //   time: '7',
          //   who: 'Вы',
          // ),
        ],
      ),
    );
  }
}
