import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/domain/tema.dart';
import 'package:portfolio/interface/util/responsive.dart';
import 'package:portfolio/interface/widgets/efeito_glass.widget.dart';
import 'package:portfolio/interface/widgets/item_navegacao.widget.dart';
import 'package:portfolio/interface/widgets/texto.widget.dart';

class NavegacaoWidget extends StatefulWidget {
  final Tema tema;
  final BuildContext context;
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
    required this.context,
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
          border: Border.all(
            color: Color(widget.tema.primary).withOpacity(.2),
            width: 2,
          ),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(widget.tema.accent).withOpacity(.7),
              Color(widget.tema.secondary).withOpacity(.4),
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
              texto: "if",
              fontFamily: 'Shrikhand',
              cor: Color(widget.tema.primary),
              tamanho: widget.tema.espacamento * 4,
            ),
            SizedBox(
              width: widget.tema.espacamento * 6,
            ),
            Flexible(
              child: MouseRegion(
                onEnter: (e) => setState(() => menuSelecionado = "Início"),
                onExit: (e) => setState(() => menuSelecionado = ""),
                child: ItemNavegacaoWidget(
                  tema: widget.tema,
                  callback: widget.callbackHome,
                  ativado: AutoRouter.of(widget.context).current.path.contains('home'),
                  menuSelecionado: menuSelecionado,
                  svgNome: 'home',
                  nomeItem: 'Início',
                ),
              ),
            ),
            SizedBox(
              height: isMobile ? widget.tema.espacamento : widget.tema.espacamento * 2,
              width: widget.tema.espacamento * 3,
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
                  ativado: AutoRouter.of(widget.context).current.path.contains('sobre-mim'),
                  nomeItem: 'Sobre mim',
                ),
              ),
            ),
            SizedBox(
              height: isMobile ? widget.tema.espacamento : widget.tema.espacamento * 2,
              width: widget.tema.espacamento * 3,
            ),
            Flexible(
              child: MouseRegion(
                onEnter: (e) => setState(() => menuSelecionado = "Projetos"),
                onExit: (e) => setState(() => menuSelecionado = ""),
                child: ItemNavegacaoWidget(
                  tema: widget.tema,
                  callback: widget.callbackProjetos,
                  menuSelecionado: menuSelecionado,
                  ativado: AutoRouter.of(widget.context).current.path.contains('projetos'),
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
