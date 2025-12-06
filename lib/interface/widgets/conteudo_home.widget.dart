import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:portfolio/interface/configuration/rota/rota.dart';
import 'package:portfolio/domain/tema.dart';
import 'package:portfolio/interface/util/responsive.dart';
import 'package:portfolio/interface/widgets/botao_home.widget.dart';
import 'package:portfolio/interface/widgets/item_animado.widget.dart';
import 'package:portfolio/interface/widgets/texto.widget.dart';
import 'package:portfolio/interface/widgets/titulo.widget.dart';
import 'package:url_launcher/url_launcher.dart';

class ConteudoHomeWidget extends StatefulWidget {
  final Tema tema;

  const ConteudoHomeWidget({super.key, required this.tema});

  @override
  State<ConteudoHomeWidget> createState() => _ConteudoHomeWidgetState();
}

class _ConteudoHomeWidgetState extends State<ConteudoHomeWidget> {
  String texto = "Desenvolvedora Full-stack";

  @override
  Widget build(BuildContext context) {
    double altura = MediaQuery.of(context).size.height;
    double largura = MediaQuery.of(context).size.width;

    return Container(
      height: altura,
      width: largura,
      decoration: BoxDecoration(
        color: Color(widget.tema.base100),
        image: DecorationImage(
          image: const AssetImage("assets/computer.jpg"),
          fit: Responsive.mobile(context) ? BoxFit.fitHeight : BoxFit.cover,
          opacity: .06,
        ),
      ),
      child: ItemAnimadoWidget(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TituloWidget(
              tema: widget.tema,
              titulo: "Isabela Fagundes",
              tamanhoFonte: 68,
            ),
            FittedBox(
              child: Row(
                children: [
                  for (int indice = 0; indice < texto.length; indice++)
                    TextoWidget(
                      texto: texto[indice],
                      tamanho: widget.tema.tamanhoFonteXG,
                      cor: Color(widget.tema.baseContent),
                    ).animate().fade(
                          delay: Duration(
                            milliseconds: 100 * indice,
                          ),
                        ),
                ],
              ),
            ),
            SizedBox(height: widget.tema.espacamento * 4),
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
                      tema: widget.tema,
                      corFundo: Color(widget.tema.base100),
                      corBorda: Color(widget.tema.accent),
                    ),
                  ),
                  SizedBox(width: widget.tema.espacamento * 2, height: widget.tema.espacamento * 2),
                  Flexible(
                    child: BotaoHomeWidget(
                      label: "Visualizar CV",
                      callback: () async {
                        await launchUrl(
                          Uri.parse(
                              "https://drive.google.com/file/d/12LFRzR4uuA1VHxXo4c0rUOzG3TlYa-A4/view?usp=sharing"),
                          mode: LaunchMode.externalApplication,
                        );
                      },
                      tema: widget.tema,
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
