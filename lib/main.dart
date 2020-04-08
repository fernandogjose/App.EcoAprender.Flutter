import 'package:app_escola_ecoaprender/views/shared/pages/home.page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/comunicado.controller.dart';
import 'controllers/home.controller.dart';
import 'views/shared/pages/login.page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HomeController>.value(value: HomeController()),
        ChangeNotifierProvider<ComunicadoController>.value(value: ComunicadoController()),
      ],
      child: Main(),
    );
  }
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eco Aprender',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
