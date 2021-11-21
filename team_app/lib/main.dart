import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:team_app/edit_profile.dart';
import 'package:team_app/firstpage.dart';
import 'package:team_app/historyPageDeal.dart';

import 'package:team_app/login.dart';
import 'package:team_app/model/profile_model.dart';
import 'package:team_app/nav.dart';
import 'package:team_app/services/deal_services.dart';
import 'controllers/deal_controller.dart';
import 'deal_page.dart';
import 'profile.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  var services = FirebaseServices();
  var controller = DealController(services);

  runApp(DealApp(
    controller: controller,
  ));
}

class DealApp extends StatelessWidget {
  final DealController controller;
  DealApp({required this.controller});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.deepPurple[700],
          fontFamily: 'IBM Plex Sans Thai'),
      debugShowCheckedModeBanner: false,
      initialRoute: '/login',
      // home: DealPage(
      //   controller: controller,
      // ),
      routes: <String, WidgetBuilder>{
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/Nav': (context) => Nav(
              controller: controller,
            ),
        '/editProfile': (context) => EditProfilePage(),
        '/profile': (context) => MyProfilePage(),
        '/historydeal': (context) => HistoryDealPage(),
        // '/joindeal': (context) => JoinDeal(ds: ds),
        '/DealPage': (context) => DealPage(controller: controller)
      },
    );
  }
}

class MyApp extends StatelessWidget {
  final DealController controller;
  const MyApp({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ProfileFormModel()),
        Provider(create: (context) => UserDB()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: HomePage(),
        initialRoute: '/Nav',
      ),
    );
  }
}