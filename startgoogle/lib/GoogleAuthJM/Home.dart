import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:startgoogle/GoogleAuthJM/Profilepage.dart';
import 'package:startgoogle/GoogleAuthJM/google_sign_in.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Provider.of<GoogleSignInProvider>(context, listen: false)
                  .googleLogin()
                  .then((value) => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Profilepage())));
            },
            child: Text('Sign In Auth Google')),
      ),
    );
  }
}
