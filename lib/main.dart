import 'package:flutter/material.dart';
import 'package:learn30/screen/Movies_page.dart';
import 'package:learn30/screen/home_page.dart';
import 'package:learn30/screen/iteams_page.dart';
import 'package:learn30/screen/login_page.dart';
import 'package:learn30/utils/routes.dart';
import 'package:learn30/widgets/themes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Learn Flutter',
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      home: const HomePage(),
      routes: {
        MyRoutes.loginRoute: (context) => const LoginPage(),
        MyRoutes.homeRoute: (context) => const HomePage(),
        MyRoutes.itemRoutes: (context) => const IteamsPage(),
        MyRoutes.movieRoutes: (context) => const MoviesPage(),
      },
    );
  }
}
