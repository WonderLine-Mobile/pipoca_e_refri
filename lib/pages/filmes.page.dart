import 'package:flutter/material.dart';

import '../layout.dart';

class FilmePage extends StatelessWidget {
  static String tag = 'filme.page';
  final int pageKey = 1;

  @override
  Widget build(BuildContext context) {
    final content = Text("Pagina de Filmes");

    return Layout.getContent(context, content, pageKey);
  }
}
