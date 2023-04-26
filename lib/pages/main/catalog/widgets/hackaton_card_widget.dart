import 'package:flutter/material.dart';
import 'package:searchack/pages/main/hackaton_info/hackaton_info_page.dart';

class HackatonCardWidget extends StatelessWidget {
  const HackatonCardWidget({
    super.key,
    required this.description,
    required this.url,
    required this.hackName,
    required this.isOpen,
    required this.isOnline,
    required this.address,
  });

  final String url;
  final String hackName;
  final String isOpen;
  final String isOnline;
  final String description;
  final String address;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HackatonInfoPage(
              url: url,
              hackName: hackName,
              isOpen: isOpen,
              isOnline: isOnline,
              description: description,
              address: address,
            ),
          ),
        );
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            left: 4,
            right: 14,
            top: 4,
            bottom: 4,
          ),
          child: Row(
            children: [
              SizedBox(
                // height: 300,

                width: 140,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    url,
                    fit: BoxFit.fitHeight,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$isOpen   $isOnline',
                      style: const TextStyle(
                        fontSize: 10,
                        color: Color.fromRGBO(1, 110, 237, 1),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      hackName,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      description,
                      style: const TextStyle(fontSize: 10),
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
