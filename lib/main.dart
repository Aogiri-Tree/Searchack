import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:searchack/models/hackaton_model.dart';
import 'package:searchack/pages/admin/admin_page.dart';
import 'package:searchack/pages/auth/login/login_page.dart';
import 'package:searchack/pages/main/main_page.dart';
import 'package:searchack/services/firebase_auth_service.dart';
import 'package:searchack/services/hackaton_service.dart';
import 'package:searchack/store/auth_store.dart';

late final Hackaton hacks;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  hacks = await HackatonService().getHacks();

  runApp(MyApp(
    firebaseAuthService: FirebaseAuthServiceImpl(FirebaseAuth.instance),
  ));
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
