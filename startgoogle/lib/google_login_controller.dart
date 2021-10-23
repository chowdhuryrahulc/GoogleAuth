import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';

class X with ChangeNotifier {
  var Y = GoogleSignIn();
  GoogleSignInAccount? googleAccount;

  login() async {
    this.googleAccount = await Y.signIn();
    notifyListeners();
  }

  logout() async {
    this.googleAccount = await Y.signOut();
    notifyListeners();
  }
}
