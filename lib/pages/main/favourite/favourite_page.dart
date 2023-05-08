import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:searchack/main.dart';
import 'package:searchack/pages/main/favourite/widgets/hackaton_card_widget.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({Key? key}) : super(key: key);

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 9),
            child: SvgPicture.asset("assets/icons/filter.svg"),
          ),
        ],
        title: Row(
          children: [
            const Text(
              "Избранное",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            const SizedBox(width: 8),
            Padding(
              padding: const EdgeInsets.only(right: 9),
              child: SvgPicture.asset("assets/icons/chevron_bottom.svg"),
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
