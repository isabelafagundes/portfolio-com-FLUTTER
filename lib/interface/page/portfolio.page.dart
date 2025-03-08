import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/application/state/tema.state.dart';
import 'package:portfolio/domain/tema.dart';
import 'package:portfolio/interface/configuration/rota/rota.dart';
import 'package:portfolio/interface/util/responsive.dart';
import 'package:portfolio/interface/widgets/item_navegacao.widget.dart';
import 'package:portfolio/interface/widgets/navegacao.widget.dart';
import 'package:portfolio/interface/widgets/svg.widget.dart';
import 'package:portfolio/interface/widgets/texto.widget.dart';
import 'package:portfolio/interface/widgets/texto_com_switcher.widget.dart';

@RoutePage()
class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  TemaState get temaState => TemaState.instancia;

  Tema get tema => temaState.temaSelecionado!;
  ScrollController controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return AutoRouter(
      builder: (context, child) {
        return Scaffold(
          body: SizedBox(
            height: Responsive.alturaTela(context),
            width: Responsive.larguraTela(context),
            child: Stack(
              alignment: Alignment.center,
              children: [
                child,
                Positioned(
                    bottom: 0,
                    child: Container(
                      height: 28,
                      width: Responsive.larguraTela(context),
                      color: Color(tema.secondary),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(width: tema.espacamento),
                          const Spacer(),
                          TextoWidget(
                            texto: "Feito com  ",
                            tamanho: tema.tamanhoFonteP + 2,
                            cor: Color(tema.baseContent),

                          ),
                          SvgWidget(
                            nomeSvg: "heart",
                            altura: 10,
                            cor: Color(tema.base200),
                          ),
                          TextoWidget(
                            texto: "  por Isabela Fagundes © 2024",
                            tamanho: tema.tamanhoFonteP + 2,
                            cor: Color(tema.baseContent),
                          ),
                          const Spacer(),
                          // GestureDetector(
                          //   onTap: () => temaState.alterarTema(
                          //     temaState.temaSelecionado?.id == 1 ? 2 : 1,
                          //     () => setState(
                          //       () {},
                          //     ),
                          //   ),
                          //   child: SvgWidget(
                          //     nomeSvg: temaState.temaSelecionado?.id == 1 ? "sun" : "moon",
                          //     altura: 20,
                          //     cor: Color(tema.baseContent),
                          //   ),
                          // ),
                          SizedBox(width: tema.espacamento),
                        ],
                      ),
                    )),
                Positioned(
                  top: 12,
                  child: NavegacaoWidget(
                    tema: tema,
                    context: context,
                    callbackHome: () => _navegarPara(Rota.HOME, context),
                    callbackSobreMim: () => _navegarPara(Rota.SOBRE_MIM, context),
                    callbackHabilidades: () => _navegarPara(Rota.HABILIDADES, context),
                    callbackProjetos: () => _navegarPara(Rota.PROJETOS, context),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _navegarPara(Rota rota, BuildContext context) => Rota.navegar(context, rota);
}
