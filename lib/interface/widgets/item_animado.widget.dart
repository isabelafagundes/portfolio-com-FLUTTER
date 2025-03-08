import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ItemAnimadoWidget extends StatefulWidget {
  final Widget child;
  final Duration? delay;

  const ItemAnimadoWidget({
    super.key,
    required this.child,
    this.delay,
  });

  @override
  State<ItemAnimadoWidget> createState() => _ItemAnimadoWidgetState();
}

class _ItemAnimadoWidgetState extends State<ItemAnimadoWidget> {
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: UniqueKey(),
      onVisibilityChanged: (info) {
        if (info.visibleFraction > 0.1 && !_isVisible) {
          setState(() => _isVisible = true);
        }
      },
      child: Animate(
        effects: [
          FadeEffect(duration: 600.ms),
          SlideEffect(begin: const Offset(0, 0.2), duration: 600.ms, curve: Curves.easeOut),
        ],
        delay: widget.delay ?? const Duration(milliseconds: 500),
        autoPlay: _isVisible,
        child: widget.child,
      ),
    );
  }
}