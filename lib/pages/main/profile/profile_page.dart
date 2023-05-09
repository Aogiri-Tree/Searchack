import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:searchack/pages/main/profile/profile_contacts.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController addressController =
      TextEditingController(text: 'Москва');

  final TextEditingController emailController =
      TextEditingController(text: 'anssirod@gmail.com');

  final TextEditingController numberController =
      TextEditingController(text: '89169422489');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: AppBar(
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
                    'Данила Калиш',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                  Text('Flutter developer'),
                ],
              ),
              const SizedBox(height: 13),
            ],
          ),
          const SizedBox(height: 17),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: const BoxDecoration(
                color: Color(0xffFFFFFF),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(width: 18),
                    SvgPicture.asset(
                      "assets/icons/blue_user.svg",
                    ),
                    const SizedBox(width: 16),
                    const Text(
                      'Обо мне',
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                    ),
                    const Spacer(),
                    SvgPicture.asset(
                      "assets/icons/pencil.svg",
                    ),
                    const SizedBox(width: 18),
                  ],
                ),
                const SizedBox(height: 18),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Text('Кросплатформенный '
                      'мобильный разработчик, занимаюсь Flutter\'ом с 2018 года'),
                ),
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
                        GestureDetector(
                          onTap: () {
                            Future push = Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProfileContacts(
                                  addressController: addressController,
                                  emailController: emailController,
                                  numberController: numberController,
                                ),
                              ),
                            );
                            push.then((_) => setState(() {}));
                          },
                          child: SvgPicture.asset(
                            "assets/icons/pencil.svg",
                          ),
                        ),
                        const SizedBox(width: 18),
                      ],
                    ),
                    const SizedBox(height: 18),
                    Text(addressController.text),
                    const SizedBox(height: 10),
                    Text(emailController.text),
                    const SizedBox(height: 10),
                    Text(numberController.text),
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
                    const SizedBox(height: 18),
                    const Text('РТУ МИРЭА'),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
