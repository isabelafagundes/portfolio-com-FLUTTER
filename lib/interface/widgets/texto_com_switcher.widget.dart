import 'package:flutter/material.dart';
import 'package:portfolio/domain/tema.dart';
import 'package:portfolio/interface/widgets/texto.widget.dart';

import 'switcher.widget.dart';

class TextoComSwitcherWidget extends StatelessWidget {
  final Tema tema;
  final bool exibirLabel;
  final String label;
  final Widget primeiroIcone;
  final Widget segundoIcone;
  final bool valorInicial;
  final Function() aoAlterar;

  const TextoComSwitcherWidget({
    super.key,
    required this.tema,
    required this.exibirLabel,
    required this.label,
    required this.primeiroIcone,
    required this.segundoIcone,
    required this.aoAlterar,
    this.valorInicial = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      padding: EdgeInsets.symmetric(horizontal: tema.espacamento * 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (exibirLabel) ...[
            Expanded(
              child: TextoWidget(
                texto: label,
                tamanho: tema.tamanhoFonteP +2,
                cor: Color(tema.baseContent),
              ),
            ),
          ],
          SwitcherWidget(
            tema: tema,
            valorInicial: valorInicial,
            iconeAtivado: primeiroIcone,
            iconeDesativado: segundoIcone,
            aoClicar: aoAlterar,
          ),
        ],
      ),
    );
  }
}
