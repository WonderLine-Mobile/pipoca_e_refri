import 'package:flutter/material.dart';

import 'pages/filmes.page.dart';
import 'pages/home.page.dart';
import 'pages/series.page.dart';
import 'pages/settings.page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme: ThemeData(
        backgroundColor: Colors.black54,
      ),
      routes: {
        FilmePage.tag: (context) => FilmePage(),
        SeriePage.tag: (context) => SeriePage(),
        SettingsPage.tag: (context) => SettingsPage(),
      },
    );
  }
}
