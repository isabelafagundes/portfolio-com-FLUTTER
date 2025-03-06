import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/domain/tema.dart';
import 'package:portfolio/interface/util/responsive.dart';
import 'package:portfolio/interface/widgets/svg.widget.dart';

class TituloWidget extends StatelessWidget {
  final Tema tema;
  final double tamanhoFonte;
  final String titulo;

  const TituloWidget({
    super.key,
    required this.tema,
    this.tamanhoFonte = 48,
    required this.titulo,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: tema.espacamento * 2,
      ),
      child: FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if(!Responsive.mobile(context))
            SvgWidget(
              nomeSvg: "sparkles",
              altura: tamanhoFonte - 12,
              cor: Color(tema.primary),
            )
                .animate(
                  onPlay: (controller) => controller.repeat(reverse: true),
                )
                .moveY(
                  begin: -3,
                  end: 3,
                  duration: 1.seconds,
                  curve: Curves.easeInOut,
                ),
            SizedBox(width: tema.espacamento),
            Text(
              titulo,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Shrikhand',
                fontWeight: FontWeight.w400,
                fontSize: tamanhoFonte,
                color: Color(tema.accent),
              ),
            ),
            SizedBox(width: tema.espacamento),
            SvgWidget(
              nomeSvg: "sparkles",
              altura: tamanhoFonte - 12,
              cor: Color(tema.primary),
            )
                .animate(
                  onPlay: (controller) => controller.repeat(reverse: true),
                )
                .moveY(
                  begin: 3,
                  end: -3,
                  duration: 1.seconds,
                  curve: Curves.easeInOut,
                ),
          ],
        )
            .animate(
              onComplete: (controller) => controller.repeat(),
            )
            .shimmer(
              duration: const Duration(milliseconds: 3000),
              curve: Curves.easeInOut,
              color: Color(tema.primary),
              stops: const [0.0, 0.5, 1.0],
              delay: const Duration(milliseconds: 1000),
            ),
      ),
    );
  }
}
