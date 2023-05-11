import 'package:flutter/material.dart';
import 'package:searchack/main.dart';

import 'package:searchack/pages/main/hackaton_info/hackaton_info_page.dart';

class HackatonCardWidget extends StatefulWidget {
  const HackatonCardWidget({
    super.key,
    required this.index,
  });

  final int index;

  @override
  State<HackatonCardWidget> createState() => _HackatonCardWidgetState();
}

class _HackatonCardWidgetState extends State<HackatonCardWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HackatonInfoPage(
              hack: filteredHacks.value[widget.index],
            ),
          ),
        );
      },
      child: Card(
        color:
            filteredHacks.value[widget.index].hackName!.contains('фармакология')
                ? Colors.blue[100]
                : Colors.white,
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
                width: 140,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    filteredHacks.value[widget.index].imageUrl!,
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
                          '${filteredHacks.value[widget.index].isOpen!}   ${filteredHacks.value[widget.index].isOnline}',
                          style: const TextStyle(
                            fontSize: 10,
                            color: Color.fromRGBO(1, 110, 237, 1),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {});
                            filteredHacks.value[widget.index].isFavorite =
                                !(filteredHacks
                                    .value[widget.index].isFavorite)!;
                            if (filteredHacks.value[widget.index].isFavorite!) {
                              favorites.add(widget.index);
                            } else {
                              favorites.remove(widget.index);
                            }
                          },
                          child: Icon(
                            Icons.favorite,
                            size: 20,
                            color: filteredHacks.value[widget.index].isFavorite!
                                ? Colors.red
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      filteredHacks.value[widget.index].hackName!,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      filteredHacks.value[widget.index].description!,
                      style: const TextStyle(fontSize: 10),
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
