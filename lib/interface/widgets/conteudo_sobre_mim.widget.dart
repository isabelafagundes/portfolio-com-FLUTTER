import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/domain/tema.dart';
import 'package:portfolio/interface/util/responsive.dart';
import 'package:portfolio/interface/widgets/botao_icone.widget.dart';
import 'package:portfolio/interface/widgets/habilidades.widget.dart';
import 'package:portfolio/interface/widgets/item_animado.widget.dart';
import 'package:portfolio/interface/widgets/servicos.widget.dart';
import 'package:portfolio/interface/widgets/svg.widget.dart';
import 'package:portfolio/interface/widgets/texto.widget.dart';
import 'package:portfolio/interface/widgets/titulo.widget.dart';
import 'package:url_launcher/url_launcher.dart';

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
  String texto = "Isabela Fagundes";

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
    return Container(
      height: altura,
      width: largura,
      decoration: BoxDecoration(
        color: Color(widget.tema.base100),
      ),
      padding: EdgeInsets.only(top: isSmallScreen ? 40 : 0),
      child: SingleChildScrollView(child: _conteudo),
    );
  }

  Widget get _conteudo {
    bool isSmallScreen = MediaQuery.of(context).size.width <= 1200;

    return Column(
      children: [
        const SizedBox(height: 100),
        ItemAnimadoWidget(
          child: Flex(
            direction: isSmallScreen ? Axis.vertical : Axis.horizontal,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(
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
                        height: Responsive.tablet(context) ? 350 : 450,
                        decoration: BoxDecoration(
                          color: Color(widget.tema.primary),
                        ),
                        child: Image.asset(
                          "assets/isabela.png",
                          height: Responsive.tablet(context) ? 300 : 400,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    child: SvgWidget(
                      nomeSvg: "sparkles",
                      altura: Responsive.tablet(context) ? 40 : 80,
                      largura: Responsive.tablet(context) ? 40 : 80,
                      cor: Color(widget.tema.secondary),
                    )
                        .animate(
                          onPlay: (controller) => controller.repeat(reverse: true),
                        )
                        .moveY(
                          begin: -3,
                          end: 3,
                          duration: 1.seconds,
                          curve: Curves.easeInOut,
                        ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: SvgWidget(
                      nomeSvg: "sparkles",
                      altura: Responsive.tablet(context) ? 40 : 80,
                      largura: Responsive.tablet(context) ? 40 : 80,
                      cor: Color(widget.tema.secondary),
                    )
                        .animate(
                          onPlay: (controller) => controller.repeat(reverse: true),
                        )
                        .moveY(
                          begin: 3,
                          end: -3,
                          duration: 1.seconds,
                          curve: Curves.easeInOut,
                        ),
                  ),
                ],
              ),
              SizedBox(width: widget.tema.espacamento * 10, height: widget.tema.espacamento * 4),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: widget.tema.espacamento * 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextoWidget(
                      texto: "Olá, eu sou a",
                      tamanho: widget.tema.tamanhoFonteXG,
                      cor: Color(widget.tema.baseContent),
                    ),
                    FittedBox(
                      child: Row(
                        children: [
                          for (indice = 0; indice < texto.length; indice++)
                            TextoWidget(
                              texto: texto[indice],
                              tamanho: widget.tema.tamanhoFonteXG * 2,
                              cor: Color(widget.tema.baseContent),
                              fontFamily: "Shrikhand",
                            ).animate(onComplete: (controller) {
                              if (indice == texto.length - 1) resetarAnimacao();
                            }).fade(
                              delay: Duration(
                                milliseconds: 100 * indice,
                              ),
                            ),
                        ],
                      ),
                    ),
                    SizedBox(height: widget.tema.espacamento * 2),
                    Container(
                      constraints: const BoxConstraints(maxWidth: 700),
                      child: TextoWidget(
                        maxLines: 10,
                        tamanho: widget.tema.espacamento * 2,
                        texto:
                            "Desenvolvedora full-stack com experiência no desenvolvimento de aplicações completas, sempre focando em performance, escalabilidade e usabilidade. Estou disponível para projetos freelancer, entre em contato para trabalharmos juntos!",
                        cor: Color(widget.tema.baseContent),
                      ),
                    ),
                    SizedBox(height: widget.tema.espacamento * 3),
                    Container(
                      constraints: const BoxConstraints(maxWidth: 400),
                      child: Divider(
                        color: Color(widget.tema.baseContent),
                        height: 1,
                      ),
                    ),
                    SizedBox(height: widget.tema.espacamento * 2),
                    FittedBox(
                      child: Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextoWidget(
                              texto: "Contate-me: ",
                              cor: Color(widget.tema.baseContent),
                              tamanho: widget.tema.espacamento * 2,
                            ),
                            SizedBox(width: widget.tema.espacamento * 2),
                            BotaoIconeWidget(
                              tema: widget.tema,
                              svgNome: 'email',
                              callback: () async {
                                await launchUrl(
                                  Uri.parse("mailto:isabelafagundesdev@gmail.com"),
                                  mode: LaunchMode.externalApplication,
                                );
                              },
                            ),
                            SizedBox(width: widget.tema.espacamento * 2),
                            BotaoIconeWidget(
                              tema: widget.tema,
                              svgNome: 'linkedin',
                              callback: () async {
                                await launchUrl(
                                  Uri.parse("https://www.linkedin.com/in/isabelafagundes09/"),
                                  mode: LaunchMode.externalApplication,
                                );
                              },
                            ),
                            SizedBox(width: widget.tema.espacamento * 2),
                            BotaoIconeWidget(
                              tema: widget.tema,
                              svgNome: 'github',
                              callback: () async {
                                await launchUrl(
                                  Uri.parse("https://github.com/isabelafagundes"),
                                  mode: LaunchMode.externalApplication,
                                );
                              },
                            ),
                            SizedBox(width: widget.tema.espacamento * 2),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: widget.tema.espacamento * 5),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: widget.tema.espacamento * 4),
        ItemAnimadoWidget(
          child: TituloWidget(
            tema: widget.tema,
            titulo: "Serviços",
            tamanhoFonte: widget.tema.espacamento * 5,
          ),
        ),
        const SizedBox(height: 32),
        ItemAnimadoWidget(child: ServicosWidget(tema: widget.tema)),
        SizedBox(height: widget.tema.espacamento * 8),
        ItemAnimadoWidget(
          child: TituloWidget(
            tema: widget.tema,
            titulo: "Habilidades",
            tamanhoFonte: widget.tema.espacamento * 5,
          ),
        ),
        const SizedBox(height: 32),
        ItemAnimadoWidget(child: HabilidadesWidget(tema: widget.tema)),
        SizedBox(height: widget.tema.espacamento * 10),
      ],
    );
  }
}
