import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:send_money/Models/UserModel.dart';
import 'package:send_money/resources/storage_methods.dart';

import '../provider/user_provider.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserModel> getUserDetails() async {
    User currentUser = _auth.currentUser!;
    DocumentSnapshot snap =
        await _firestore.collection('users').doc(currentUser.uid).get();
    return UserModel.fromJson(snap.data() as Map<String, dynamic>);
  }

  //sign up user
  Future<String> signUpUser({
    required String email,
    required String password,
    required String name,
    required String phoneNumber,
    required String address,
    required String cryptoWalletKey,
  }) async {
    String res = "Some error occurred";
    try {
      UserCredential cred = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      //print(cred.user!.uid);
      UserModel user = UserModel(
          address: address,
          age: '',
          cryptoWalletKey: cryptoWalletKey,
          name: name,
          email: email,
          uid: cred.user!.uid,
          profilePic: '',
          phoneNumber: phoneNumber);

      await _firestore
          .collection('users')
          .doc(cred.user!.uid)
          .set(user.toJson());
      res = 'success';
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<String> updateUser(
      {required Uint8List? file,
      required String email,
      required String age,
      required String name,
      required String phoneNumber,
      required String address,
      required UserModel userdata,
      required BuildContext context}) async {
    String res = "Some error occurred";
    try {
      String photoUrl = userdata.profilePic;
      if (file != null) {
        photoUrl = await StorageMethods().uploadImageToStorage(file);
      }

      UserModel user = UserModel(
          address: address,
          age: age,
          cryptoWalletKey: userdata.cryptoWalletKey,
          name: name,
          email: email,
          uid: userdata.uid,
          profilePic: photoUrl,
          phoneNumber: phoneNumber);

      await _firestore
          .collection('users')
          .doc(userdata.uid)
          .update(user.toJson());

      UserProvider _userProvider = Provider.of(context, listen: false);
      await _userProvider.refreshUser();
      res = 'success';
    } catch (e) {
      res = e.toString();
    }
    return res;
  }

  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    String res = "some error occurred";
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      await _auth.currentUser!.reload();
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<String> resetPassword({
    required String email,
  }) async {
    String res = "some error occurred";
    try {
      await _auth.sendPasswordResetEmail(email: email.trim());
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  // Future<String> updateProfilePic({
  //   required Uint8List file,
  //   required BuildContext context,
  // }) async {
  //   String res = "some error occurred";
  //   try {
  //     String photoUrl = await StorageMethods().uploadImageToStorage(file);
  //     await _firestore
  //         .collection('users')
  //         .doc(_auth.currentUser!.uid)
  //         .update({'profilePic': photoUrl});
  //     UserProvider _userProvider = Provider.of(context, listen: false);
  //     await _userProvider.refreshUser();
  //     res = 'success';
  //   } catch (err) {
  //     res = err.toString();
  //   }
  //   return res;
  // }

  Future<String> signInWithGoogle(context) async {
    String res = "some error occurred";
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      if (googleAuth?.accessToken != null && googleAuth?.idToken != null) {
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );

        UserCredential userCredential =
            await _auth.signInWithCredential(credential);
        if (userCredential.user != null) {
          if (userCredential.additionalUserInfo!.isNewUser) {
            UserModel user = UserModel(
                address: '',
                age: '',
                cryptoWalletKey: '',
                name: userCredential.user!.displayName ?? '',
                email: userCredential.user!.email ?? '',
                uid: userCredential.user!.uid,
                profilePic: userCredential.user!.photoURL ?? '',
                phoneNumber: userCredential.user!.phoneNumber ?? '');

            await _firestore
                .collection('users')
                .doc(userCredential.user!.uid)
                .set(user.toJson());
          } else {}
        } else {
          res = 'Error while signing in';
          return res;
        }
      }
      res = 'success';
    } catch (err) {
      res = err.toString();
    }
    return res;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  String getUid() {
    String uid = FirebaseAuth.instance.currentUser!.uid;
    print(uid);
    return uid;
  }
}
