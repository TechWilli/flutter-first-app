// import 'package:first_flutter_app/pages/home_page.dart';
import 'package:first_flutter_app/pages/imc_calculator_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // ou apenas (versões mais atuais do Dart) -> const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // é necessário apenas um MaterialApp na aplicação que dará o visual do Material Design
    return const MaterialApp(
      home: ImcCalculatorPage(),
    );
  }
}
