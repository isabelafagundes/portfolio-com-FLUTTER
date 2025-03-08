import 'package:flutter/material.dart';
import 'package:portfolio/domain/tema.dart';
import 'package:portfolio/interface/util/responsive.dart';
import 'package:portfolio/interface/widgets/habilidades.widget.dart';

class ConteudoHabilidadesWidget extends StatelessWidget {
  final Tema tema;

  const ConteudoHabilidadesWidget({
    super.key,
    required this.tema,
  });

  @override
  Widget build(BuildContext context) {

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
            HabilidadesWidget(tema: tema),
          ],
        ),
      ),
    );
  }

}
