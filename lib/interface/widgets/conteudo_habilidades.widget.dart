import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/domain/tema.dart';
import 'package:portfolio/interface/util/responsive.dart';
import 'package:portfolio/interface/widgets/item_habilidade.widget.dart';
import 'package:portfolio/interface/widgets/titulo.widget.dart';

class ConteudoHabilidadesWidget extends StatelessWidget {
  final Tema tema;

  const ConteudoHabilidadesWidget({
    super.key,
    required this.tema,
  });

  @override
  Widget build(BuildContext context) {
    List<String> svgs = [
      'flutter',
      'dart',
      'golang',
      'java',
      'quarkus',
      'git',
      'database',
      'arquitetura',
      'boas-praticas'
    ];

    List<String> nomes = [
      'Flutter',
      'Dart',
      'GoLang',
      'Java',
      'Quarkus',
      'Git',
      'Banco de dados',
      'Arquitetura de software',
      'Boas práticas'
    ];

    List<String> descricoes = [
      'Framework para criar apps nativos com UI fluída e responsiva.',
      'Linguagem moderna e eficiente para apps escaláveis, usada no Flutter.',
      'Linguagem rápida e eficiente, ideal para sistemas concorrentes e escaláveis.',
      'Linguagem robusta e versátil para aplicações web, mobile e empresariais.',
      'Framework Java otimizado para microsserviços e cloud-native.',
      'Sistema de controle de versão para colaboração e gerenciamento de código.',
      'Armazenamento estruturado de dados para aplicações diversas',
      'Organização e design eficiente de sistemas e aplicações.',
      'Padrões para código limpo, seguro e de fácil manutenção.',
    ];
    double altura = MediaQuery.of(context).size.height;
    double largura = MediaQuery.of(context).size.width;
    bool isMobile = MediaQuery.of(context).size.width <= 600;
    return Container(
      height: largura <= 800 ? null : altura,
      width: largura,
      color: Color(tema.base200),
      padding: EdgeInsets.only(top: isMobile ? 40 : 0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: Responsive.mobile(context) ? 50 : 100),
            TituloWidget(
              tema: tema,
              titulo: "Habilidades",
              tamanhoFonte: tema.espacamento * 4,
            ),
            const SizedBox(height: 32),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: tema.espacamento * 5),
                  child: SizedBox(
                    width: largura <= 550 ? null : 900,
                    child: Center(
                      child: GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: _obterQuantidadePorLinha(context),
                          mainAxisExtent: 160,
                          crossAxisSpacing: tema.espacamento * 2,
                          mainAxisSpacing: tema.espacamento * 2,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return Center(
                            child: SizedBox(
                              height: 160,
                              child: ItemHabilidadeWidget(
                                nomeSvg: svgs[index],
                                tema: tema,
                                nomeTecnologia: nomes[index],
                                descricao: descricoes[index],
                              ).animate().fade(
                                    delay: Duration(milliseconds: index * 100),
                                  ),
                            ),
                          );
                        },
                        itemCount: nomes.length,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 80),
              ],
            ),
          ],
        ),
      ),
    );
  }

  int _obterQuantidadePorLinha(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    if (largura <= 550) return 1;
    if (largura <= 700) return 2;
    return 3;
  }
}
