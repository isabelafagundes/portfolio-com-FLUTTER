import 'package:flutter/material.dart';
import 'package:portfolio/domain/tema.dart';
import 'package:portfolio/interface/util/responsive.dart';
import 'package:portfolio/interface/widgets/botao_home.widget.dart';
import 'package:portfolio/interface/widgets/input.widget.dart';
import 'package:portfolio/interface/widgets/item_animado.widget.dart';
import 'package:portfolio/interface/widgets/notificacao.widget.dart';
import 'package:portfolio/interface/widgets/texto.widget.dart';
import 'package:portfolio/interface/widgets/titulo.widget.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ConteudoContatoWidget extends StatefulWidget {
  final Tema tema;

  const ConteudoContatoWidget({
    super.key,
    required this.tema,
  });

  @override
  State<ConteudoContatoWidget> createState() => _ConteudoContatoWidgetState();
}

class _ConteudoContatoWidgetState extends State<ConteudoContatoWidget> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mensagemController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double altura = MediaQuery.of(context).size.height;
    double largura = MediaQuery.of(context).size.width;
    bool isMobile = MediaQuery.of(context).size.width <= 600;

    return Container(
      height: largura <= 800 ? null : altura,
      width: largura,
      color: Color(widget.tema.base100),
      padding: EdgeInsets.only(top: isMobile ? 40 : 0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: Responsive.mobile(context) ? 50 : 100),
            TituloWidget(
              tema: widget.tema,
              titulo: "Contato",
              tamanhoFonte: widget.tema.espacamento * 5,
            ),
            SizedBox(height: widget.tema.espacamento * 4),
            Container(
              constraints: const BoxConstraints(maxWidth: 900),
              padding: EdgeInsets.symmetric(
                horizontal: widget.tema.espacamento * 4,
              ),
              child: Flex(
                direction: Axis.vertical,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ItemAnimadoWidget(
                    child: TextoWidget(
                      texto:
                          "Entre em contato comigo para tirar dúvidas, fazer sugestões ou apenas bater um papo.",
                      cor: Color(widget.tema.baseContent),
                      align: TextAlign.center,
                      maxLines: 20,
                    ),
                  ),
                  SizedBox(height: widget.tema.espacamento * 2),
                  Flexible(
                    child: Flex(
                      direction: Responsive.mobile(context)
                          ? Axis.vertical
                          : Axis.horizontal,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Flexible(
                          child: ItemAnimadoWidget(
                            child: InputWidget(
                              tema: widget.tema,
                              controller: _nomeController,
                              onChanged: (_) {},
                              label: "Nome",
                            ),
                          ),
                        ),
                        SizedBox(
                          width: widget.tema.espacamento * 2,
                          height: widget.tema.espacamento * 2,
                        ),
                        Flexible(
                          flex: 2,
                          child: ItemAnimadoWidget(
                            child: InputWidget(
                              tema: widget.tema,
                              controller: _emailController,
                              onChanged: (_) {},
                              label: "E-mail",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: widget.tema.espacamento * 2),
                  ItemAnimadoWidget(
                    child: InputWidget(
                      tema: widget.tema,
                      controller: _mensagemController,
                      onChanged: (_) {},
                      label: "Mensagem",
                      alturaCampo: 150,
                      expandir: true,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: widget.tema.espacamento * 2),
            SizedBox(
              width: 200,
              child: ItemAnimadoWidget(
                child: BotaoHomeWidget(
                  tema: widget.tema,
                  label: "Enviar",
                  callback: () async => await _enviarEmail(
                    name: _nomeController.text,
                    email: _emailController.text,
                    message: _mensagemController.text,
                  ),
                ),
              ),
            ),
            SizedBox(height: widget.tema.espacamento * 10),
          ],
        ),
      ),
    );
  }

  Future<void> _enviarEmail({
    required String name,
    required String email,
    required String message,
  }) async {
    final url = Uri.parse('https://formspree.io/f/mwplegwr');
    if (name.isEmpty ||
        email.isEmpty ||
        message.isEmpty ||
        !email.contains('@') ||
        !email.contains('.')) {
      Notificacoes.mostrar('Preencha todos os campos!', Emoji.ALERTA);
      return;
    }

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'name': name, 'email': email, 'message': message}),
    );

    if (response.statusCode == 200) {
      Notificacoes.mostrar('E-mail enviado com sucesso!', Emoji.SUCESSO);

      _nomeController.clear();
      _emailController.clear();
      _mensagemController.clear();
    } else {
      Notificacoes.mostrar('Erro ao enviar e-mail: ${response.body}', Emoji.ALERTA);
    }
  }
}
