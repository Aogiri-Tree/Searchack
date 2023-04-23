import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 9),
            child: SvgPicture.asset("assets/icons/share.svg"),
          ),
        ],
        leading: const Icon(
          Icons.settings,
          color: Color(0xffD4D4D4),
        ),
        centerTitle: true,
        bottomOpacity: 0.0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Профиль",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 13),
          Row(
            children: [
              const SizedBox(width: 13),
              ClipOval(
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(48), // Image radius
                  child: Image.asset('assets/logo.png'),
                ),
              ),
              const SizedBox(width: 13),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    'Аскар Аглямов',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  Text('UX/UI Дизайнер'),
                ],
              ),
              const SizedBox(height: 13),
            ],
          ),
          const SizedBox(height: 17),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 25),
                decoration: const BoxDecoration(
                    color: Color(0xffFFFFFF),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Аскар Аглямов',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                    SizedBox(height: 6),
                    Text('UX/UI Дизайнер'),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 25),
                decoration: const BoxDecoration(
                    color: Color(0xffFFFFFF),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Аскар Аглямов',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                    SizedBox(height: 6),
                    Text('UX/UI Дизайнер'),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 41),
                decoration: const BoxDecoration(
                    color: Color(0xff60A9FF),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Мои резюме',
                      style: TextStyle(color: Color(0xffFFFFFF)),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 58),
                decoration: const BoxDecoration(
                    color: Color(0xffFFFFFF),
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('бла бла'),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: const BoxDecoration(
                color: Color(0xffFFFFFF),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(width: 18),
                SvgPicture.asset(
                  "assets/icons/blue_user.svg",
                ),
                const SizedBox(width: 16),
                const Text(
                  'Обо мне',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                const Spacer(),
                SvgPicture.asset(
                  "assets/icons/plus.svg",
                ),
                const SizedBox(width: 18),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: const BoxDecoration(
                  color: Color(0xffFFFFFF),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/credit_card.svg",
                        ),
                        const SizedBox(width: 16),
                        const Text(
                          'Контактные данные',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                        const Spacer(),
                        SvgPicture.asset(
                          "assets/icons/pencil.svg",
                        ),
                        const SizedBox(width: 18),
                      ],
                    ),
                    const SizedBox(height: 18),
                    const Text('Москва'),
                    const SizedBox(height: 10),
                    const Text('Почта'),
                    const SizedBox(height: 10),
                    const Text('+7 916 733 58 48'),
                  ],
                ),
              )),
          const SizedBox(height: 10),
          Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: const BoxDecoration(
                  color: Color(0xffFFFFFF),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Padding(
                padding: const EdgeInsets.only(left: 18),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/icons/book_open.svg",
                        ),
                        const SizedBox(width: 16),
                        const Text(
                          'Образование',
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 16),
                        ),
                        const Spacer(),
                        SvgPicture.asset(
                          "assets/icons/pencil.svg",
                        ),
                        const SizedBox(width: 18),
                      ],
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
