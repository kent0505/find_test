import 'package:flutter/material.dart';

import '../widgets/scaffold2.dart';
import '../widgets/title_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold2(
      body: Column(
        children: [
          TitleWidget(title: 'SETTINGS'),
        ],
      ),
    );
  }
}
