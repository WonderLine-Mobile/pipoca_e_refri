import 'package:flutter/material.dart';

import '../layout.dart';

class SeriePage extends StatelessWidget {
  static String tag = 'serie.page';
  final int pageKey = 2;

  @override
  Widget build(BuildContext context) {
    final content = Text("Pagina de Series");

    return Layout.getContent(context, content, pageKey);
  }
}
