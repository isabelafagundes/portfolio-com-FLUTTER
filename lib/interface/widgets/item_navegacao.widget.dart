import 'package:flutter/material.dart';
import 'package:portfolio/interface/constant.dart';
import 'package:portfolio/domain/tema.dart';
import 'package:portfolio/interface/widgets/botao_icone_navegacao.widget.dart';
import 'package:portfolio/interface/widgets/svg.widget.dart';

class ItemNavegacaoWidget extends StatelessWidget {
  final Tema tema;
  final String menuSelecionado;
  final String svgNome;
  final String nomeItem;
  final bool ativado;
  final Function() callback;

  const ItemNavegacaoWidget({
    super.key,
    required this.menuSelecionado,
    required this.svgNome,
    required this.nomeItem,
    required this.callback,
    required this.tema,
    required this.ativado,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.center,
        children: [
          if (menuSelecionado == nomeItem)
            Positioned(
              left: null,
              bottom: -40,
              child: Container(
                color: kCinza,
                padding: EdgeInsets.symmetric(
                  vertical: tema.espacamento / 4,
                  horizontal: tema.espacamento,
                ),
                child: Text(
                  nomeItem,
                  style: TextStyle(
                    color: Color(tema.accent),
                  ),
                ),
              ),
            ),
          BotaoIconeNavegacaoWidget(
            tema: tema,
            svgNome: svgNome,
            borda: false,
            callback: callback,
          ),
          if (ativado)
            Positioned(
              bottom: 0,
              child: SvgWidget(
                nomeSvg: "star",
                altura: 8,
                cor: Color(tema.primary),
              ),
            ),
        ],
      ),
    );
  }
}
