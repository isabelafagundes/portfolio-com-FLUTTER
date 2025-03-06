import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:portfolio/domain/tema.dart';
import 'package:portfolio/interface/util/responsive.dart';

class BotaoIconeNavegacaoWidget extends StatefulWidget {
  final Tema tema;
  final String? svgNome;
  final Widget? icone;
  final Color? cor;
  final bool borda;
  final Function() callback;

  const BotaoIconeNavegacaoWidget({
    super.key,
    required this.svgNome,
    required this.callback,
    this.icone,
    this.borda = true,
    this.cor,
    required this.tema,
  });

  @override
  State<BotaoIconeNavegacaoWidget> createState() => _BotaoIconeNavegacaoWidgetState();
}

class _BotaoIconeNavegacaoWidgetState extends State<BotaoIconeNavegacaoWidget> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (e) => setState(() => _hover = true),
      onExit: (e) => setState(() => _hover = false),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.callback,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: AnimatedContainer(
            padding: EdgeInsets.all(widget.tema.espacamento * 1.2),
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: !widget.borda
                  ? null
                  : Border.all(
                      color: !_hover
                          ? Color(widget.tema.neutral).withOpacity(.1)
                          : Color(widget.tema.baseContent).withOpacity(.45),
                      width: 1,
                    ),
              borderRadius: BorderRadius.circular(50),
            ),
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeOut,
            child: widget.icone ??
                SvgPicture.asset(
                  "assets/${widget.svgNome}.svg",
                  color:
                      Color(!_hover ? widget.tema.primary : widget.tema.accent),
                  height: _obterTamanhoIcone(),
                  width: _obterTamanhoIcone(),
                ),
          ),
        ),
      ),
    ).animate(target: _hover ? 1 : 0).shimmer(
          duration: const Duration(milliseconds: 500),
        );
  }

  double _obterTamanhoIcone() {
    if (Responsive.mobile(context)) {
      return 22;
    } else if (Responsive.tablet(context)) {
      return 24;
    } else {
      return 26;
    }
  }
}
