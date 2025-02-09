import 'package:flutter/material.dart';

import '../widgets/main_button.dart';
import '../widgets/scaffold2.dart';
import '../widgets/title_widget.dart';
import 'privacy_screen.dart';
import 'terms_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold2(
      body: Column(
        children: [
          TitleWidget(title: 'SETTINGS'),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MainButton(
                  title: 'TERMS OF USE',
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return TermsScreen();
                      },
                    ));
                  },
                ),
                SizedBox(height: 40),
                MainButton(
                  title: 'PRIVACY POLICY',
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return PrivacyScreen();
                      },
                    ));
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
