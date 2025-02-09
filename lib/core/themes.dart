import 'package:flutter/material.dart';

final theme = ThemeData(
  useMaterial3: false,
  brightness: Brightness.dark,

  // colorScheme: ColorScheme.fromSwatch(
  //   accentColor: AppColors.main, // overscroll indicator color
  // ),

  // DIALOG
  dialogTheme: const DialogTheme(
    insetPadding: EdgeInsets.zero,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(24)),
    ),
  ),
);
