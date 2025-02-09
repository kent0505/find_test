import 'package:flutter/material.dart';

import '../widgets/scaffold2.dart';
import '../widgets/title_widget.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold2(
      body: Column(
        children: [
          TitleWidget(title: 'SHOP'),
        ],
      ),
    );
  }
}
