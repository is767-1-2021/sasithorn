import 'package:flutter/material.dart';

class BlankPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Blank Page 2'),
        backgroundColor: Colors.deepPurple[600],
        leading: IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/0');
            },
            icon: Icon(Icons.arrow_back)),
      ),
    );
  }
}
