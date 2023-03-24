import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:searchack/pages/main/catalog/catalog_page.dart';
import 'package:searchack/pages/main/chat/chat_page.dart';
import 'package:searchack/pages/main/favourite/favourite_page.dart';
import 'package:searchack/pages/main/home/home_page.dart';
import 'package:searchack/pages/main/profile/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({
    Key? key,
  }) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = const <Widget>[
    HomePage(),
    CatalogPage(),
    FavouritePage(),
    ChatPage(),
    ProfilePage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: true,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/home.svg",
              ),
              activeIcon: SvgPicture.asset(
                "assets/icons/home.svg",
                colorFilter: const ColorFilter.mode(
                  Color.fromRGBO(1, 110, 237, 1),
                  BlendMode.srcIn,
                ),
              ),
              label: 'Главная',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/server.svg"),
              activeIcon: SvgPicture.asset(
                "assets/icons/server.svg",
                colorFilter: const ColorFilter.mode(
                  Color.fromRGBO(1, 110, 237, 1),
                  BlendMode.srcIn,
                ),
              ),
              label: 'Каталог',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset( "assets/icons/gray_star.svg"),
              activeIcon: SvgPicture.asset(
                "assets/icons/star.svg",
                colorFilter: const ColorFilter.mode(
                  Color.fromRGBO(1, 110, 237, 1),
                  BlendMode.srcIn,
                ),
              ),
              label: 'Избранное',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                "assets/icons/mail.svg",
              ),
              activeIcon: SvgPicture.asset(
                "assets/icons/mail.svg",
                colorFilter: const ColorFilter.mode(
                  Color.fromRGBO(1, 110, 237, 1),
                  BlendMode.srcIn,
                ),
              ),
              label: 'Сообщения',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset("assets/icons/user.svg"),
              activeIcon: SvgPicture.asset(
                "assets/icons/user.svg",
                colorFilter: const ColorFilter.mode(
                  Color.fromRGBO(1, 110, 237, 1),
                  BlendMode.srcIn,
                ),
              ),
              label: 'Профиль',
            ),
          ],
          unselectedItemColor: const Color.fromRGBO(208, 208, 208, 1),
          currentIndex: _selectedIndex,
          selectedItemColor: const Color.fromRGBO(1, 110, 237, 1),
          onTap: _onItemTapped,
        ),
        body: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}
