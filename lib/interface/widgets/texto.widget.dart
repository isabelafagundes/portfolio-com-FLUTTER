import 'package:flutter/material.dart';

class TextoWidget extends StatelessWidget {
  final String texto;
  final double? tamanho;
  final Color? cor;
  final String? fontFamily;
  final FontWeight? weight;
  final int? maxLines;
  final TextAlign? align;

  const TextoWidget({
    super.key,
    required this.texto,
    this.tamanho,
    this.cor,
    this.fontFamily,
    this.weight,
    this.maxLines,
     this.align,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      texto,
      textAlign: align ?? TextAlign.justify,
      maxLines: maxLines ?? 2,
      style: TextStyle(
        fontWeight: weight ?? FontWeight.w400,
        fontSize: tamanho ?? 14,
        fontFamily: fontFamily ?? 'Montserrat',
        color: cor ?? Colors.black,
      ),
    );
  }
}
