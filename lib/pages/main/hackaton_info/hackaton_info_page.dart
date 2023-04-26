import 'package:flutter/material.dart';

class HackatonInfoPage extends StatelessWidget {
  const HackatonInfoPage(
      {super.key,
      required this.url,
      required this.hackName,
      required this.isOpen,
      required this.isOnline,
      required this.description,
      required this.address});

  final String url;
  final String hackName;
  final String isOpen;
  final String isOnline;
  final String description;
  final String address;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 390,
            width: double.infinity,
            child: Image.network(url),
          ),
          // const SizedBox(
          //   height: 24,
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hackName,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Text(
                  '$isOpen   $isOnline',
                  style: const TextStyle(
                    color: Color.fromRGBO(1, 110, 237, 1),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(description),
                const SizedBox(
                  height: 8,
                ),
                Text('Адрес: $address'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
