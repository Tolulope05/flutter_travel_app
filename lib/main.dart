import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_travel_app/cubit/app_cubit.dart';
import 'package:flutter_travel_app/cubit/app_cubiy_logics.dart';

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
      home: BlocProvider<AppCubits>(
        create: ((context) {
          return AppCubits();
        }),
        child: AppCubitLogics(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
