import 'package:flutter/material.dart';
import 'package:project_app/Pages/EditProfilePage.dart';

import 'Pages/ProfilePage.dart';
import 'Pages/EditProfilePage.dart';

void main() {
  runApp(MyApp());
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
          '/1': (context) => ProfilePage(),
          '/2': (context) => EditProfilePage(),
        });
  }
}
