import 'package:brew/models/user.dart';
import 'package:brew/screens/authenticate/authenticate.dart';
import 'package:brew/screens/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);
    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
    ;
  }
}
