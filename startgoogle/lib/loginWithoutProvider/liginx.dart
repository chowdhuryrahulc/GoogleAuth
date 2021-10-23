import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:startgoogle/loginWithoutProvider/showProfile.dart';

class Logonx extends StatefulWidget {
  const Logonx({Key? key}) : super(key: key);

  @override
  _LogonxState createState() => _LogonxState();
}

class _LogonxState extends State<Logonx> {
  var googleSignIn = GoogleSignIn();
  GoogleSignInAccount? googleAccount;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () async {
                  this.googleAccount = await googleSignIn.signIn();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ShowProfile(googleAccount)));
                },
                child: Text('LOGIN'))
          ],
        ),
      ),
    );
  }
}
