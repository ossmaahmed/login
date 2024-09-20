import 'package:flutter/material.dart';
import 'package:login/Login.dart';
import 'package:login/database/cache_helper.dart';
import 'package:login/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Cachehelper.inti();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    bool isloged = Cachehelper.containkey(key: 'email');
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        Home.routename: (context) => const Home(),
        LoginScreen.routename: (context) => const LoginScreen(),
      },
      initialRoute: isloged ? Home.routename : LoginScreen.routename,
    );
  }
}
