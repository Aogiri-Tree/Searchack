import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class OpenChatPage extends StatefulWidget {
  const OpenChatPage({Key? key}) : super(key: key);

  @override
  State<OpenChatPage> createState() => _OpenChatPageState();
}

class _OpenChatPageState extends State<OpenChatPage> {
  final List<String> _messages = [
    'Привет',
    'Как дела?',
    'Отлично, а у тебя?',
    'Тоже хорошо, спасибо',
  ];
  final List<String> _senders = [
    'Я',
    'Данила',
    'Я',
    'Данила',
  ];

  final List<String> _times = [
    '22:35',
    '22:35',
    '22:35',
    '22:35',
  ];
  final TextEditingController _textController = TextEditingController();

  void _sendMessage(String message) async {
    setState(() {
      _messages.add(message);
      _senders.add('Я');
      _times.add(DateFormat.Hm().format(DateTime.now()));
      _textController.clear();
    });

    await Future.delayed(const Duration(seconds: 3));

    setState(() {
      _messages.add('Я занят!');
      _senders.add('Данила');
      _times.add(DateFormat.Hm().format(DateTime.now()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0.0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: const [
          CircleAvatar(
            radius: 22,
            backgroundImage: AssetImage(
              'assets/logo.png',
            ),
          ),
          SizedBox(
            width: 10,
          )
        ],
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromRGBO(1, 110, 237, 1),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Сообщение',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.separated(
                itemCount: _messages.length,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 25,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Align(
                    alignment: _senders[index] == 'Я'
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: _senders[index] == 'Я'
                            ? const Color.fromRGBO(236, 246, 253, 1)
                            : Colors.grey[200],
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.65,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  _senders[index],
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Color.fromRGBO(208, 208, 208, 1),
                                  ),
                                ),
                                Text(
                                  _times[index],
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Color.fromRGBO(208, 208, 208, 1),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Text(
                              _messages[index],
                              style: const TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const Divider(height: 1.0),
            Container(
              decoration: BoxDecoration(color: Theme.of(context).cardColor),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      controller: _textController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        suffixIcon: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size.zero,
                            shape: const CircleBorder(),
                            padding: EdgeInsets.zero,
                            backgroundColor:
                                const Color.fromRGBO(236, 246, 253, 1),
                          ),
                          onPressed: () {
                            if (_textController.text.isNotEmpty) {
                              _sendMessage(_textController.text);
                            }
                          },
                          child: SvgPicture.asset(
                            "assets/icons/vector.svg",
                            width: 20,
                            height: 20,
                            colorFilter: const ColorFilter.mode(
                              Color.fromRGBO(1, 110, 237, 1),
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                        hintText: 'Напишите сообщение ...',
                        hintStyle: const TextStyle(
                          color: Color.fromRGBO(106, 106, 106, 1),
                        ),
                      ),
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
