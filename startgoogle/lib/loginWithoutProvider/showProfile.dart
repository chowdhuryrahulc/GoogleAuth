import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ShowProfile extends StatefulWidget {
  GoogleSignInAccount? googlAccount;

  ShowProfile(this.googlAccount, {Key? key}) : super(key: key);

  @override
  _ShowProfileState createState() => _ShowProfileState();
}

class _ShowProfileState extends State<ShowProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
                accountName: Text(widget.googlAccount!.displayName ?? ''),
                accountEmail: Text(widget.googlAccount!.email))
          ],
        ),
      ),
    );
  }
}
