import 'package:flutter/material.dart';
import 'package:portfolio/interface/configuration/rota/rota.state.dart';
import 'package:portfolio/interface/page/portfolio.page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Isabela\'s Portfolio',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        fontFamily: 'Montserrat',
      ),
      routerConfig: RotaState.instancia!.appRouter.config(),
      debugShowCheckedModeBanner: false,
    );
  }
}
