import 'package:final_app/Calculator_Page.dart';
import 'package:final_app/History.dart';
import 'package:final_app/Model/History_Model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/1',
        routes: <String, WidgetBuilder>{
          '/1': (context) => CalculatorPage(),
          '/2': (context) => HistoryPage(),
        });
  }
}
