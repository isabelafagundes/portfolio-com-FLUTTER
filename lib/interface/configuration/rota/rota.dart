import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/interface/configuration/rota/app_router.dart';

enum Rota {
  AREA_LOGADA(url: "/", pageInfo: PortfolioRoute.page),
  HABILIDADES(url: "habilidades", pageInfo: HabilidadesRoute.page),
  SOBRE_MIM(url: "sobre-mim", pageInfo: SobreMimRoute.page),
  PROJETOS(url: "projetos", pageInfo: ProjetosRoute.page),
  HOME(url: "home", pageInfo: HomeRoute.page);


  final PageInfo<dynamic> pageInfo;
  final String url;
  static final Map<String, PageInfo> rotas = registrarTodas();

  const Rota({required this.pageInfo, required this.url});

  static List<AutoRoute> get rotasAuto => [
        adicionar(
          rota: AREA_LOGADA,
          inicial: true,
          subrotas: [
            adicionar(rota: HOME, inicial: true),
            adicionar(rota: SOBRE_MIM),
            adicionar(rota: HABILIDADES),
            adicionar(rota: PROJETOS),
          ],
        ),
      ];

  static void navegar(BuildContext context, Rota rota) {
    try {
      AutoRouter.of(context).navigateNamed(rota.url);
    } catch (e) {
      print("Não foi possível navegar");
    }
  }

  static void navegarComArgumentos(BuildContext context, PageRouteInfo rota) {
    AutoRouter.of(context).navigate(rota);
  }

  static Map<String, PageInfo> registrarTodas() {
    Map<String, PageInfo> mapa = {};
    for (Rota rota in Rota.values.toList()) {
      mapa[rota.name] = rota.pageInfo;
    }
    return mapa;
  }

  static CustomRoute adicionar({
    bool manterEstado = false,
    List<AutoRouteGuard>? guards,
    List<AutoRoute>? subrotas,
    required Rota rota,
    bool inicial = false,
  }) {
    return CustomRoute(
      path: rota.url,
      page: rota.pageInfo,
      maintainState: manterEstado,
      guards: guards ?? [],
      children: subrotas,
      initial: inicial,
    );
  }
}
