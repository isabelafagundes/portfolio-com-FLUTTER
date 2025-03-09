import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/application/state/tema.state.dart';
import 'package:portfolio/domain/tema.dart';
import 'package:portfolio/interface/widgets/conteudo_contato.widget.dart';

@RoutePage()
class ContatoPage extends StatefulWidget {
  const ContatoPage({super.key});

  @override
  State<ContatoPage> createState() => _ContatoPageState();
}

class _ContatoPageState extends State<ContatoPage> {
  TemaState get temaState => TemaState.instancia;

  Tema get tema => temaState.temaSelecionado!;

  @override
  Widget build(BuildContext context) {
    return ConteudoContatoWidget(
      tema: tema,
    );
  }
}
