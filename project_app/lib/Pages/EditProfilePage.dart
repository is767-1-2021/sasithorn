import 'dart:math';

import 'package:flutter/material.dart';
import 'package:project_app/Pages/ProfileFormModel.dart';
import 'package:provider/provider.dart';
import 'package:date_field/date_field.dart';

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
            Navigator.pushNamed(context, '/1');
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: EditProfileForm(),
    );
  }
}

class EditProfileForm extends StatefulWidget {
  @override
  _EditProfileFormState createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  bool _isHiden = true;

  final _formKey = GlobalKey<FormState>();
  String? _userName;
  String? _firstName;
  String? _lastName;
  String? _dateOfBirth;
  int? _age;
  String? _gender;
  String? _email;
  String? _changPassword;
  String? _confirmPassword;

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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter username';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _userName = value;
                  },
                ),
              ),
              Container(
                width: 500,
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "First Name",
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
                    hintText: "Enter firstname",
                    prefixIcon:
                        Icon(Icons.account_circle, color: Colors.black45),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter firstname';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _firstName = value;
                  },
                ),
              ),
              Container(
                width: 500,
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Last Name",
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
                    hintText: "Enter lastname",
                    prefixIcon:
                        Icon(Icons.account_circle, color: Colors.black45),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter lastname';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _lastName = value;
                  },
                ),
              ),
              Container(
                width: 500,
                padding: EdgeInsets.all(10.0),
                child: DateTimeFormField(
                  decoration: const InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(28.0)),
                      borderSide: BorderSide(color: Colors.deepPurple),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(28.0)),
                        borderSide: BorderSide(
                          color: Colors.amber,
                        )),
                    hintText: "Pick date of birth",
                    prefixIcon: Icon(Icons.calendar_today),
                    suffixIcon: Icon(Icons.event_note),
                    labelText: 'Date of Birth',
                  ),
                  mode: DateTimeFieldPickerMode.date,
                  autovalidateMode: AutovalidateMode.always,
                  validator: (e) =>
                      (e?.day ?? 0) == 1 ? 'Please select date of birth' : null,
                  onDateSelected: (DateTime value) {
                    print(value);
                  },
                ),
              ),
              Container(
                width: 500,
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Age",
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
                    hintText: "Enter age",
                    prefixIcon: Icon(Icons.face, color: Colors.black45),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter age';
                    }
                    if (int.parse(value) < 18) {
                      return 'Please enter valid age';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _age = int.parse(value!);
                  },
                ),
              ),
              Container(
                width: 500,
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Gender",
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
                    hintText: "Enter gender",
                    prefixIcon: Icon(Icons.group, color: Colors.black45),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter gender';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _gender = value;
                  },
                ),
              ),
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
                    hintText: "Enter email",
                    prefixIcon: Icon(Icons.mail_outline, color: Colors.black45),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter email';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _email = value;
                  },
                ),
              ),
              Container(
                width: 500,
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  obscureText: _isHiden,
                  decoration: InputDecoration(
                      labelText: "Chang Password",
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
                      hintText: "Enter new password",
                      prefixIcon: Icon(Icons.password, color: Colors.black45),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isHiden = !_isHiden;
                          });
                        },
                        icon: Icon(
                            _isHiden ? Icons.visibility : Icons.visibility_off),
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter new password';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _changPassword = value;
                  },
                ),
              ),
              Container(
                width: 500,
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  obscureText: _isHiden,
                  decoration: InputDecoration(
                      labelText: "Confirm Password",
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
                      hintText: "Enter new password",
                      prefixIcon: Icon(Icons.password, color: Colors.black45),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _isHiden = !_isHiden;
                          });
                        },
                        icon: Icon(
                            _isHiden ? Icons.visibility : Icons.visibility_off),
                      )),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter new password';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _confirmPassword = value;
                  },
                ),
              ),
              Padding(padding: EdgeInsets.all(10)),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text('$_userName'),
                    ));
                  }
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.deepPurple.shade600,
                  onPrimary: Colors.white,
                ),
                child: Text('Submit'),
              ),
            ],
          ),
        ));
  }
}
