import 'package:calculadora_manutencao/utils/calcExpression.dart';
import 'package:flutter/material.dart';
import '../components/Keyboard.dart';
import '../components/Menu.dart';
import '../components/Screen.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({ super.key });

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String calculation = '';
  double result = 0;

  addCharacter(String text) {
    setState(()  {
      calculation = calculation + text;
    });
  }
  calcResult() {
    setState(() {
      result = calcExpression(calculation);
    });
  }
  clearScreen() {
    setState(() {
      calculation = '';
      result = 0;
    });
  }
  clearCalculation() {

    setState(() {
      calculation = '';
      result = 0;
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator Page"),
      ),
      drawer: Menu(context),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Screen(context, calculation, result.toString()),
            SizedBox( height: 12),
            Keyboard(context, (string) { addCharacter(string);}, calcResult, clearScreen )
          ],
        ),
      ),
    );
  }
}