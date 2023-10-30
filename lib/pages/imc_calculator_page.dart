import 'dart:math';
import 'package:flutter/material.dart';

class ImcCalculatorPage extends StatefulWidget {
  const ImcCalculatorPage({Key? key}) : super(key: key);

  @override
  State<ImcCalculatorPage> createState() => _ImcCalculatorPageState();
}

class _ImcCalculatorPageState extends State<ImcCalculatorPage> {
  final TextEditingController heightInputController = TextEditingController();
  final TextEditingController weightInputController = TextEditingController();

  String imcResult = '0.00';

  double? height;
  double? weight;

  void handleImcCalculation() {
    setState(() {
      height = double.tryParse(heightInputController.text) ?? 0;
      weight = double.tryParse(weightInputController.text) ?? 0;

      final double calculation = weight! / pow(height!, 2);

      imcResult = (!calculation.isNaN && !calculation.isInfinite)
          ? calculation.toStringAsFixed(2)
          : '0.00';
    });
  }

  void handleClearInputs() {
    setState(() {
      heightInputController.clear();
      weightInputController.clear();
      imcResult = '0.00';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.orangeAccent,
            Colors.lightBlue,
            Colors.teal,
          ],
        ),
      ),
      // pega a largura da tela do celular
      width: MediaQuery.of(context).size.width,
      // pega a altura da tela do celular
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(top: 40, bottom: 20),
            child: Text(
              'Calculadora de IMC\n(índice de Massa Corpórea)',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(bottom: 20, left: 10, right: 10),
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white30,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              'Seu IMC é de: $imcResult',
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(30, 40, 30, 0),
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: TextField(
                        controller: heightInputController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: 'Digite sua altura',
                          filled: true,
                          labelText: 'Altura (em metros)',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: weightInputController,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        hintText: 'Digite seu peso',
                        filled: true,
                        labelText: 'Peso (em Kg)',
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 15),
                          child: TextButton(
                            onPressed: handleClearInputs,
                            child: const Text('Limpar'),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: handleImcCalculation,
                          child: const Text('Calcular'),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
