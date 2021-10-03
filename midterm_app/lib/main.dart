import 'package:flutter/material.dart';
import 'package:midterm_app/Model/ProfileFormModel.dart';
import 'package:midterm_app/Pages/BlankPage.dart';
import 'package:midterm_app/Pages/BlankPage2.dart';
import 'package:midterm_app/Pages/BlankPage4.dart';
import 'package:midterm_app/Pages/EditProfilePage.dart';
import 'package:provider/provider.dart';
import 'Pages/BlankPage3.dart';
import 'Pages/ProfilePage.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ProfileFormModel(),
        ),
      ],
      child: MyApp(),
    ),
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
        home: MyHomePage(title: 'Home'),
        initialRoute: '/2',
        routes: <String, WidgetBuilder>{
          '/0': (context) => MyHomePage(title: 'Home'),
          '/1': (context) => ProfilePage(),
          '/2': (context) => EditProfilePage(),
          '/3': (context) => BlankPage1(),
          '/4': (context) => BlankPage2(),
          '/5': (context) => BlankPage3(),
          '/6': (context) => BlankPage4(),
        });
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple[600],
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/1');
              },
              icon: Icon(Icons.face),
              label: Text('Profile'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple[600], fixedSize: Size(200, 40)),
            ),
            Padding(
              padding: EdgeInsets.all(10),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/2');
              },
              icon: Icon(Icons.mode_edit),
              label: Text('Edit Profile'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple[600], fixedSize: Size(200, 40)),
            ),
            Padding(padding: EdgeInsets.all(10)),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/3');
              },
              icon: Icon(Icons.insert_drive_file),
              label: Text('Blank Page 1'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple[600], fixedSize: Size(200, 40)),
            ),
            Padding(padding: EdgeInsets.all(10)),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/4');
              },
              icon: Icon(Icons.sell),
              label: Text('Blank Page 2'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple[600], fixedSize: Size(200, 40)),
            ),
            Padding(padding: EdgeInsets.all(10)),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/5');
              },
              icon: Icon(Icons.bookmark),
              label: Text('Blank Page 3'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple[600], fixedSize: Size(200, 40)),
            ),
            Padding(padding: EdgeInsets.all(10)),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/6');
              },
              icon: Icon(Icons.pending),
              label: Text('Blank Page 4'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple[600], fixedSize: Size(200, 40)),
            ),
          ],
        ),
      ),
    );
  }
}
