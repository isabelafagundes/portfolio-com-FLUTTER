import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/application/state/tema.state.dart';
import 'package:portfolio/domain/tema.dart';
import 'package:portfolio/interface/widgets/conteudo_home.widget.dart';

@RoutePage()
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TemaState get temaState => TemaState.instancia;

  Tema get tema => temaState.temaSelecionado!;

  @override
  Widget build(BuildContext context) {
    return ConteudoHomeWidget(
      tema: tema,
    );
  }
}
