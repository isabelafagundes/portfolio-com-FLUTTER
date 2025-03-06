import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/domain/tema.dart';
import 'package:portfolio/interface/util/responsive.dart';
import 'package:portfolio/interface/widgets/item_habilidade.widget.dart';
import 'package:portfolio/interface/widgets/texto.widget.dart';
import 'package:portfolio/interface/widgets/titulo.widget.dart';

class ConteudoHabilidadesWidget extends StatelessWidget {
  final Tema tema;

  const ConteudoHabilidadesWidget({
    super.key,
    required this.tema,
  });

  @override
  Widget build(BuildContext context) {
    List<String> svgs = ['flutter', 'dart', 'java', 'quarkus', 'git', 'database'];

    List<String> nomes = ['Flutter', 'Dart', 'Java', 'Quarkus', 'Git', 'Banco de dados'];

    List<String> descricoes = [
      'Um framework de código aberto desenvolvido pelo Google para criar aplicativos responsivos.',
      'Uma linguagem de programação desenvolvida pelo Google, usada principalmente com o Flutter.',
      'Uma linguagem de programação de propósito geral, orientada a objetos e amplamente utilizada para desenvolvimento de apps.',
      'Um framework Java de código aberto, otimizado para desenvolvimento em nuvem e nativo, fornecendo alto desempenho.',
      'Um sistema de controle de versão distribuído usado para rastrear alterações no código fonte durante o desenvolvimento de software.',
      ' Um sistema organizado para armazenar e gerenciar conjuntos de dados.',
    ];
    double altura = MediaQuery.of(context).size.height;
    double largura = MediaQuery.of(context).size.width;
    bool isMobile = MediaQuery.of(context).size.width <= 600;
    return SingleChildScrollView(
      child: Container(
        height: largura <= 800 ? null : altura,
        width: largura,
        color: Color(tema.base200),
        padding: EdgeInsets.only(top: isMobile ? 40 : 0),
        child: Column(
          children: [
            SizedBox(height: Responsive.mobile(context) ? 50 : 100),
            TituloWidget(
              tema: tema,
              titulo: "Habilidades",
              tamanhoFonte: tema.espacamento * 4,
            ),
            if (largura >= 800) const Spacer(),
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
                          mainAxisExtent: 180,
                          crossAxisSpacing: tema.espacamento * 2,
                          mainAxisSpacing: tema.espacamento * 2,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return Center(
                            child: SizedBox(
                              height: 180,
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
                if (largura <= 800) const SizedBox(height: 40),
              ],
            ),
            if (largura >= 800)
              const Spacer(
                flex: 3,
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
