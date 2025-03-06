import 'package:auto_route/auto_route.dart';
import 'package:portfolio/interface/configuration/rota/rota.dart';
import 'package:portfolio/interface/page/habilidades.page.dart';
import 'package:portfolio/interface/page/home.page.dart';
import 'package:portfolio/interface/page/portfolio.page.dart';
import 'package:portfolio/interface/page/projetos.page.dart';
import 'package:portfolio/interface/page/sobre_mim.page.dart';
part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => Rota.rotasAuto;
}