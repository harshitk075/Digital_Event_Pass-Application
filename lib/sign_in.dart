import 'package:digitaleventpass/globals.dart';
import 'package:digitaleventpass/pages/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn googleSignIn = GoogleSignIn();

String name;
String email;
String imageUrl;
String uid;

Future<String> signInWithGoogle(BuildContext context) async {
  final GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
  final GoogleSignInAuthentication googleSignInAuthentication =
      await googleSignInAccount.authentication;

  final AuthCredential credential = GoogleAuthProvider.getCredential(
    accessToken: googleSignInAuthentication.accessToken,
    idToken: googleSignInAuthentication.idToken,
  );

  final AuthResult authResult = await _auth.signInWithCredential(credential);
  final FirebaseUser user = authResult.user;

  // Checking if details are null
  assert(user.email != null);
  assert(user.displayName != null);
  assert(user.photoUrl != null);
  assert(user.uid != null);

  name = user.displayName;
  email = user.email;
  imageUrl = user.photoUrl;
  uid = user.uid;
//	IntroScreen.setUid(user.uid);
  home.setUid(user.uid);

  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  final FirebaseUser currentUser = await _auth.currentUser();
  assert(user.uid == currentUser.uid);
  print(user.uid);
  print("successfully signed in");
//	await AddOrganizer(uid,name,email);
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setString('kSPuid', uid);
  preferences.setBool('kSPfirstLogIn', false);
  Globaldata.OrganizerID = user.uid;
  return 'signInWithGoogle succeeded: $user';
}

void signOutGoogle() async {
  await googleSignIn.signOut();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.setString('kSPuid', null);
  preferences.setBool('kSPfirstLogIn', true);
  print("User Signed Out");
}
