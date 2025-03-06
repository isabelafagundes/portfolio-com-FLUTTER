import 'dart:ui';

import 'package:flutter/material.dart';

class EfeitoGlassWidget extends StatelessWidget {
  final Widget child;
  final BorderRadius radius;
  final double valorBlur;

  const EfeitoGlassWidget({
    super.key,
    required this.child,
    this.radius = BorderRadius.zero,
    this.valorBlur = 5,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: radius,
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: valorBlur,
          sigmaY: valorBlur,
        ),
        child: child,
      ),
    );
  }
}
