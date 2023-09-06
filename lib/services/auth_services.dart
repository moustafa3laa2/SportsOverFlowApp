// import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  ///////// Google SignIn ////////////
  Future<void> handleSignIn() async {
    try {
      GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser != null) {
        GoogleSignInAuthentication googleAuth = await googleUser.authentication;
        AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        await _auth.signInWithCredential(credential);
        UserCredential userCredential =
            await _auth.signInWithCredential(credential);
        String displayName = userCredential.user!.displayName!;
        List<String> nameComponents = displayName.split(' ');
        String firstName = nameComponents.first;
        String lastName = nameComponents.last;
      }
    } catch (e) {
      print('error sign in $e');
    }
  }

  ////////////Google sign out ////////

  Future<void> handleSignOut() async {
    try {
      await _googleSignIn.signOut();
      await _auth.signOut();
    } catch (e) {
      print('error signin outS$e');
    }
  }
}

  ////////// PPhone Auth //////////

  //google sign with google
  
  // signInWithGoogle() async {
  //   // begin interactive sign in prosess
  //   final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
  //   //obtain auth details from reques
  //   final GoogleSignInAuthentication gAuth = await gUser!.authentication;
  //   //create a new credential for user
  //   final Credential = GoogleAuthProvider.credential(
  //     accessToken: gAuth.accessToken,
  //     idToken: gAuth.idToken,
  //   );

  //   //finally, lets sign in 
  //   return await FirebaseAuth.instance.signInWithCredential(Credential);
  // }


