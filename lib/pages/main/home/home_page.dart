import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:searchack/pages/main/home/widgets/hackaton_card_widget.dart';
import 'package:searchack/pages/main/home/widgets/section_title_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
            child: SvgPicture.asset("assets/icons/notification.svg"),
          ),
        ],
        title: const Text(
          "Главная",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const SectionTitleWidget(
              title: 'Популярное',
            ),
            const SizedBox(
              height: 12,
            ),
            Expanded(
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 12,
                  crossAxisSpacing: 8,
                  crossAxisCount: 2,
                  childAspectRatio: (2 / 3.97),
                ),
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return const HackatonCardWidget(
                    title: 'GreenData League: Spring Hack 2023',
                    description:
                        'В Перми состоится хакатон GreenData League: Spring Hack 2023». Организатор мероприятия - Российская ИТ-компания GreenData',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
