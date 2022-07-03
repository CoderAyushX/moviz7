import 'package:crud/pages/home.dart';
import 'package:crud/pages/notification.dart';
import 'package:crud/pages/song_details.dart';
import 'package:crud/pages/post_songs.dart';
import 'package:crud/pages/search_songs.dart';
import 'package:crud/utils/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'notificationservice/local_notification_service.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  LocalNotificationService.initialize();
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
        GetPage(name: '/postasong', page: () => PostASong()),
        GetPage(name: '/notification', page: () => const NotificationScreen())
      ],
      transitionDuration: const Duration(milliseconds: 500),
    );
  }
}
