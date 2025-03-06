import 'package:flutter/material.dart';
import 'package:portfolio/interface/constant.dart';
import 'package:portfolio/domain/tema.dart';
import 'package:portfolio/interface/widgets/botao_icone_navegacao.widget.dart';
import 'package:portfolio/interface/widgets/svg.widget.dart';
import 'package:portfolio/interface/widgets/texto.widget.dart';

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
          Column(
            children: [
              BotaoIconeNavegacaoWidget(
                tema: tema,
                svgNome: svgNome,
                borda: false,
                callback: callback,
              ),
              TextoWidget(
                texto: nomeItem,
                tamanho: tema.tamanhoFonteP,
                weight: FontWeight.w500,
                cor: Color(tema.primary),
              ),
              Visibility.maintain(
                visible: ativado,
                child: SvgWidget(
                  nomeSvg: "star",
                  altura: 8,
                  cor: Color(tema.primary),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
