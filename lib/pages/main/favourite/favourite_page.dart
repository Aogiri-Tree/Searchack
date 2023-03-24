import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({Key? key}) : super(key: key);

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
      body: Center(
        child: Column(
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
        ),
      ),
    );
  }
}
