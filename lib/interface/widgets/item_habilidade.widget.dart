import 'package:flutter/material.dart';
import 'package:portfolio/domain/tema.dart';
import 'package:portfolio/interface/widgets/svg.widget.dart';
import 'package:portfolio/interface/widgets/texto.widget.dart';

class ItemHabilidadeWidget extends StatefulWidget {
  final Tema tema;
  final String nomeSvg;
  final String nomeTecnologia;
  final String descricao;

  const ItemHabilidadeWidget({
    super.key,
    required this.nomeSvg,
    required this.nomeTecnologia,
    required this.descricao,
    required this.tema,
  });

  @override
  State<ItemHabilidadeWidget> createState() => _ItemHabilidadeWidgetState();
}

class _ItemHabilidadeWidgetState extends State<ItemHabilidadeWidget> {
  bool _selecionado = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _selecionado = !_selecionado),
      child: Container(
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.tema.espacamento * 3),
        ),
        child: MouseRegion(
          onEnter: (e) => setState(() => _selecionado = true),
          onExit: (e) => setState(() => _selecionado = false),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius:
                    BorderRadius.circular(widget.tema.espacamento * 2),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 184,
                      width: 300,
                      decoration: BoxDecoration(
                        color: _selecionado ?Color(widget.tema.base100).withOpacity(.4) :Color(widget.tema.base100),
                        borderRadius:
                            BorderRadius.circular(widget.tema.espacamento * 2),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: widget.tema.espacamento * 2,
                        horizontal: widget.tema.espacamento * 2,
                      ),
                      child: Container(
                        constraints: const BoxConstraints(maxWidth: 100),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgWidget(
                                    nomeSvg: widget.nomeSvg,
                                    altura: 50,
                                    largura: 50,
                                    cor: Color(widget.tema.primary),
                                  ),
                                  SizedBox(height: widget.tema.espacamento * 2),
                                  TextoWidget(
                                    texto: widget.nomeTecnologia,
                                    cor: Color(widget.tema.primary),
                                    maxLines: 2,
                                    tamanho: 14,
                                    weight: FontWeight.w600,
                                    align: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: widget.tema.espacamento),
                            Expanded(
                              child: TextoWidget(
                                texto: widget.descricao,
                                align: TextAlign.left,
                                cor:Color(widget.tema.baseContent),
                                maxLines: 100,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // AnimatedOpacity(
                    //   duration: const Duration(milliseconds: 500),
                    //   opacity: _selecionado ? 1 : 0,
                    //   child: Container(
                    //     padding: EdgeInsets.symmetric(
                    //         horizontal: widget.tema.espacamento),
                    //     constraints: BoxConstraints(
                    //       maxWidth: largura <= 550 ? 240 : 200,
                    //     ),
                    //     child: TextoWidget(
                    //       align: TextAlign.center,
                    //       texto: widget.descricao,
                    //       cor: Color(widget.tema.accent),
                    //       maxLines: 8,
                    //     ),
                    //   ),
                    // ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        height: 5,
                        width: 500,
                        color: Color(widget.tema.primary),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
