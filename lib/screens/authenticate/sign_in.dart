import 'package:brew/screens/authenticate/register.dart';
import 'package:brew/services/auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          backgroundColor: Colors.brown[400],
          elevation: 0,
          title: Text('Sign In'),
          actions: <Widget>[
            FlatButton.icon(
                onPressed: () {
                  widget.toggleView();
                },
                icon: Icon(Icons.person_add),
                label: Text("Sign up"))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Column(children: <Widget>[
            SizedBox(height: 20.0),
            TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                onChanged: (val) {
                  setState(() {
                    email = val;
                  });
                }),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              onChanged: (val) {
                setState(() {
                  password = val;
                });
              },
              obscureText: true,
            ),
            SizedBox(height: 20.0),
            RaisedButton(
                color: Colors.pink[400],
                onPressed: () async {
                  print(email);
                  print(password);
                },
                child: Text('Sign in')),
            RaisedButton(
              child: Text('Sign In Anonymously'),
              onPressed: () async {
                dynamic result = await _auth.signInAnon();
                if (result == null) {
                  print('Error signing in');
                } else {
                  print('Signed in');
                  print(result.uid);
                }
              },
            )
          ]),
        ));
  }
}
