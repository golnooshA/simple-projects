import 'package:calculator/design/design_color.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'component/round_button.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  _CalculatorViewState createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  String expression = '';
  String result = '';

  final List<String> buttons = [
    'AC', '%', '/', 'C',
    '7', '8', '9', '*',
    '4', '5', '6', '-',
    '1', '2', '3', '+',
    '.', '0', '()', '=',
  ];

  void _onButtonPressed(String text) {
    setState(() {
      if (text == 'AC') {
        expression = '';
        result = '';
      } else if (text == 'C') {
        if (expression.isNotEmpty) {
          expression = expression.substring(0, expression.length - 1);
        }
      } else if (text == '=') {
        try {
          Parser p = Parser();
          Expression exp = p.parse(
            expression.replaceAll('×', '*').replaceAll('÷', '/'),
          );
          ContextModel cm = ContextModel();
          double eval = exp.evaluate(EvaluationType.REAL, cm);
          result = eval.toString();
        } catch (e) {
          result = 'ERROR';
        }
      } else {
        expression += text;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DesignColor.background,
      appBar: AppBar(
        title: const Text('Calculator'),
        backgroundColor: Colors.yellow,
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.bottomRight,
            width: double.infinity,
            height: MediaQuery.of(context).orientation == Orientation.portrait
                ? MediaQuery.of(context).size.height * 0.25
                : MediaQuery.of(context).size.height * 0.35,
            padding: const EdgeInsets.all(24),
            color: DesignColor.containerColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  expression,
                  style: const TextStyle(fontSize: 28, color: DesignColor.dark),
                ),
                const SizedBox(height: 10),
                Text(
                  result,
                  style: const TextStyle(fontSize: 36, color: DesignColor.dark, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: GridView.count(
                crossAxisCount: 4,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                children: buttons.map((btnText) {
                  Color btnColor;
                  Color txtColor = DesignColor.dark;

                  if (btnText == 'AC' || btnText == '%' || btnText == '/') {
                    btnColor = DesignColor.yellow;
                  } else if (btnText == 'C' || btnText == '*' || btnText == '-' || btnText == '+' || btnText == '=') {
                    btnColor = DesignColor.orange;
                  } else {
                    btnColor = DesignColor.lemon;
                  }

                  return RoundButton(
                    width: 70,
                    text: btnText,
                    buttonColor: btnColor,
                    textColor: txtColor,
                    onTap: () => _onButtonPressed(btnText),
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
