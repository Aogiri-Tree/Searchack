import 'package:flutter/material.dart';

class ChatWidget extends StatelessWidget {
  final String name;
  final String lastMessage;
  final String imageUrl;
  final String time;
  final String who;

  const ChatWidget(
      {super.key,
      required this.name,
      required this.lastMessage,
      required this.imageUrl,
      required this.time,
      required this.who});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: ListTile(
        leading: const CircleAvatar(
          radius: 28,
          backgroundImage: NetworkImage(
            "https://mykaleidoscope.ru/x/uploads/posts/2022-09/1663224374_37-mykaleidoscope-ru-p-ustavshii-voin-oboi-44.jpg",
          ),
        ),
        title: Text(
          name,
          style: const TextStyle(
            color: Color.fromRGBO(27, 27, 27, 1),
            fontWeight: FontWeight.bold,
            fontSize: 20,
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
