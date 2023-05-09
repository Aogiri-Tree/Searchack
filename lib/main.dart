import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:searchack/models/hackaton_model.dart';
import 'package:searchack/pages/admin/admin_page.dart';
import 'package:searchack/pages/auth/login/login_page.dart';
import 'package:searchack/pages/main/main_page.dart';
import 'package:searchack/services/firebase_auth_service.dart';
import 'package:searchack/services/hackaton_service.dart';
import 'package:searchack/store/auth_store.dart';

late final Hackaton hacks;
final List<int> favorites = [1];

Future<void> _showNotificationWithActions(
    FlutterLocalNotificationsPlugin plugin) async {
  const AndroidNotificationDetails androidNotificationDetails =
      AndroidNotificationDetails(
          'high_importance_channel', 'High Importance Notifications',
          importance: Importance.high, playSound: true);
  const NotificationDetails notificationDetails =
      NotificationDetails(android: androidNotificationDetails);
  await plugin.show(0, 'Хакатон «Цифровая фармакология',
      'Дата проведения приближается!', notificationDetails);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  hacks = await HackatonService().getHacks();
  hacks.all![1].isFavorite = true;

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_stat_error_outline');

  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  runApp(MyApp(
    firebaseAuthService: FirebaseAuthServiceImpl(FirebaseAuth.instance),
  ));

  await Future.delayed(const Duration(seconds: 10));
  _showNotificationWithActions(flutterLocalNotificationsPlugin);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.firebaseAuthService});
  final IFirebaseAuthService firebaseAuthService;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      ),
      debugShowCheckedModeBanner: false,
      home: StreamBuilder<User?>(
          stream: firebaseAuthService.authStateChanges,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data?.uid == "xvI1CuzOQ0hNX1svDUnR5dkaEEf2") {
                return const AdminPage();
              } else {
                return const MainPage();
              }
            } else {
              return LoginPage(
                authStore: AuthStore(),
              );
            }
          }),
    );
  }
}
