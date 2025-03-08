import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/domain/tema.dart';
import 'package:portfolio/interface/util/responsive.dart';
import 'package:portfolio/interface/widgets/botao_icone.widget.dart';
import 'package:portfolio/interface/widgets/item_servico.widget.dart';
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
        Flex(
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
                Positioned(
                  child: SvgWidget(
                    nomeSvg: "sparkles",
                    altura: Responsive.tablet(context) ? 40 : 80,
                    largura: Responsive.tablet(context) ? 40 : 80,
                    cor: Color(widget.tema.base200),
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
                    cor: Color(widget.tema.base200),
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
                    cor: Colors.white,
                  ),
                  FittedBox(
                    child: Row(
                      children: [
                        for (indice = 0; indice < texto.length; indice++)
                          TextoWidget(
                            texto: texto[indice],
                            tamanho: widget.tema.tamanhoFonteXG * 2,
                            cor: Colors.white,
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
                  Align(
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
                  SizedBox(height: widget.tema.espacamento * 5),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: widget.tema.espacamento * 4),
        TituloWidget(
          titulo: "Serviços",
          tamanhoFonte: widget.tema.espacamento * 4,
          tema: widget.tema,
        ),
        SizedBox(height: widget.tema.espacamento * 4),
        Container(
          constraints: const BoxConstraints(maxWidth: 900),
          padding: EdgeInsets.symmetric(horizontal: widget.tema.espacamento * 4),
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: _obterQuantidadePorLinha(context),
              mainAxisExtent: 320,
              crossAxisSpacing: widget.tema.espacamento * 2,
              mainAxisSpacing: widget.tema.espacamento * 2,
            ),
            itemBuilder: (BuildContext context, int index) {
              return Center(
                child: ItemServicoWidget(
                  tema: widget.tema,
                  nomeServico: nomes[index],
                  descricao: descricoes[index],
                  nomeSvg: svgs[index],
                ).animate().fade(
                      delay: Duration(milliseconds: index * 100),
                    ),
              );
            },
            itemCount: nomes.length,
          ),
        ),
        SizedBox(height: widget.tema.espacamento * 10),
      ],
    );
  }

  int _obterQuantidadePorLinha(BuildContext context) {
    if (Responsive.mobile(context)) {
      return 1;
    } else if (Responsive.tablet(context)) {
      return 2;
    } else {
      return 3;
    }
  }

  List<String> svgs = ['devices', 'api', 'responsive'];

  List<String> nomes = ['Desenvolvimento Web e Mobile', 'Desenvolvimento de APIs', 'Interfaces Responsivas'];

  List<String> descricoes = [
    "Desenvolvimento de aplicações web e mobile, utilizando tecnologias modernas e seguindo as melhores práticas de mercado.",
    "Desenvolvimento de APIs RESTful para integração de sistemas, seguindo as melhores práticas de mercado e garantindo segurança e performance.",
    "Desenvolvimento de interfaces responsivas, que se adaptam a diferentes tamanhos de tela, garantindo uma experiência de usuário consistente em todos os dispositivos.",
  ];
}
