import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgWidget extends StatelessWidget {
  final String nomeSvg;
  final double? altura;
  final double? largura;
  final Color? cor;

  const SvgWidget({
    super.key,
    required this.nomeSvg,
    this.altura,
    this.largura,
    this.cor,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      "assets/${nomeSvg}.svg",
      height: altura,
      width: largura,
      color: cor,
    );
  }
}
