import 'package:flutter/material.dart';
import 'profileScreen.dart';

import 'pScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My App',
        initialRoute: '/home',
        routes: {
          '/home': (context) => ProfileScreen(),
          '/profile': (context) => PScreen(),
        });
  }
}
