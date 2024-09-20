import 'package:flutter/material.dart';
import 'package:login/database/cache_helper.dart';

class Home extends StatefulWidget {
  static String routename = 'home';
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('welcome${Cachehelper.getdata(key: 'email')}'),
      ),
    );
  }
}
