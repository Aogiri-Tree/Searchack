import 'package:flutter/material.dart';
import 'package:searchack/pages/main/open_chat/open_hack_chat_page.dart';

class HackChatWidget extends StatelessWidget {
  final String name;
  final String lastMessage;
  final String imageUrl;
  final String time;
  final String who;

  const HackChatWidget({
    super.key,
    required this.name,
    required this.lastMessage,
    required this.imageUrl,
    required this.time,
    required this.who,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => OpenHackChatPage(
              imageUrl: imageUrl,
            ),
          ),
        );
      },
      child: ListTile(
        leading: CircleAvatar(
          radius: 28,
          backgroundImage: NetworkImage(
            imageUrl,
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 7),
          child: Text(
            name,
            style: const TextStyle(
              color: Color.fromRGBO(27, 27, 27, 1),
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        subtitle: Row(
          children: [
            Text(
              "$who: ",
              style: const TextStyle(
                color: Color.fromRGBO(208, 208, 208, 1),
                fontSize: 14,
              ),
            ),
            Text(
              lastMessage,
              style: const TextStyle(
                color: Color.fromRGBO(106, 106, 106, 1),
                fontSize: 14,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              "$timeч",
              style: const TextStyle(
                color: Color.fromRGBO(208, 208, 208, 1),
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
