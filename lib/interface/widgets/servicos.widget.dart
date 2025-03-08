import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/domain/tema.dart';
import 'package:portfolio/interface/util/responsive.dart';
import 'package:portfolio/interface/widgets/item_servico.widget.dart';

class ServicosWidget extends StatelessWidget {
  final Tema tema;

  const ServicosWidget({super.key, required this.tema});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Responsive.larguraTela(context) <= 550 ? null : 900,
      padding: EdgeInsets.symmetric(horizontal: tema.espacamento * 4),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: _obterQuantidadePorLinha(context),
          mainAxisExtent: 320,
          crossAxisSpacing: tema.espacamento * 2,
          mainAxisSpacing: tema.espacamento * 2,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Center(
            child: ItemServicoWidget(
              tema: tema,
              nomeServico: servicos[index].titulo,
              descricao: servicos[index].descricao,
              nomeSvg: servicos[index].icone,
            ).animate().fade(
                  delay: Duration(milliseconds: index * 100),
                ),
          );
        },
        itemCount: servicos.length,
      ),
    );
  }

  List<ItemServico> get servicos => [
        const ItemServico(
          titulo: "Desenvolvimento Web e Mobile",
          descricao:
              "Desenvolvimento de aplicações web e mobile, utilizando tecnologias modernas e seguindo as melhores práticas de mercado.",
          icone: 'devices',
        ),
        const ItemServico(
          titulo: "Desenvolvimento de APIs",
          descricao:
              "Desenvolvimento de APIs RESTful para integração de sistemas, seguindo as melhores práticas de mercado e garantindo segurança e performance.",
          icone: 'api',
        ),
        const ItemServico(
          titulo: "Interfaces Responsivas",
          descricao:
              "Desenvolvimento de interfaces responsivas, que se adaptam a diferentes tamanhos de tela, garantindo uma experiência de usuário consistente em todos os dispositivos.",
          icone: 'responsive',
        ),
      ];

  int _obterQuantidadePorLinha(BuildContext context) {
    if (Responsive.mobile(context)) {
      return 1;
    } else if (Responsive.tablet(context)) {
      return 2;
    } else {
      return 3;
    }
  }
}

class ItemServico {
  final String titulo;
  final String descricao;
  final String icone;

  const ItemServico({
    required this.titulo,
    required this.descricao,
    required this.icone,
  });
}
