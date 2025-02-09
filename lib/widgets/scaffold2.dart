import 'package:flutter/material.dart';

class Scaffold2 extends StatelessWidget {
  const Scaffold2({super.key, required this.body});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/bg1.png',
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Container(color: Color(0xff39244B).withValues(alpha: 0.8)),
          body,
        ],
      ),
    );
  }
}
