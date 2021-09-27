import 'package:flutter/material.dart';
import 'package:project_app/Pages/ProfileFormModel.dart';
import 'package:provider/provider.dart';

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
  final _formKey = GlobalKey<FormState>();
  String? _userName;
  String? _firstName;
  String? _lastName;
  String? _dateOfBirth;
  int? _age;
  String? _gender;
  String? _email;

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
                ),
              ),
              Container(
                width: 500,
                padding: EdgeInsets.all(10.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: "Date of Birth",
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
                    hintText: "Enter date of birth",
                    prefixIcon:
                        Icon(Icons.calendar_today, color: Colors.black45),
                  ),
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
                ),
              ),
              Padding(padding: EdgeInsets.all(10)),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/1');
                  if (_formKey.currentState!.validate()) {
                    return;
                  }
                  _formKey.currentState!.save();
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
