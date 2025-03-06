import 'package:flutter/material.dart';
import 'package:portfolio/domain/tema.dart';

class BotaoPadraoWidget extends StatelessWidget {
  final Tema tema;
  final String texto;
  final Function() callback;
  final bool borderOnly;
  final Widget? icone;

  const BotaoPadraoWidget({
    super.key,
    required this.texto,
    required this.callback,
    required this.borderOnly,
    this.icone,
    required this.tema,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callback,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: tema.espacamento,
          horizontal: tema.espacamento * 3,
        ),
        decoration: BoxDecoration(
          color: borderOnly ? Colors.transparent : Color(tema.accent),
          border: Border.all(color: Color(tema.accent), width: 2),
          borderRadius: BorderRadius.circular(tema.espacamento * 4),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding:
                  EdgeInsets.only(right: icone == null ? 0 : tema.espacamento * 2),
              child: icone ?? const SizedBox(),
            ),
            Text(
              texto,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: tema.espacamento * 2,
                color: Color(tema.accent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
