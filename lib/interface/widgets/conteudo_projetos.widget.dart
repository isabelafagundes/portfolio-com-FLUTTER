import 'package:flutter/material.dart';
import 'package:portfolio/domain/tema.dart';
import 'package:portfolio/interface/util/responsive.dart';
import 'package:portfolio/interface/widgets/botao_icone.widget.dart';
import 'package:portfolio/interface/widgets/texto.widget.dart';

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
  List<ItemCarousel> itens = [
    ItemCarousel.criar(
      "A Viagem de Chihiro",
      "Tecnologias: Dart e Flutter",
      "",
      "chihiro_projeto.png",
    ),
    ItemCarousel.criar(
      "O Falcão e o Soldado Invernal",
      "Tecnologias: Dart e Flutter",
      "",
      "tfws_projeto.png",
    ),
    ItemCarousel.criar(
      "Jogo da Memória de Halloween",
      "Tecnologias: Dart e Flutter",
      "",
      "memoria_projeto.png",
    ),
    ItemCarousel.criar(
      "A Viagem de Chihiro",
      "Tecnologias: Dart e Flutter",
      "",
      "chihiro_projeto.png",
    ),
    ItemCarousel.criar(
      "O Falcão e o Soldado Invernal",
      "Tecnologias: Dart e Flutter",
      "",
      "tfws_projeto.png",
    ),
    ItemCarousel.criar(
      "Jogo da Memória de Halloween",
      "Tecnologias: Dart e Flutter",
      "",
      "memoria_projeto.png",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    double altura = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.only(top: Responsive.mobile(context) ? 40 : 0),
      width: largura,
      height: altura - 34,
      color: Color(widget.tema.base100),
      child: Column(
        children: [
          SizedBox(height: Responsive.mobile(context) ? 50 : 100),
          TextoWidget(
            texto: "Projetos",
            tamanho: widget.tema.espacamento * 4,
            cor: Color(widget.tema.accent),
            fontFamily: 'Aboreto',
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(top: 16, bottom: 12, left: 16, right: 16),
                child: GridView.builder(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    scrollDirection: Axis.vertical,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: _obterQuantidadePorLinha(largura),
                      mainAxisExtent: 306.2,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                    ),
                    itemCount: itens.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      ItemCarousel item = itens[index];

                      return Container(
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
                              height: 250,
                              clipBehavior: Clip.antiAlias,
                              padding: EdgeInsets.all(widget.tema.espacamento),
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
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: widget.tema.espacamento * 1.5,
                                vertical: widget.tema.espacamento/2 ,
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
                                  Spacer(),
                                  BotaoIconeWidget(svgNome: "github", callback: () {}, tema: widget.tema),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
            ),
          ),
        ],
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
  String _url;

  ItemCarousel.criar(
    this._nome,
    this._descricao,
    this._url,
    this._imagem,
  );

  String get imagem => _imagem;

  String get url => _url;

  String get descricao => _descricao;

  String get nome => _nome;
}
