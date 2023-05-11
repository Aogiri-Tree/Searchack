// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:searchack/main.dart';
import 'package:searchack/models/all_model.dart';
import 'package:searchack/pages/main/chat/widgets/hack_chat_widget.dart';
import 'package:searchack/pages/main/open_chat/open_hack_chat_page.dart';
import 'package:url_launcher/url_launcher.dart';

class HackatonInfoPage extends StatefulWidget {
  const HackatonInfoPage({
    super.key,
    required this.hack,
  });

  final All hack;

  @override
  State<HackatonInfoPage> createState() => _HackatonInfoPageState();
}

class _HackatonInfoPageState extends State<HackatonInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: widget.hack.inPriority!
          ? const Color.fromARGB(139, 0, 0, 0)
          : Colors.white,
      appBar: AppBar(
        bottomOpacity: 0.0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromRGBO(1, 110, 237, 1),
          ),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.share,
              color: Color.fromRGBO(1, 110, 237, 1),
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 390,
              width: double.infinity,
              child: Image.network(widget.hack.imageUrl!),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.hack.hackName!,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color:
                          widget.hack.inPriority! ? Colors.white : Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    '${widget.hack.isOpen!}   ${widget.hack.isOnline}',
                    style: const TextStyle(
                      color: Color.fromRGBO(1, 110, 237, 1),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    widget.hack.description!,
                    style: TextStyle(
                      color:
                          widget.hack.inPriority! ? Colors.white : Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  GestureDetector(
                    child: Text(
                      'Адрес: ${widget.hack.address}',
                      style: const TextStyle(
                        color: Color.fromRGBO(1, 110, 237, 1),
                      ),
                    ),
                    onTap: () async {
                      String query = Uri.encodeComponent(widget.hack.address!);
                      String googleUrl =
                          "https://www.google.com/maps/search/?api=1&query=$query";

                      if (await canLaunch(googleUrl)) {
                        await launch(googleUrl);
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromRGBO(1, 110, 237, 1))),
                      onPressed: () {
                        hackChats.add(
                          HackChatWidget(
                            name: widget.hack.hackName!,
                            lastMessage: 'Йоу, я тестировщик',
                            imageUrl: widget.hack.imageUrl!,
                            time: '4',
                            who: 'Никита',
                          ),
                        );

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OpenHackChatPage(
                              imageUrl: widget.hack.imageUrl!,
                            ),
                          ),
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 22),
                        child: Text('Перейти в чат'),
                      ),
                    ),
                  ),
                  widget.hack.isOpen! == "Регистрация закрыта"
                      ? const SizedBox()
                      : Center(
                          child: ElevatedButton(
                            style: const ButtonStyle(
                                backgroundColor: MaterialStatePropertyAll(
                                    Color.fromRGBO(1, 110, 237, 1))),
                            onPressed: () async {
                              if (await canLaunch(widget.hack.regUrl!)) {
                                await launch(widget.hack.regUrl!);
                              }
                            },
                            child: const Text('Зарегистрироваться'),
                          ),
                        ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
