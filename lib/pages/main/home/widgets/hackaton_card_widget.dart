import 'package:flutter/material.dart';

class HackatonCardWidget extends StatelessWidget {
  const HackatonCardWidget({
    super.key,
    required this.title,
    required this.description,
  });
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              'assets/logo.png',
              fit: BoxFit.cover,
              width: double.infinity,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            'Регистрация закрыта   Онлайн',
            style: TextStyle(
              fontSize: 10,
              color: Color.fromRGBO(1, 110, 237, 1),
            ),
          ),
          const Text(
            'DS/ML/AI   Пермь',
            style: TextStyle(
              fontSize: 10,
              color: Color.fromRGBO(1, 110, 237, 1),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            description,
            style: const TextStyle(fontSize: 10),
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
