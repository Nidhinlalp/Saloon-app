import 'package:flutter/foundation.dart';
import 'package:salloon_app/features/auth/data/data_source/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class UserLoginRemoteDataSource {
  Future<UserModel> userLogin();
}

class UserLoginRemoteDataSourceImpl extends UserLoginRemoteDataSource {
  final FirebaseFirestore firestor;
  final FirebaseAuth aut;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  UserLoginRemoteDataSourceImpl(this.firestor, this.aut);

  CollectionReference get _users => firestor.collection('users');

  @override
  Future<UserModel> userLogin() async {
    UserCredential userCredential;

    if (kIsWeb) {
      GoogleAuthProvider googleAuthProvider = GoogleAuthProvider();
      googleAuthProvider
          .addScope('https://www.googleapis.com/auth/contacts.readonly');
      userCredential = await aut.signInWithPopup(googleAuthProvider);
    } else {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      final googleAuth = await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      userCredential = await aut.signInWithCredential(credential);
    }

    late UserModel userModel;

    if (userCredential.additionalUserInfo!.isNewUser) {
      userModel = UserModel(
        uid: userCredential.user!.uid,
        displayName: userCredential.user!.displayName ?? "No displayName",
        email: userCredential.user!.email ?? "No email",
        photoURL: userCredential.user!.photoURL ??
            "https://t3.ftcdn.net/jpg/00/64/67/52/360_F_64675209_7ve2XQANuzuHjMZXP3aIYIpsDKEbF5dD.jpg",
      );
      await _users.doc(userCredential.user!.uid).set(userModel.toMap());
    }

    return userModel;
  }
}
