import 'package:flutter/material.dart';
import 'package:my_calculator/widget/button_widget.dart';
import 'package:math_expressions/math_expressions.dart';

class CalcPage extends StatefulWidget {
  const CalcPage({super.key});

  @override
  State<CalcPage> createState() => _CalcPageState();
}

class _CalcPageState extends State<CalcPage> {
  String userInputs = '';
  String answer = '';
  List<String> listOfButtons = [
    'C',
    'DEL',
    '%',
    '/',
    '7',
    '8',
    '9',
    'x',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];

  bool isOperator(String x) {
    if (x == '%' ||
        x == '/' ||
        x == 'x' ||
        x == '-' ||
        x == '+' ||
        x == '=' ||
        x == 'ANS') {
      return true;
    } else {
      return false;
    }
  }

  void equalPressed() {
    String question = userInputs;
    question = question.replaceAll('x', '*');

    ExpressionParser p = GrammarParser();
    Expression exp = p.parse(question);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    answer = eval.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50.0),
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white70,
                  ),
                  padding: EdgeInsets.all(15),
                  alignment: Alignment.bottomLeft,
                  child: Text(userInputs, style: TextStyle(fontSize: 25.0)),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white70,
                  ),

                  padding: EdgeInsets.all(15),
                  alignment: Alignment.bottomRight,
                  child: Text(answer, style: TextStyle(fontSize: 25.0)),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            child: GridView.builder(
              itemCount: listOfButtons.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              itemBuilder: (context, index) {
                return ButtonWidget(
                  onTapped: () {
                    String clickedButton = listOfButtons[index];
                    setState(() {
                      if (index == 0) {
                        userInputs = '';
                        answer = '';
                      } else if (index == 1) {
                        userInputs = userInputs.substring(
                          0,
                          userInputs.length - 1,
                        );
                      } else if (index == listOfButtons.length - 1 ||
                          index == listOfButtons.length - 2) {
                        setState(() {
                          equalPressed();
                        });
                      } else {
                        if (isOperator(listOfButtons[index]) &&
                            isOperator(userInputs[userInputs.length - 1])) {
                          return;
                        }
                        userInputs += listOfButtons[index];
                      }
                    });
                  },
                  buttonText: listOfButtons[index],
                  buttonBgColor:
                      isOperator(listOfButtons[index])
                          ? Colors.orange
                          : Colors.black87,
                  buttonTextColor:
                      isOperator(listOfButtons[index])
                          ? Colors.black
                          : Colors.white,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
