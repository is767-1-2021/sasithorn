import 'dart:html';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:project_app/Model/ProfileFormModel.dart';

var assetImage = AssetImage('assets/profile.png');
var image = Image(
  image: assetImage,
);

class MyProfilePage extends StatefulWidget {
  @override
  _MyProfilePageState createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  String? _formData = 'Please enter username';

  get child => null;

  final List<String> _listItem = [
    'History Deal',
    'Favorite',
    'Help',
    'Log Out'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurple[600],
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          PopupMenuButton(
              icon: Icon(Icons.settings),
              itemBuilder: (context) => [
                    PopupMenuItem(
                      child: Text('Notifications'),
                      value: 1,
                    ),
                    PopupMenuItem(
                      child: Text('Change Password'),
                      value: 2,
                    ),
                    PopupMenuItem(
                      child: Text('Location'),
                      value: 3,
                    ),
                    PopupMenuItem(
                      child: Text('Privacy Policy'),
                      value: 4,
                    ),
                    PopupMenuItem(
                      child: Text('Terms of service'),
                      value: 5,
                    ),
                  ]),
          SizedBox(
            width: 12.0,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: Container(
                height: 150,
                color: Colors.black12,
                child: Row(
                  children: [
                    Center(
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 20, right: 20, top: 10, bottom: 10),
                        child: Expanded(
                          child: Image.asset("assets/profile.png"),
                          flex: 2,
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: EdgeInsets.only(left: 100),
                          child: Consumer<ProfileFormModel>(
                              builder: (context, form, child) {
                            return Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 10),
                                ),
                                Text(
                                  '${form.userName}',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ],
                            );
                          }),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          child: Consumer<ProfileFormModel>(
                            builder: (context, form, child) {
                              return Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(left: 100),
                                  ),
                                  Text(
                                    '${form.email}',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 100),
                          child: ElevatedButton(
                            onPressed: () async {
                              var response =
                                  await Navigator.pushNamed(context, '/2');

                              if (response != null &&
                                  !response.toString().isEmpty) {
                                setState(() {
                                  _formData = response.toString();
                                });
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.deepPurple.shade600,
                              onPrimary: Colors.white,
                            ),
                            child: Text('Edit Profile'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Card(
              margin: EdgeInsets.symmetric(horizontal: 5.0, vertical: 3.0),
              clipBehavior: Clip.antiAlias,
              color: Colors.white,
              elevation: 5.0,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 22.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.assistant,
                                color: Colors.red[900],
                              ),
                              Padding(
                                padding: EdgeInsets.all(5),
                              ),
                              Text(
                                "Hosted",
                                style: TextStyle(
                                  color: Colors.red[900],
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            "3",
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.red[300],
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.group_add,
                                color: Colors.amber[700],
                              ),
                              Padding(
                                padding: EdgeInsets.all(5),
                              ),
                              Text(
                                "Joint",
                                style: TextStyle(
                                  color: Colors.amber[700],
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            "5",
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.amber[300],
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.deck,
                                color: Colors.green[600],
                              ),
                              Padding(
                                padding: EdgeInsets.all(5),
                              ),
                              Text(
                                "Closed",
                                style: TextStyle(
                                  color: Colors.green[600],
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            "2",
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.green[300],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: Card(
                child: ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, '/3');
                  },
                  title: Text(
                    'History Deal',
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black38),
                  ),
                  leading: Icon(Icons.history),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: Card(
                child: ListTile(
                  onTap: () {},
                  title: Text(
                    'Favorite Deal',
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black38),
                  ),
                  leading: Icon(Icons.favorite),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(5),
              child: Card(
                child: ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, '/4');
                  },
                  title: Text(
                    'Help Center',
                    style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black38),
                  ),
                  leading: Icon(Icons.help),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: ElevatedButton(
                child: Text('Log Out'),
                onPressed: () {
                  Navigator.popUntil(context, ModalRoute.withName('/home'));
                },
                style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple.shade600,
                    onPrimary: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
