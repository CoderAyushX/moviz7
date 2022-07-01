import 'package:crud/pages/home.dart';
import 'package:crud/pages/movies_details.dart';
import 'package:crud/pages/post_movie.dart';
import 'package:crud/pages/search_movie.dart';
import 'package:crud/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  //* This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'YepHow7',
      debugShowCheckedModeBanner: false,
      theme: MyTheme.lightTheme(context),
      themeMode: ThemeMode.light,
      home: const Home(),
      //* routes
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => const Home()),
        GetPage(name: '/moviedetails', page: () => const MovieDetails()),
        GetPage(name: '/search', page: () => SearchResullt()),
        GetPage(name: '/postamovie', page: () => PostAMovie())
      ],
      transitionDuration: const Duration(milliseconds: 500),
    );
  }
}
