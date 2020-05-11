import 'package:flutter/material.dart';
import 'package:listafilmes/class/constants.dart';

import 'pages/filmes.page.dart';
import 'pages/home.page.dart';
import 'pages/series.page.dart';
import 'pages/settings.page.dart';

class Layout {
  static final pages = [
    HomePage.tag,
    FilmePage.tag,
    SeriePage.tag,
    SettingsPage.tag,
  ];

  static Scaffold getContent(
      BuildContext context, dynamic content, int pageKey) {
    Color greenColor = Color(0xFF368B61);
    return Scaffold(
      appBar: AppBar(
        leading: (Navigator.canPop(context))
            ? IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed: () {
                  Navigator.popUntil(context, ModalRoute.withName("/"));
                },
              )
            : null,
        backgroundColor: greenColor,
        title: Center(
          child: Text('Lista de Filmes'),
        ),
        actions: <Widget>[
          PopupMenuButton<String>(
            icon: Icon(Icons.menu),
            onSelected: (String s) {
              List<String> listChoic = Constants.choices;

              if (s == listChoic[0] && pageKey != 1) {
                Navigator.of(context).pushNamed(pages[1]);
              } else if (s == listChoic[1] && pageKey != 2) {
                Navigator.of(context).pushNamed(pages[2]);
              } else if (s == listChoic[2] && pageKey != 3) {
                Navigator.of(context).pushNamed(pages[3]);
              }
            },
            itemBuilder: (BuildContext context) {
              return Constants.choices.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: content,
    );
  }
}
