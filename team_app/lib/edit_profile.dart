import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:date_field/date_field.dart';
import 'package:team_app/model/profile_model.dart';
import 'package:team_app/model/user_model.dart';

import 'package:team_app/profile.dart';

class EditProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Edit Profile'),
        backgroundColor: Colors.deepPurple[600],
        leading: IconButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MyProfilePage()));
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: EditProfileForm(),
    );
  }
}

class EditProfileForm extends StatefulWidget {
  const EditProfileForm({Key? key}) : super(key: key);

  @override
  _EditProfileFormState createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  var _emailString = '';
  var _passString = '';
  var _userNameString = '';
  var _isLoading = false;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 500,
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Email",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(28.0),
                      borderSide: BorderSide(color: Colors.deepPurple.shade600),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(28.0),
                      borderSide: BorderSide(
                        color: Colors.amber,
                      ),
                    ),
                    hintText: "Enter Email",
                    prefixIcon: Icon(Icons.email, color: Colors.black45),
                  ),
                  validator: (val) {
                    if (val == null || val.isEmpty) {
                      return 'Please enter email';
                    }
                    return null;
                  },
                  onSaved: (val) {
                    _emailString = val!;
                  },
                ),
              ),
              Container(
                width: 500,
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                    obscureText: true,
                    autocorrect: false,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.lock),
                      labelText: "Password",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28.0),
                        borderSide:
                            BorderSide(color: Colors.deepPurple.shade600),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(28.0),
                        borderSide: BorderSide(
                          color: Colors.amber,
                        ),
                      ),
                      hintText: "Enter password",
                      prefixIcon: Icon(Icons.password, color: Colors.black45),
                    ),
                    validator: (val) {
                      if (val!.isEmpty || val.length < 8) {
                        return 'Password must be at least 8 units';
                      }
                      return null;
                    },
                    onSaved: (val) {
                      _passString = val!;
                    }),
              ),
              Container(
                width: 500,
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: "Username",
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(28.0),
                      borderSide: BorderSide(color: Colors.deepPurple.shade600),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(28.0),
                      borderSide: BorderSide(
                        color: Colors.amber,
                      ),
                    ),
                    hintText: "Enter username",
                    prefixIcon: Icon(Icons.face_retouching_natural,
                        color: Colors.black45),
                  ),
                  validator: (val) {
                    if (val!.isEmpty || val.length < 3) {
                      return 'Username must be at least 3 units';
                    }
                    return null;
                  },
                  onSaved: (val) {
                    _userNameString = val!;
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              _isLoading
                  ? CircularProgressIndicator()
                  : Container(
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save();

                            Navigator.pop(context);
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Colors.deepPurple.shade600,
                          onPrimary: Colors.white,
                        ),
                        child: Text('Submit'),
                      ),
                    ),
            ],
          ),
        ));
  }
}
