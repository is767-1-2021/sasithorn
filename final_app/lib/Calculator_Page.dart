import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(CalculatorPage());
}

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String equation = "0";
  String result = "0";
  String expression = "";
  double equationFontSize = 28;
  double resualtFontSize = 48;

  buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        equation = "0";
        result = "0";
        equationFontSize = 28;
        resualtFontSize = 48;
      } else if (buttonText == "⌫") {
        equationFontSize = 28;
        resualtFontSize = 48;
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "0";
        }
      } else if (buttonText == "=") {
        equationFontSize = 28;
        resualtFontSize = 48;

        expression = equation;
        expression = expression.replaceAll('×', '*');
        expression = expression.replaceAll('÷', '/');

        try {
          Parser p = new Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = "Error";
        }
      } else {
        equationFontSize = 28;
        resualtFontSize = 38;
        if (equation == "0") {
          equation = buttonText;
        } else {
          equation = equation + buttonText;
        }
      }
    });
  }

  Widget buildButton(
      String buttonText, double buttonHeight, Color buttonColor) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1 * buttonHeight,
      color: buttonColor,
      child: TextButton(
        onPressed: () => buttonPressed(buttonText),
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
              side: BorderSide(
                  color: Colors.white, width: 1, style: BorderStyle.solid),
            ),
          ),
        ),
        child: Text(
          buttonText,
          style: TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.normal,
              color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[600],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[600],
        title: Text(
          'Standard',
          style: TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        actions: [
          IconButton(
            padding: EdgeInsets.only(right: 190),
            onPressed: () {
              Navigator.pushNamed(context, '/2');
            },
            icon: Icon(
              Icons.history,
            ),
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(
              equation,
              style: TextStyle(
                fontSize: equationFontSize,
                color: Colors.white70,
              ),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
            child: Text(
              result,
              style: TextStyle(
                fontSize: resualtFontSize,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: Divider(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width * 1,
                child: Table(
                  border: TableBorder.symmetric(
                    inside:
                        BorderSide(width: 2, color: Colors.blueGrey.shade600),
                    outside:
                        BorderSide(width: 2, color: Colors.blueGrey.shade600),
                  ),
                  children: [
                    TableRow(
                      children: [
                        buildButton("MC", 1, Colors.blueGrey.shade600),
                        buildButton("MR", 1, Colors.blueGrey.shade600),
                        buildButton("M+", 1, Colors.blueGrey.shade600),
                        buildButton("M-", 1, Colors.blueGrey.shade600),
                        buildButton("MS", 1, Colors.blueGrey.shade600),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width * 1,
            child: Table(
              border: TableBorder.symmetric(
                inside: BorderSide(width: 2, color: Colors.blueGrey.shade600),
                outside: BorderSide(width: 2, color: Colors.blueGrey.shade600),
              ),
              children: [
                TableRow(
                  children: [
                    buildButton("%", 1, Colors.blueGrey.shade800),
                    buildButton("CE", 1, Colors.blueGrey.shade800),
                    buildButton("C", 1, Colors.blueGrey.shade800),
                    buildButton("⌫", 1, Colors.blueGrey.shade800),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 1,
            child: Table(
              border: TableBorder.symmetric(
                inside: BorderSide(width: 2, color: Colors.blueGrey.shade600),
                outside: BorderSide(width: 2, color: Colors.blueGrey.shade600),
              ),
              children: [
                TableRow(
                  children: [
                    buildButton("1/x", 1, Colors.blueGrey.shade800),
                    buildButton("x²", 1, Colors.blueGrey.shade800),
                    buildButton("√", 1, Colors.blueGrey.shade800),
                    buildButton("÷", 1, Colors.blueGrey.shade800),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 1,
            child: Table(
              border: TableBorder.symmetric(
                inside: BorderSide(width: 2, color: Colors.blueGrey.shade600),
                outside: BorderSide(width: 2, color: Colors.blueGrey.shade600),
              ),
              children: [
                TableRow(
                  children: [
                    buildButton("7", 1, Colors.blueGrey.shade900),
                    buildButton("8", 1, Colors.blueGrey.shade900),
                    buildButton("9", 1, Colors.blueGrey.shade900),
                    buildButton("×", 1, Colors.blueGrey.shade800),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 1,
            child: Table(
              border: TableBorder.symmetric(
                inside: BorderSide(width: 2, color: Colors.blueGrey.shade600),
                outside: BorderSide(width: 2, color: Colors.blueGrey.shade600),
              ),
              children: [
                TableRow(
                  children: [
                    buildButton("4", 1, Colors.blueGrey.shade900),
                    buildButton("5", 1, Colors.blueGrey.shade900),
                    buildButton("6", 1, Colors.blueGrey.shade900),
                    buildButton("-", 1, Colors.blueGrey.shade800),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 1,
            child: Table(
              border: TableBorder.symmetric(
                inside: BorderSide(width: 2, color: Colors.blueGrey.shade600),
                outside: BorderSide(width: 2, color: Colors.blueGrey.shade600),
              ),
              children: [
                TableRow(
                  children: [
                    buildButton("1", 1, Colors.blueGrey.shade900),
                    buildButton("2", 1, Colors.blueGrey.shade900),
                    buildButton("3", 1, Colors.blueGrey.shade900),
                    buildButton("+", 1, Colors.blueGrey.shade800),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 1,
            child: Table(
              border: TableBorder.symmetric(
                inside: BorderSide(width: 2, color: Colors.blueGrey.shade600),
                outside: BorderSide(width: 2, color: Colors.blueGrey.shade600),
              ),
              children: [
                TableRow(
                  children: [
                    buildButton("+/-", 1, Colors.blueGrey.shade900),
                    buildButton("0", 1, Colors.blueGrey.shade900),
                    buildButton(".", 1, Colors.blueGrey.shade900),
                    buildButton("=", 1, Colors.blueGrey),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
