import 'package:flutter/material.dart';
import 'package:searchack/main.dart';
import 'package:searchack/models/all_model.dart';
import 'package:searchack/pages/main/hackaton_info/hackaton_info_page.dart';

class HackatonCardWidget extends StatefulWidget {
  const HackatonCardWidget({
    super.key,
    required this.description,
    required this.imageUrl,
    required this.hackName,
    required this.isOpen,
    required this.isOnline,
    required this.address,
    required this.regUrl,
    required this.inPriority,
  });

  final String imageUrl;
  final String hackName;
  final String isOpen;
  final String isOnline;
  final String description;
  final String address;
  final String regUrl;
  final bool inPriority;

  @override
  State<HackatonCardWidget> createState() => _HackatonCardWidgetState();
}

class _HackatonCardWidgetState extends State<HackatonCardWidget> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HackatonInfoPage(
              imageUrl: widget.imageUrl,
              hackName: widget.hackName,
              isOpen: widget.isOpen,
              isOnline: widget.isOnline,
              description: widget.description,
              address: widget.address,
              regUrl: widget.regUrl,
              inPriority: widget.inPriority,
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
                    widget.imageUrl,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${widget.isOpen}   ${widget.isOnline}',
                          style: const TextStyle(
                            fontSize: 10,
                            color: Color.fromRGBO(1, 110, 237, 1),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {});
                            isFavorite = !isFavorite;
                          },
                          child: Icon(
                            Icons.favorite,
                            size: 20,
                            color: isFavorite ? Colors.red : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.hackName,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      widget.description,
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
