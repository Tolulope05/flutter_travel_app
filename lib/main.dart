import 'package:flutter/material.dart';

import './pages/detail_page.dart';
import './pages/navpages/main_page.dart';
import './pages/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: WelcomePage(),
      // home: const MainPage(),
      home: const DetailPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
