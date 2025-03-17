import 'package:flutter/material.dart';
import 'package:my_calculator/widget/button_widget.dart';

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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20.0),
        Expanded(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(15),
                  alignment: Alignment.bottomLeft,
                  child: Text(userInputs, style: TextStyle(fontSize: 20.0)),
                ),
                Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(15),
                  alignment: Alignment.bottomRight,
                  child: Text(answer, style: TextStyle(fontSize: 20.0)),
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
                    setState(() {
                      if (index == 0) {
                        userInputs = '';
                      } else if (index == 1) {
                        userInputs = userInputs.substring(
                          0,
                          userInputs.length - 1,
                        );
                      } else {
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
}
