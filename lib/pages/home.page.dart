import 'package:flutter/material.dart';
import 'package:listafilmes/layout.dart';
import 'package:listafilmes/widgets/list-view.widget.dart';

class HomePage extends StatefulWidget {
  static String tag = 'home.page';
  @override
  _HomePageState createState() => _HomePageState();

  static List list = List();
}

class _HomePageState extends State<HomePage> {
  final int pageKey = 0;

  @override
  Widget build(BuildContext context) {
    return Layout.getContent(context, content, pageKey);
  }

  final content = ListViewApp(
    list: HomePage.list,
  );
  //
}
