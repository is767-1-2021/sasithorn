import 'package:flutter/material.dart';

var assetImage = AssetImage('assets/profile.png');
var image = Image(
  image: assetImage,
);
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: ProfilePage(title: 'Profile'),
    );
  }
}

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 4.0,
          actions: [
            Icon(Icons.settings),
          ],
          title: Text(
            "Profile",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                width: 190.0,
                height: 190.0,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/profile.png')))),
            SizedBox(
              height: 12.0,
            ),
            Text(
              "John Doe",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 28,
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            Text(
              "Edit Profile",
              style: TextStyle(
                color: Colors.black38,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FlatButton(
                  onPressed: () {},
                  color: Colors.teal.shade800,
                  child: Text(
                    "History Deal",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 100.0, vertical: 14.0),
                ),
                SizedBox(
                  height: 18.0,
                ),
                FlatButton(
                  onPressed: () {},
                  color: Colors.teal.shade800,
                  child: Text(
                    "Favorite Deal",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 110.0, vertical: 14.0),
                ),
                SizedBox(
                  height: 18.0,
                ),
                FlatButton(
                  onPressed: () {},
                  color: Colors.teal.shade800,
                  child: Text(
                    "Review",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 120.0, vertical: 14.0),
                ),
                SizedBox(
                  height: 60.0,
                ),
                FlatButton(
                  onPressed: () {},
                  color: Colors.red.shade800,
                  child: Text(
                    "Log Out",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                    ),
                  ),
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
                ),
              ],
            )
          ],
        )));
  }
}
