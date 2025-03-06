// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    HabilidadesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HabilidadesPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    PortfolioRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PortfolioPage(),
      );
    },
    ProjetosRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const ProjetosPage(),
      );
    },
    SobreMimRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SobreMimPage(),
      );
    },
  };
}

/// generated route for
/// [HabilidadesPage]
class HabilidadesRoute extends PageRouteInfo<void> {
  const HabilidadesRoute({List<PageRouteInfo>? children})
      : super(
          HabilidadesRoute.name,
          initialChildren: children,
        );

  static const String name = 'HabilidadesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PortfolioPage]
class PortfolioRoute extends PageRouteInfo<void> {
  const PortfolioRoute({List<PageRouteInfo>? children})
      : super(
          PortfolioRoute.name,
          initialChildren: children,
        );

  static const String name = 'PortfolioRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [ProjetosPage]
class ProjetosRoute extends PageRouteInfo<void> {
  const ProjetosRoute({List<PageRouteInfo>? children})
      : super(
          ProjetosRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProjetosRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SobreMimPage]
class SobreMimRoute extends PageRouteInfo<void> {
  const SobreMimRoute({List<PageRouteInfo>? children})
      : super(
          SobreMimRoute.name,
          initialChildren: children,
        );

  static const String name = 'SobreMimRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
