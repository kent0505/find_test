import 'package:flutter/material.dart';

import '../widgets/scaffold2.dart';
import '../widgets/title_widget.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold2(
      body: Column(
        children: [
          TitleWidget(title: 'PRIVACY POLICY'),
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(20),
              children: [
                Text(
                  'Text',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'w400',
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
