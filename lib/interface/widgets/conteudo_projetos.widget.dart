import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/domain/tema.dart';
import 'package:portfolio/interface/util/responsive.dart';
import 'package:portfolio/interface/widgets/botao_icone.widget.dart';
import 'package:portfolio/interface/widgets/texto.widget.dart';
import 'package:portfolio/interface/widgets/titulo.widget.dart';
import 'package:url_launcher/url_launcher.dart';

class ConteudoProjetosWidget extends StatefulWidget {
  final Tema tema;

  const ConteudoProjetosWidget({
    super.key,
    required this.tema,
  });

  @override
  State<ConteudoProjetosWidget> createState() => _ConteudoProjetosWidgetState();
}

class _ConteudoProjetosWidgetState extends State<ConteudoProjetosWidget> {
  ItemCarousel? itemSelecionado;

  List<ItemCarousel> itens = [
    ItemCarousel.criar(
      "A Viagem de Chihiro",
      "Tecnologias: Dart e Flutter",
      "https://github.com/isabelafagundes/a-viagem-de-chihiro-com-FLUTTER",
      "https://isabelafagundes.github.io/a-viagem-de-chihiro-com-FLUTTER/",
      "chihiro.gif",
    ),
    ItemCarousel.criar(
      "O Falcão e o Soldado Invernal",
      "Tecnologias: Dart e Flutter",
      "https://github.com/isabelafagundes/jogo-da-memoria-com-FLUTTER",
      "https://isabelafagundes.github.io/landing-page-tftws-com-FLUTTER/",
      "falcao-soldado.gif",
    ),
    ItemCarousel.criar(
      "Jogo da Memória de Halloween",
      "Tecnologias: Dart e Flutter",
      "https://github.com/isabelafagundes/jogo-da-memoria-com-FLUTTER",
      "https://isabelafagundes.github.io/jogo-da-memoria-com-FLUTTER/",
      "jogo-memoria.gif",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    double altura = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.only(top: Responsive.mobile(context) ? 40 : 0),
      width: largura,
      height: altura,
      color: Color(widget.tema.base100),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: Responsive.mobile(context) ? 50 : 100),
            TituloWidget(
              tema: widget.tema,
              titulo: "Projetos",
              tamanhoFonte: widget.tema.espacamento * 4,
            ),
            Container(
              padding: const EdgeInsets.only(top: 32, bottom: 12, left: 16, right: 16),
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: _obterQuantidadePorLinha(largura),
                  mainAxisExtent: 256.2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemCount: itens.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  ItemCarousel item = itens[index];

                  return Animate(
                    target: itemSelecionado == item ? 1 : 0,
                    effects: const [
                      ScaleEffect(
                        duration: Duration(milliseconds: 200),
                        curve: Curves.easeInOut,
                        alignment: Alignment.center,
                        begin: Offset(1, 1),
                        end: Offset(.95, .95),
                      ),
                    ],
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      onEnter: (_) => setState(() => itemSelecionado = item),
                      onExit: (_) => setState(() => itemSelecionado = null),
                      child: GestureDetector(
                        onTap: () async {
                          await launchUrl(
                            Uri.parse(item.urlLaunch),
                            mode: LaunchMode.externalApplication,
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(widget.tema.espacamento * 2),
                            boxShadow: [
                              BoxShadow(
                                color: Color(widget.tema.neutral).withOpacity(.1),
                                blurRadius: 4,
                              ),
                            ],
                          ),
                          child: Column(
                            children: [
                              Container(
                                height: 200,
                                clipBehavior: Clip.antiAlias,
                                padding: EdgeInsets.only(
                                    top: widget.tema.espacamento,
                                    left: widget.tema.espacamento,
                                    right: widget.tema.espacamento),
                                decoration: BoxDecoration(
                                  color: Color(widget.tema.base200),
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(widget.tema.espacamento * 2),
                                    topRight: Radius.circular(widget.tema.espacamento * 2),
                                  ),
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(widget.tema.espacamento * 1.5),
                                      topRight: Radius.circular(widget.tema.espacamento * 1.5),
                                    ),
                                    image: DecorationImage(
                                      image: AssetImage("assets/${item.imagem}"),
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: widget.tema.espacamento * 1.5,
                                  vertical: widget.tema.espacamento / 2,
                                ),
                                decoration: BoxDecoration(
                                  color: Color(widget.tema.base200),
                                  borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(widget.tema.espacamento * 2),
                                    bottomRight: Radius.circular(widget.tema.espacamento * 2),
                                  ),
                                ),
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        TextoWidget(
                                          texto: item.nome,
                                          tamanho: widget.tema.tamanhoFonteG,
                                          cor: Color(widget.tema.neutral),
                                          weight: FontWeight.w500,
                                        ),
                                        TextoWidget(
                                          texto: item.descricao,
                                          tamanho: widget.tema.tamanhoFonteP + 2,
                                          cor: Color(widget.tema.neutral),
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    BotaoIconeWidget(
                                        svgNome: "github",
                                        callback: () async {
                                          await launchUrl(
                                            Uri.parse(item.urlGithub),
                                            mode: LaunchMode.externalApplication,
                                          );
                                        },
                                        tema: widget.tema),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ).animate().fade(
                              delay: Duration(milliseconds: index * 100),
                            ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }

  int _obterQuantidadePorLinha(double largura) {
    if (largura <= 600) {
      return 1;
    } else if (largura <= 900) {
      return 2;
    } else {
      return 3;
    }
  }
}

class ItemCarousel {
  String _nome;
  String _imagem;
  String _descricao;
  String _urlGithub;
  String _urlLaunch;

  ItemCarousel.criar(
    this._nome,
    this._descricao,
    this._urlGithub,
    this._urlLaunch,
    this._imagem,
  );

  String get imagem => _imagem;

  String get urlGithub => _urlGithub;

  String get descricao => _descricao;

  String get nome => _nome;

  String get urlLaunch => _urlLaunch;
}
