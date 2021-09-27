import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HistoryDealPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'History Deal',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.deepPurple.shade600,
        leading: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/1');
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
    );
  }
}
