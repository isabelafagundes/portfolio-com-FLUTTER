
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/domain/tema.dart';
import 'package:portfolio/interface/util/responsive.dart';
import 'package:portfolio/interface/widgets/item_habilidade.widget.dart';

class HabilidadesWidget extends StatelessWidget {
  final Tema tema;
  const HabilidadesWidget({super.key, required this.tema});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: tema.espacamento * 5),
      child: SizedBox(
        width: Responsive.larguraTela(context) <= 550 ? null : 900,
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
                    nomeSvg: habilidades[index].nomeSvg,
                    tema: tema,
                    nomeTecnologia: habilidades[index].nomeTecnologia,
                    descricao: habilidades[index].descricao,
                  ).animate().fade(
                    delay: Duration(milliseconds: index * 100),
                  ),
                ),
              );
            },
            itemCount: habilidades.length,
          ),
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

  List<ItemHabilidade> get habilidades => [
    const ItemHabilidade(
      nomeSvg: 'flutter',
      nomeTecnologia: 'Flutter',
      descricao: 'Framework para criar apps nativos com UI fluída e responsiva.',
    ),
    const ItemHabilidade(
      nomeSvg: 'dart',
      nomeTecnologia: 'Dart',
      descricao: 'Linguagem moderna e eficiente para apps escaláveis, usada no Flutter.',
    ),
    const ItemHabilidade(
      nomeSvg: 'golang',
      nomeTecnologia: 'GoLang',
      descricao: 'Linguagem rápida e eficiente, ideal para sistemas concorrentes e escaláveis.',
    ),
    const ItemHabilidade(
      nomeSvg: 'java',
      nomeTecnologia: 'Java',
      descricao: 'Linguagem robusta e versátil para aplicações web, mobile e empresariais.',
    ),
    const ItemHabilidade(
      nomeSvg: 'quarkus',
      nomeTecnologia: 'Quarkus',
      descricao: 'Framework Java otimizado para microsserviços e cloud-native.',
    ),
    const ItemHabilidade(
      nomeSvg: 'git',
      nomeTecnologia: 'Git',
      descricao: 'Sistema de controle de versão para colaboração e gerenciamento de código.',
    ),
    const ItemHabilidade(
      nomeSvg: 'database',
      nomeTecnologia: 'Banco de dados',
      descricao: 'Armazenamento estruturado de dados para aplicações diversas',
    ),
    const ItemHabilidade(
      nomeSvg: 'arquitetura',
      nomeTecnologia: 'Arquitetura de software',
      descricao: 'Organização e design eficiente de sistemas e aplicações.',
    ),
    const ItemHabilidade(
      nomeSvg: 'boas-praticas',
      nomeTecnologia: 'Boas práticas',
      descricao: 'Padrões para código limpo, seguro e de fácil manutenção.',
    ),
  ];

}

class ItemHabilidade {
  final String nomeSvg;
  final String nomeTecnologia;
  final String descricao;

  const ItemHabilidade({
    required this.nomeSvg,
    required this.nomeTecnologia,
    required this.descricao,
  });
}
