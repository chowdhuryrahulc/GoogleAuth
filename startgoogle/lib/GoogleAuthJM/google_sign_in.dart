import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignInProvider extends ChangeNotifier {
  final googleSignIn = GoogleSignIn();
  GoogleSignInAccount?
      user; //holds all information like email, name, image of user
  Future googleLogin() async {
    //executed when we click on Login
    final googleUser = await googleSignIn
        .signIn(); // Makes Google popup show up to select userAccount
    // if user has selected an account
    if (googleUser == null) return;
    user = googleUser; // If user has selected an account we save it here
    //! Above lines can be summed up in ONE line. "final user = await GoogleSignIn().signIn()"
    final googleAuth =
        await googleUser.authentication; //For backend google Auth
    final credential = GoogleAuthProvider.credential(
        //Put Access token and Id Token from Authentication
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken);
    await FirebaseAuth.instance.signInWithCredential(
        credential); // Using credential to sign in to Firebase Auth
    notifyListeners();
  }

  Future logout() async {
    await googleSignIn.disconnect();
    FirebaseAuth.instance.signOut(); //FireBase signOut
    notifyListeners();
  }
}
