import 'package:firebase_core/firebase_core.dart';
import 'package:first_app/Pages/eighth_page.dart';
import 'package:first_app/Pages/seventh_page.dart';
import 'package:first_app/Pages/TodoPage.dart';
import 'package:first_app/controllers/todo.dart';
import 'package:first_app/model/first_form_model.dart';
import 'package:first_app/services.dart/services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Pages/fifth_page.dart';
import 'Pages/first_page.dart';
import 'Pages/fourth_page.dart';
import 'Pages/second_page.dart';
import 'Pages/sixth_page.dart';
import 'Pages/third_page.dart';
import 'Pages/seventh_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  var services = FirebaseServices();
  var controller = TodoController(services);

  runApp(TodoApp(controller: controller));
}

class TodoApp extends StatelessWidget {
  final TodoController controller;
  TodoApp({required this.controller});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TodoPage(controller: controller),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.amber,
        accentColor: Colors.red,
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.purple),
        ),
      ),
      initialRoute: '/8',
      routes: <String, WidgetBuilder>{
        '/1': (context) => FirstPage(),
        '/2': (context) => SecondPage(),
        '/3': (context) => ThirdPage(),
        '/4': (context) => FourthPage(),
        '/5': (context) => FifthPage(),
        '/6': (context) => SixthPage(),
        '/7': (context) => SeventhPage(),
        '/8': (context) => EighthPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Image cat = Image.asset(
    'assets/popcat2.png',
    width: 120,
  );

  Image cat1 = Image.asset(
    'assets/popcat1.png',
    width: 120,
  );

  Image cat2 = Image.asset(
    'assets/popcat2.png',
    width: 120,
  );

  void _incrementCounter() {
    setState(() {
      cat = cat2;
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      cat = cat1;
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              height: 200.0,
              margin: EdgeInsets.only(left: 100.0, right: 100.0, bottom: 20.0),
              padding: EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                  color: Colors.amber.withOpacity(0.50),
                  borderRadius: BorderRadius.circular(10.0)),
              child: cat,
            ),
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                    ),
                    onPressed: _decrementCounter,
                    child: Text('Decrease')),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                    onPressed: _incrementCounter,
                    child: Text('Increase')),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.fingerprint),
      ),
    );
  }
}

class SubmitButton extends StatelessWidget {
  final String buttonText;
  SubmitButton(this.buttonText);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(this.buttonText),
      onPressed: () {
        print('Pressing');
      },
    );
  }
}
