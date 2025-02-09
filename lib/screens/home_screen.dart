import 'package:flutter/material.dart';

import '../widgets/main_button.dart';
import '../widgets/scaffold2.dart';
import 'play_screen.dart';
import 'settings_screen.dart';
import 'shop_screen.dart';
import 'stats_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold2(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MainButton(
              title: 'PLAY',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return PlayScreen();
                  },
                ));
              },
            ),
            SizedBox(height: 40),
            MainButton(
              title: 'SHOP',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return ShopScreen();
                  },
                ));
              },
            ),
            SizedBox(height: 40),
            MainButton(
              title: 'STATS',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return StatsScreen();
                  },
                ));
              },
            ),
            SizedBox(height: 40),
            MainButton(
              title: 'SETTINGS',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return SettingsScreen();
                  },
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
