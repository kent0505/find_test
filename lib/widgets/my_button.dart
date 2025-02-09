import 'package:flutter/material.dart';

import 'btn.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.title,
    this.active = true,
    required this.onPressed,
  });

  final String title;
  final bool active;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: 50,
      width: 250,
      decoration: BoxDecoration(
        color: Color(0xff5D2B67),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Btn(
        onPressed: active ? onPressed : null,
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              color: active ? Colors.white : Colors.black,
              fontSize: 30,
              fontFamily: 'w400',
            ),
          ),
        ),
      ),
    );
  }
}
