import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:searchack/main.dart';
import 'package:searchack/pages/main/favourite/widgets/hackaton_card_widget.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({
    Key? key,
  }) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  void initState() {
    super.initState();
    setState(() {});
  }

  final Stream<bool> _hacks = (() {
    late final StreamController<bool> controller;
    controller = StreamController<bool>(
      onListen: () async {
        if (favorites.isNotEmpty) {
          controller.add(true);
        } else {
          controller.add(false);
        }
      },
    );
    return controller.stream;
  })();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottomOpacity: 0.0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: const [
            Text(
              "Избранное",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      body: StreamBuilder(
          stream: _hacks,
          builder: (context, snapshot) {
            if (snapshot.data ?? false) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ListView.builder(
                  itemCount: favorites.length,
                  itemBuilder: (context, index) {
                    return HackatonCardWidget(
                      index: favorites[index],
                    );
                  },
                ),
              );
            } else {
              return const Center(
                child: _PlugWidget(),
              );
            }
          }),
    );
  }
}

class _PlugWidget extends StatelessWidget {
  const _PlugWidget();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset("assets/icons/empty_star.svg"),
        const SizedBox(height: 26),
        const Text(
          'Ой, тут пусто',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 24),
        const Text(
          'Добавляйте хакатоны\nв избранное',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        )
      ],
    );
  }
}
