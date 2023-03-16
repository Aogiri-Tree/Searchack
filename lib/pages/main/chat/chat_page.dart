import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 9),
            child: SvgPicture.asset("assets/icons/search.svg"),
          ),
        ],
        title: const Text(
          "Чаты",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) => const ChatWidget(
            name: 'Аскар Аглямов',
            lastMessage: 'Понял, спасибо!',
            imageUrl:
                'https://petapixel.com/assets/uploads/2023/03/weic2307f-2048x1718.jpg',
            time: '7',
            who: 'Вы'),
        itemCount: 3,
      ),
    );
  }
}
