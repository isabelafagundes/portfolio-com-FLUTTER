import 'package:flutter/material.dart';
import 'package:portfolio/domain/tema.dart';

class SwitcherWidget extends StatefulWidget {
  final Tema tema;
  final Function() aoClicar;
  final bool valorInicial;
  final bool? valor;
  final Color? corFundo;
  final Color? corCirculo;
  final bool comInnerShadow;
  final Color? corSombra;
  final Color? corBorda;
  final Widget? iconeAtivado;
  final Widget? iconeDesativado;

  const SwitcherWidget({
    super.key,
    required this.tema,
    required this.aoClicar,
    this.valorInicial = false,
    this.corFundo,
    this.corCirculo,
    this.comInnerShadow = false,
    this.corSombra,
    this.corBorda,
    this.iconeAtivado,
    this.iconeDesativado,
    this.valor,
  });

  @override
  State<SwitcherWidget> createState() => _SwitcherWidgetState();
}

class _SwitcherWidgetState extends State<SwitcherWidget> {
  bool _ativado = false;

  bool get ativado => widget.valor != null ? widget.valor! && _ativado : _ativado;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      _ativado = widget.valorInicial;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(widget.tema.borderRadiusXG),
        child: Stack(
          alignment: Alignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() => _ativado = !_ativado);
                widget.aoClicar();
              },
              child: Container(
                clipBehavior: Clip.antiAlias,
                padding: const EdgeInsets.all(3),
                decoration: widget.comInnerShadow
                    ? BoxDecoration(
                        color: widget.corSombra ?? Color(widget.tema.accent),
                        borderRadius: BorderRadius.circular(widget.tema.borderRadiusXG),
                        border: Border.all(
                          color: widget.corBorda ?? Color(widget.tema.accent).withOpacity(.3),
                          width: 3,
                        ),
                      )
                    : BoxDecoration(
                        color: ativado
                            ? widget.corBorda ?? Color(widget.tema.accent)
                            : widget.corFundo ?? Color(widget.tema.base200),
                        borderRadius: BorderRadius.circular(widget.tema.borderRadiusXG),
                        border: Border.all(
                          color: widget.corBorda ?? Color(widget.tema.accent),
                          width: 2,
                        ),
                      ),
                child: Container(
                  width: 45,
                  height: 18,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(widget.tema.borderRadiusXG),
                    boxShadow: [
                      BoxShadow(
                        color: ativado
                            ? widget.corBorda ?? Color(widget.tema.accent)
                            : widget.corFundo ?? Color(widget.tema.base200),
                        spreadRadius: 5,
                        blurRadius: 5,
                        // ignore: prefer_const_constructors
                        offset: Offset(0, 1),
                      )
                    ],
                  ),
                ),
              ),
            ),
            AnimatedPositioned(
              left: ativado ? 32 : 4,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOut,
              child: AnimatedContainer(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(widget.tema.borderRadiusXG),
                  color: !ativado
                      ? widget.corBorda ?? Color(widget.tema.accent)
                      : widget.corCirculo ?? Color(widget.tema.base200),
                  border: Border.all(
                    color: widget.corBorda ?? Color(widget.tema.neutral).withOpacity(.1),
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(widget.tema.neutral).withOpacity(.15),
                      blurRadius: 2,
                      // ignore: prefer_const_constructors
                      offset: Offset(0, 2),
                    )
                  ],
                ),
                duration: const Duration(milliseconds: 200),
                child: ativado ? widget.iconeAtivado ?? const SizedBox() : widget.iconeDesativado ?? const SizedBox(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
