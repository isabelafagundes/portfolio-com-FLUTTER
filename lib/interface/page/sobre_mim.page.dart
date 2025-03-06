import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/application/state/tema.state.dart';
import 'package:portfolio/domain/tema.dart';
import 'package:portfolio/interface/widgets/conteudo_sobre_mim.widget.dart';

@RoutePage()
class SobreMimPage extends StatefulWidget {
  const SobreMimPage({super.key});

  @override
  State<SobreMimPage> createState() => _SobreMimPageState();
}

class _SobreMimPageState extends State<SobreMimPage> {
  TemaState get temaState => TemaState.instancia;

  Tema get tema => temaState.temaSelecionado!;

  @override
  Widget build(BuildContext context) {
    return ConteudoSobreMimWidget(
      tema: tema,
    );
  }
}
