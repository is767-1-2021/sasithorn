import 'package:flutter/material.dart';
import 'package:project_app/Model/ProfileFormModel.dart';
import 'package:project_app/Pages/ChangePasswordPage.dart';
import 'package:project_app/Pages/EditProfilePage.dart';
import 'package:project_app/Pages/HelpCenterPage.dart';
import 'package:project_app/Pages/HistoryDealPage.dart';
import 'package:project_app/Pages/PrivacyPolicyPage.dart';

import 'package:provider/provider.dart';

import 'Pages/MyProfilePage.dart';
import 'Pages/EditProfilePage.dart';
import 'Pages/TermsOfServicePage.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => ProfileFormModel(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/7',
        routes: <String, WidgetBuilder>{
          '/1': (context) => MyProfilePage(),
          '/2': (context) => EditProfilePage(),
          '/3': (context) => HistoryDealPage(),
          '/4': (context) => HelpCenterPage(),
          '/5': (context) => ChangePasswordPage(),
          '/6': (context) => PrivacyPolicyPage(),
          '/7': (context) => TermsOfServicePage(),
        });
  }
}
