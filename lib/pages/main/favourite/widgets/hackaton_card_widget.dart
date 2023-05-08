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
  bool isFavorite = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HackatonInfoPage(
              hack: hacks.all![widget.index],
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
                    hacks.all![widget.index].imageUrl!,
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
                          '${hacks.all![widget.index].isOpen!}   ${hacks.all![widget.index].isOnline}',
                          style: const TextStyle(
                            fontSize: 10,
                            color: Color.fromRGBO(1, 110, 237, 1),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {});

                            isFavorite = !isFavorite;

                            if (isFavorite == false) {
                              hacks.all![widget.index].isFavorite = false;
                              favorites.removeWhere(
                                  (element) => element == widget.index);
                            } else {
                              hacks.all![widget.index].isFavorite = true;
                              favorites.add(widget.index);
                            }
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
                      hacks.all![widget.index].hackName!,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      hacks.all![widget.index].description!,
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
