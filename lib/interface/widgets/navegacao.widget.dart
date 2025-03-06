import 'package:flutter/material.dart';
import 'package:portfolio/domain/tema.dart';
import 'package:portfolio/interface/util/responsive.dart';
import 'package:portfolio/interface/widgets/efeito_glass.widget.dart';
import 'package:portfolio/interface/widgets/item_navegacao.widget.dart';
import 'package:portfolio/interface/widgets/texto.widget.dart';

class NavegacaoWidget extends StatefulWidget {
  final Tema tema;
  final Function() callbackHome;
  final Function() callbackSobreMim;
  final Function() callbackHabilidades;
  final Function() callbackProjetos;

  const NavegacaoWidget({
    super.key,
    required this.callbackHome,
    required this.callbackSobreMim,
    required this.callbackHabilidades,
    required this.callbackProjetos,
    required this.tema,
  });

  @override
  State<NavegacaoWidget> createState() => _NavegacaoWidgetState();
}

class _NavegacaoWidgetState extends State<NavegacaoWidget> {
  String menuSelecionado = "";

  @override
  Widget build(BuildContext context) {
    bool isMobile = Responsive.larguraTela(context) <= 640;
    return EfeitoGlassWidget(
      radius: BorderRadius.circular(widget.tema.borderRadiusP + 4),
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: widget.tema.espacamento,
          horizontal: widget.tema.espacamento * 2,
        ),
        decoration: BoxDecoration(
          color: Color(widget.tema.primary),
          borderRadius: BorderRadius.circular(widget.tema.borderRadiusP + 4),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(widget.tema.primary).withOpacity(.7),
              Color(widget.tema.primary).withOpacity(.4),
              // Cor final
            ],
            stops: const [0.0, 1.0],
          ),
        ),
        child: Flex(
          direction: Axis.horizontal,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextoWidget(
              texto: "IF.",
              fontFamily: 'Aboreto',
              cor: Color(widget.tema.base100),
              tamanho: widget.tema.espacamento * 4,
            ),
            SizedBox(
              width: widget.tema.espacamento * 5,
            ),
            Flexible(
              child: MouseRegion(
                onEnter: (e) => setState(() => menuSelecionado = "Início"),
                onExit: (e) => setState(() => menuSelecionado = ""),
                child: ItemNavegacaoWidget(
                  tema: widget.tema,
                  callback: widget.callbackHome,
                  menuSelecionado: menuSelecionado,
                  svgNome: 'home',
                  nomeItem: 'Início',
                ),
              ),
            ),
            SizedBox(
              height: isMobile
                  ? widget.tema.espacamento
                  : widget.tema.espacamento * 2,
              width: widget.tema.espacamento * 2,
            ),
            Flexible(
              child: MouseRegion(
                onEnter: (e) => setState(() => menuSelecionado = "Sobre mim"),
                onExit: (e) => setState(() => menuSelecionado = ""),
                child: ItemNavegacaoWidget(
                  tema: widget.tema,
                  callback: widget.callbackSobreMim,
                  menuSelecionado: menuSelecionado,
                  svgNome: 'user',
                  nomeItem: 'Sobre mim',
                ),
              ),
            ),
            SizedBox(
              height: isMobile
                  ? widget.tema.espacamento
                  : widget.tema.espacamento * 2,
              width: widget.tema.espacamento * 2,
            ),
            Flexible(
              child: MouseRegion(
                onEnter: (e) => setState(() => menuSelecionado = "Habilidades"),
                onExit: (e) => setState(() => menuSelecionado = ""),
                child: ItemNavegacaoWidget(
                  tema: widget.tema,
                  callback: widget.callbackHabilidades,
                  menuSelecionado: menuSelecionado,
                  svgNome: 'identification',
                  nomeItem: 'Habilidades',
                ),
              ),
            ),
            SizedBox(
              height: isMobile
                  ? widget.tema.espacamento
                  : widget.tema.espacamento * 2,
              width: widget.tema.espacamento * 2,
            ),
            Flexible(
              child: MouseRegion(
                onEnter: (e) => setState(() => menuSelecionado = "Projetos"),
                onExit: (e) => setState(() => menuSelecionado = ""),
                child: ItemNavegacaoWidget(
                  tema: widget.tema,
                  callback: widget.callbackProjetos,
                  menuSelecionado: menuSelecionado,
                  svgNome: 'cmd',
                  nomeItem: 'Projetos',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
