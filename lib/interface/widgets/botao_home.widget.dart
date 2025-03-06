import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/domain/tema.dart';

class BotaoHomeWidget extends StatefulWidget {
  final Tema tema;
  final Function() callback;
  final Color? corFundo;
  final Color? corBorda;
  final String label;

  const BotaoHomeWidget({
    super.key,
    required this.tema,
    this.corFundo,
    this.corBorda,
    required this.label,
    required this.callback,
  });

  @override
  State<BotaoHomeWidget> createState() => _BotaoHomeWidgetState();
}

class _BotaoHomeWidgetState extends State<BotaoHomeWidget> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return Animate(
      target: _hover ? 1 : 0,
      effects: const [
        ScaleEffect(
          duration: Duration(milliseconds: 200),
          curve: Curves.easeInOut,
          alignment: Alignment.center,
          begin: Offset(1, 1),
          end: Offset(.95, .95),
        ),
        ShimmerEffect(
          duration: Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        )
      ],
      child: MouseRegion(
        onEnter: (e) => setState(() => _hover = true),
        onExit: (e) => setState(() => _hover = false),
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: widget.callback,
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: widget.tema.espacamento,
              horizontal: widget.tema.espacamento * 3,
            ),
            decoration: BoxDecoration(
              color: widget.corFundo ?? Color(widget.tema.accent),
              border: Border.all(color: widget.corBorda ?? Color(widget.tema.neutral).withOpacity(.1), width: 2),
              boxShadow: [
                BoxShadow(
                  color: Color(widget.tema.neutral).withOpacity(.1),
                  offset: const Offset(0, 2),
                  blurRadius: 3,
                ),
              ],
              borderRadius: BorderRadius.circular(
                widget.tema.espacamento * 4,
              ),
            ),
            child: Text(
              widget.label,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: widget.tema.espacamento * 2,
                color: Color(widget.tema.baseContent),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
