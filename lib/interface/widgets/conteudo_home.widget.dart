import 'package:flutter/material.dart';
import 'package:portfolio/interface/constant.dart';
import 'package:portfolio/domain/tema.dart';
import 'package:portfolio/interface/util/responsive.dart';

class ConteudoHomeWidget extends StatelessWidget {
  final Tema tema;

  const ConteudoHomeWidget({super.key, required this.tema});

  @override
  Widget build(BuildContext context) {
    double altura = MediaQuery.of(context).size.height;
    double largura = MediaQuery.of(context).size.width;

    return Container(
      height: altura - 34,
      width: largura,
      decoration: BoxDecoration(
        color: Color(tema.base200),
        image: const DecorationImage(
          image: AssetImage("assets/computer.jpg"),
          fit: BoxFit.fill,
          opacity: .1,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            constraints: MediaQuery.of(context).size.width <= 620
                ? const BoxConstraints(maxWidth: 400)
                : const BoxConstraints(maxWidth: 600),
            child: Text(
              "Isabela Fagundes",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Aboreto',
                fontWeight: FontWeight.w400,
                fontSize: tema.espacamento * 6,
                color: Color(tema.accent),
              ),
            ),
          ),
          Text(
            "Desenvolvedora Full-stack",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: tema.espacamento * 2,
              color: Colors.white,
            ),
          ),
          SizedBox(height: tema.espacamento * 4),
          Flex(
            direction: MediaQuery.of(context).size.width <= 610
                ? Axis.vertical
                : Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: tema.espacamento,
                    horizontal: tema.espacamento * 3,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(tema.primary), width: 2),
                    borderRadius: BorderRadius.circular(
                      tema.espacamento * 4,
                    ),
                  ),
                  child: Text(
                    "Sobre mim",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: tema.espacamento * 2,
                      color: Color(tema.primary),
                    ),
                  ),
                ),
              ),
              SizedBox(
                  width: tema.espacamento * 3, height: tema.espacamento * 2),
              Flexible(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: tema.espacamento,
                    horizontal: tema.espacamento * 3,
                  ),
                  decoration: BoxDecoration(
                    color: Color(tema.primary),
                    border: Border.all(color: Color(tema.primary), width: 2),
                    borderRadius: BorderRadius.circular(
                      tema.espacamento * 4,
                    ),
                  ),
                  child: Text(
                    "Download CV",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: tema.espacamento * 2,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
