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
        centerTitle: false,
        bottomOpacity: 0.0,
        titleSpacing: 16.0,
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
      body: Column(
        children: [
          const SizedBox(
            height: 144,
            child: Padding(
              padding: EdgeInsets.only(
                left: 16,
                bottom: 24,
                top: 20,
              ),
              child: _Carousel(),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: SectionTitleWidget(
              title: 'Популярное',
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
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
          ),
        ],
      ),
    );
  }
}

class _Carousel extends StatelessWidget {
  const _Carousel({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: 10,
      itemBuilder: (context, index) {
        return _CardChooser(
          index: index,
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(width: 8);
      },
    );
  }
}

class _CardChooser extends StatelessWidget {
  const _CardChooser({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return index == 0
        ? Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(6)),
              color: Color(0xff016EED),
            ),
            width: 62,
            height: 100,
            child: Column(
              children: [
                const SizedBox(height: 8),
                SvgPicture.asset("assets/icons/union.svg"),
                const SizedBox(height: 15),
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Text(
                    'Все Сферы',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xffFFFFFF),
                    ),
                  ),
                ),
              ],
            ),
          )
        : index % 2 != 0
            ? Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  color: Color(0xffC0DDFF),
                ),
                width: 117,
                height: 100,
              )
            : Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(6)),
                  gradient: RadialGradient(
                    colors: [
                      Color(0xff00BCFE),
                      Color(0xff016EED),
                    ],
                  ),
                ),
                width: 90,
                height: 100,
              );
  }
}
