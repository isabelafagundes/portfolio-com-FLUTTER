import 'package:flutter/material.dart';
import 'package:portfolio/interface/configuration/rota/rota.dart';
import 'package:portfolio/domain/tema.dart';
import 'package:portfolio/interface/util/responsive.dart';
import 'package:portfolio/interface/widgets/botao_home.widget.dart';
import 'package:portfolio/interface/widgets/item_animado.widget.dart';
import 'package:portfolio/interface/widgets/titulo.widget.dart';
import 'package:url_launcher/url_launcher.dart';

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
        image: DecorationImage(
          image: const AssetImage("assets/computer.jpg"),
          fit: Responsive.mobile(context) ? BoxFit.fitHeight : BoxFit.cover,
          opacity: .1,
        ),
      ),
      child: ItemAnimadoWidget(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TituloWidget(
              tema: tema,
              titulo: "Isabela Fagundes",
              tamanhoFonte: 68,
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
                      corFundo: Color(tema.base100),
                      corBorda: Color(tema.accent),
                    ),
                  ),
                  SizedBox(width: tema.espacamento * 2, height: tema.espacamento * 2),
                  Flexible(
                    child: BotaoHomeWidget(
                      label: "Visualizar CV",
                      callback: ()async  {
                        await launchUrl(
                          Uri.parse("https://drive.google.com/file/d/12LFRzR4uuA1VHxXo4c0rUOzG3TlYa-A4/view?usp=sharing"),
                          mode: LaunchMode.externalApplication,
                        );
                      },
                      tema: tema,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
