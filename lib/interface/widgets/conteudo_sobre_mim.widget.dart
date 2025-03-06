import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/domain/tema.dart';
import 'package:portfolio/interface/util/responsive.dart';
import 'package:portfolio/interface/widgets/botao_icone.widget.dart';
import 'package:portfolio/interface/widgets/texto.widget.dart';

class ConteudoSobreMimWidget extends StatefulWidget {
  final Tema tema;

  const ConteudoSobreMimWidget({
    super.key,
    required this.tema,
  });

  @override
  State<ConteudoSobreMimWidget> createState() => _ConteudoSobreMimWidgetState();
}

class _ConteudoSobreMimWidgetState extends State<ConteudoSobreMimWidget> {
  bool exibirTexto = true;
  int indice = 0;
  String texto = "Olá, eu sou a Isabela Fagundes";

  void resetarAnimacao() async {
    setState(() {
      exibirTexto = false;
      texto = "";
    });
    await Future.delayed(const Duration(milliseconds: 1000));
    setState(() {
      exibirTexto = true;
      texto = "Olá, eu sou a Isabela Fagundes";
    });
  }

  @override
  Widget build(BuildContext context) {
    double altura = MediaQuery.of(context).size.height;
    double largura = MediaQuery.of(context).size.width;
    bool isSmallScreen = MediaQuery.of(context).size.width <= 1200;
    return Expanded(
      child: Container(
        height:isSmallScreen ? null : altura-34,
        width: largura,
        decoration: BoxDecoration(
          color: Color(widget.tema.base100),
        ),
        padding: EdgeInsets.only(top: isSmallScreen ? 40 : 0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              child: Container(
                constraints: const BoxConstraints(
                  maxWidth: 900,
                ),
                child: Flex(
                  direction: isSmallScreen ? Axis.vertical : Axis.horizontal,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: Responsive.mobile(context) ? 50 : 100),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.all(widget.tema.espacamento),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(200),
                            color: Color(widget.tema.accent),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(200),
                            child: Container(
                              height: Responsive.tablet(context) ? 250 : 450,
                              decoration: BoxDecoration(
                                color: Color(widget.tema.primary),
                              ),
                              child: Image.asset(
                                "assets/isabela.png",
                                height: Responsive.tablet(context) ? 200 : 400,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: widget.tema.espacamento * 10, height:widget.tema.espacamento * 4 ),
                    Flexible(
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: widget.tema.espacamento * 4),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                for (indice = 0; indice < texto.length; indice++)
                                  TextoWidget(texto: texto[indice], tamanho: 20, cor: Colors.white).animate(
                                      onComplete: (controller) {
                                    if (indice == texto.length - 1) resetarAnimacao();
                                  }).fade(
                                    delay: Duration(
                                      milliseconds: 100 * indice,
                                    ),
                                  ),
                              ],
                            ),
                            SizedBox(height: widget.tema.espacamento * 2),
                            Container(
                              constraints: const BoxConstraints(maxWidth: 550),
                              child: TextoWidget(
                                maxLines: 10,
                                tamanho: widget.tema.espacamento * 2,
                                texto:
                                    "Desenvolvedora full-stack com experiência no desenvolvimento de aplicações completas, sempre focando em performance, escalabilidade e usabilidade. Estou disponível para projetos freelancer, entre em contato para trabalharmos juntos!",
                                cor: Colors.white,
                              ),
                            ),
                            SizedBox(height: widget.tema.espacamento * 4),
                            Align(
                              alignment: AlignmentDirectional.centerStart,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  BotaoIconeWidget(
                                    tema: widget.tema,
                                    svgNome: 'email',
                                    callback: () {},
                                  ),
                                  SizedBox(width: widget.tema.espacamento * 2),
                                  BotaoIconeWidget(
                                    tema: widget.tema,
                                    svgNome: 'linkedin',
                                    callback: () {},
                                  ),
                                  SizedBox(width: widget.tema.espacamento * 2),
                                  BotaoIconeWidget(tema: widget.tema, svgNome: 'github', callback: () {}),
                                ],
                              ),
                            ),
                            SizedBox(height: widget.tema.espacamento * 5),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
