import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/application/state/tema.state.dart';
import 'package:portfolio/domain/tema.dart';
import 'package:portfolio/interface/widgets/conteudo_projetos.widget.dart';

@RoutePage()
class ProjetosPage extends StatefulWidget {
  const ProjetosPage({super.key});

  @override
  State<ProjetosPage> createState() => _ProjetosPageState();
}

class _ProjetosPageState extends State<ProjetosPage> {
  TemaState get temaState => TemaState.instancia;

  Tema get tema => temaState.temaSelecionado!;

  @override
  Widget build(BuildContext context) {
    return ConteudoProjetosWidget(
      tema: tema,
    );
  }
}
