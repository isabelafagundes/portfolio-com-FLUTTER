import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/application/state/tema.state.dart';
import 'package:portfolio/domain/tema.dart';
import 'package:portfolio/interface/widgets/conteudo_habilidades.widget.dart';

@RoutePage()
class HabilidadesPage extends StatefulWidget {
  const HabilidadesPage({super.key});

  @override
  State<HabilidadesPage> createState() => _HabilidadesPageState();
}

class _HabilidadesPageState extends State<HabilidadesPage> {
  TemaState get temaState => TemaState.instancia;

  Tema get tema => temaState.temaSelecionado!;

  @override
  Widget build(BuildContext context) {
    return ConteudoHabilidadesWidget(
      tema: tema,
    );
  }
}
