// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:searchack/models/all_model.dart';
import 'package:url_launcher/url_launcher.dart';

class HackatonInfoPage extends StatelessWidget {
  const HackatonInfoPage({
    super.key,
    required this.hack,
  });

  final All hack;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          hack.inPriority! ? const Color.fromARGB(139, 0, 0, 0) : Colors.white,
      appBar: AppBar(
        bottomOpacity: 0.0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color.fromRGBO(1, 110, 237, 1),
          ),
          onPressed: () => Navigator.of(context).pop(),
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
              child: Image.network(hack.imageUrl!),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    hack.hackName!,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: hack.inPriority! ? Colors.white : Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    '${hack.isOpen!}   ${hack.isOnline}',
                    style: const TextStyle(
                      color: Color.fromRGBO(1, 110, 237, 1),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Text(
                    hack.description!,
                    style: TextStyle(
                      color: hack.inPriority! ? Colors.white : Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  GestureDetector(
                    child: Text(
                      'Адрес: ${hack.address}',
                      style: const TextStyle(
                        color: Color.fromRGBO(1, 110, 237, 1),
                      ),
                    ),
                    onTap: () async {
                      String query = Uri.encodeComponent(hack.address!);
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
                        onPressed: () async {
                          if (await canLaunch(hack.regUrl!)) {
                            await launch(hack.regUrl!);
                          }
                        },
                        child: const Text('Зарегистрироваться')),
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
