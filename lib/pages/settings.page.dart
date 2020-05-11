import 'package:flutter/material.dart';

import '../layout.dart';

class SettingsPage extends StatelessWidget {
  static String tag = 'settings.page';
  final int pageKey = 3;

  @override
  Widget build(BuildContext context) {
    final content = Text("Pagina de Configuração");

    return Layout.getContent(context, content, pageKey);
  }
}
