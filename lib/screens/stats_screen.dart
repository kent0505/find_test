import 'package:flutter/material.dart';

import '../widgets/scaffold2.dart';
import '../widgets/title_widget.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold2(
      body: Column(
        children: [
          TitleWidget(title: 'STATS'),
        ],
      ),
    );
  }
}
