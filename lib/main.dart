import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_travel_app/cubit/app_cubit.dart';
import 'package:flutter_travel_app/cubit/app_cubit_logics.dart';
import 'package:flutter_travel_app/services/data_services.dart';

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
          return AppCubits(data: DataServices());
        }),
        child: const AppCubitLogics(),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
