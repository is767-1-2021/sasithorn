import 'package:flutter/material.dart';
import 'package:project_app/Pages/ProfileFormModel.dart';
import 'package:provider/provider.dart';

var assetImage = AssetImage('assets/profile.png');
var image = Image(
  image: assetImage,
);

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String? _formKey = 'Please enter username';

  @override
  Widget build(BuildContext context) {
    final List<String> ProfileTitles = [
      'History Deal',
      'WeDeal Rewards',
      'Favorite',
      'Help Center',
      'Q&A'
    ];
    final icons = [
      Icons.history,
      Icons.verified,
      Icons.favorite,
      Icons.help,
      Icons.question_answer
    ];
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
                      child: Text('Location'),
                      value: 2,
                    ),
                    PopupMenuItem(
                      child: Text('Privacy Policy'),
                      value: 3,
                    ),
                    PopupMenuItem(
                      child: Text('Terms of service'),
                      value: 4,
                    ),
                  ]),
          SizedBox(
            width: 12.0,
          )
        ],
      ),
      body: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20),
              width: 150.0,
              height: 150.0,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/profile.png'))),
              alignment: Alignment.topCenter,
            ),
            Padding(
              padding: EdgeInsets.all(5),
              child: Text(
                'Harry Potter',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
            ),
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/2');
                },
                child: Text(
                  "Edit Profile",
                  style: TextStyle(color: Colors.black45, fontSize: 16),
                )),
            SizedBox(height: 5),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: Icon(icons[index]),
                      title: Text(ProfileTitles[index]),
                      onTap: () {
                        Navigator.pushNamed(context, '/${index + 3}');
                      },
                    ),
                  );
                },
              ),
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.deepPurple[600],
                onPrimary: Colors.white,
              ),
              onPressed: () {},
              icon: Icon(
                Icons.logout,
                size: 18,
              ),
              label: Text(
                "Log Out",
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: 15))
          ])),
    );
  }
}
