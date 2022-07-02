import 'package:crud/pages/home.dart';
import 'package:crud/pages/song_details.dart';
import 'package:crud/pages/post_songs.dart';
import 'package:crud/pages/search_songs.dart';
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
        GetPage(name: '/songsdetails', page: () => const MovieDetails()),
        GetPage(name: '/search', page: () => SearchResult()),
        GetPage(name: '/postasong', page: () => PostASong())
      ],
      transitionDuration: const Duration(milliseconds: 500),
    );
  }
}
