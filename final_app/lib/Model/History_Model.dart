import 'package:flutter/cupertino.dart';

class HistoryModel extends ChangeNotifier {
  String? equation = "0";
  String? result = "0";
  String? expression = "";

  get getEquation => this.equation;

  set setEquation(value) {
    this.equation = value;
    notifyListeners();
  }

  get getResult => this.result;

  set setResult(value) {
    this.result = value;
    notifyListeners();
  }

  get getExpression => this.expression;

  set setExpression(value) {
    this.expression = value;
    notifyListeners();
  }
}
