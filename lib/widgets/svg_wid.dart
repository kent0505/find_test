import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgWid extends StatelessWidget {
  const SvgWid(
    this.asset, {
    super.key,
    this.height,
    this.color,
    this.fit = BoxFit.contain,
  });

  final String asset;
  final double? height;

  final Color? color;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      asset,
      height: height,
      fit: fit,
      colorFilter: color != null
          ? ColorFilter.mode(
              color!,
              BlendMode.srcIn,
            )
          : null,
    );
  }
}
