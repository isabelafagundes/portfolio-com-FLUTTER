import 'package:flutter/material.dart';
import 'package:portfolio/interface/configuration/rota/rota.dart';
import 'package:portfolio/domain/tema.dart';
import 'package:portfolio/interface/util/responsive.dart';
import 'package:portfolio/interface/widgets/botao_home.widget.dart';
import 'package:portfolio/interface/widgets/titulo.widget.dart';

class ConteudoHomeWidget extends StatelessWidget {
  final Tema tema;

  const ConteudoHomeWidget({super.key, required this.tema});

  @override
  Widget build(BuildContext context) {
    double altura = MediaQuery.of(context).size.height;
    double largura = MediaQuery.of(context).size.width;

    return Container(
      height: altura,
      width: largura,
      decoration: BoxDecoration(
        color: Color(tema.base200),
        image: const DecorationImage(
          image: AssetImage("assets/computer.jpg"),
          fit: BoxFit.fitHeight,
          opacity: .1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TituloWidget(
            tema: tema,
            titulo:"Isabela Fagundes",
          ),
          Text(
            "Desenvolvedora Full-stack",
            style: TextStyle(
              fontSize: tema.espacamento * 2,
              color: Colors.white,
            ),
          ),
          SizedBox(height: tema.espacamento * 4),
          FittedBox(
            child: Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: BotaoHomeWidget(
                    label: "Sobre mim",
                    callback: () => Rota.navegar(context, Rota.SOBRE_MIM),
                    tema: tema,
                    corFundo:  Color(tema.base100),
                    corBorda: Color(tema.accent),
                  ),
                ),
                SizedBox(width: tema.espacamento * 2, height: tema.espacamento * 2),
                Flexible(
                  child: BotaoHomeWidget(
                    label: "Download CV",
                    callback: () {},
                    tema: tema,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
