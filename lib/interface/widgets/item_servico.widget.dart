import 'package:flutter/material.dart';
import 'package:portfolio/domain/tema.dart';
import 'package:portfolio/interface/widgets/svg.widget.dart';
import 'package:portfolio/interface/widgets/texto.widget.dart';

class ItemServicoWidget extends StatefulWidget {
  final Tema tema;
  final String nomeSvg;
  final String nomeServico;
  final String descricao;

  const ItemServicoWidget({
    super.key,
    required this.nomeSvg,
    required this.nomeServico,
    required this.descricao,
    required this.tema,
  });

  @override
  State<ItemServicoWidget> createState() => _ItemServicoWidgetState();
}

class _ItemServicoWidgetState extends State<ItemServicoWidget> {
  bool _selecionado = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => _selecionado = !_selecionado),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: _selecionado
                ? Color(widget.tema.primary).withOpacity(.4)
                : Color(widget.tema.primary),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(widget.tema.espacamento * 2),
        ),
        child: MouseRegion(
          onEnter: (e) => setState(() => _selecionado = true),
          onExit: (e) => setState(() => _selecionado = false),
          child: Container(
            decoration: BoxDecoration(
              color: _selecionado ?Color(widget.tema.base200).withOpacity(.4) :Color(widget.tema.base200),
              borderRadius:
                  BorderRadius.circular(widget.tema.espacamento * 2),
            ),
            padding: EdgeInsets.symmetric(
              vertical: widget.tema.espacamento * 2,
              horizontal: widget.tema.espacamento * 2,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgWidget(
                      nomeSvg: widget.nomeSvg,
                      altura: 80,
                      largura: 80,
                      cor: Color(widget.tema.primary),
                    ),
                    SizedBox(height: widget.tema.espacamento * 2),
                    TextoWidget(
                      texto: widget.nomeServico,
                      cor: Color(widget.tema.primary),
                      maxLines: 2,
                      tamanho: widget.tema.tamanhoFonteXG,
                      weight: FontWeight.w600,
                      align: TextAlign.center,
                    ),
                  ],
                ),
                SizedBox(height: widget.tema.espacamento *2),
                TextoWidget(
                  texto: widget.descricao,
                  align: TextAlign.center,
                  cor:Color(widget.tema.baseContent),
                  maxLines: 100,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
