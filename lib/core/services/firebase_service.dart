import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fun_nance_rewritten/core/models/parent.dart';
import 'package:fun_nance_rewritten/core/models/reward.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart';

Future<void> registerUser(BuildContext context, Parent parent) async {
  try {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: parent.email,
      password: parent.password,
    );

    await FirebaseFirestore.instance.collection('parents').add(
          parent.toJson(),
        );

    if (context.mounted) {
      context.go('/parent/login');
    }
  } catch (error) {
    // Handle the error appropriately.
    // For example, you could display an error message to the user or retry the operation.
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('An error occurred while registering the user.'),
        ),
      );
    }
  }
}

Future<void> signOutUser() async {
  await FirebaseAuth.instance.signOut();
}

Future<void> signInUser(
  BuildContext context,
  String email,
  String password,
) async {
  showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      });

  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    if (context.mounted) {
      Navigator.pop(context);
    }

    // print("SUCCESS LOGGED IN");
  } catch (error) {
    // print("ERROR: $error");
    // Handle the error appropriately.
    // For example, you could display an error message to the user or retry the operation.
    if (context.mounted) {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred while logging in the user: $error'),
        ),
      );
    }
  }
}

Future<String> uploadImage(File imageFile) async {
  String fileName = basename(imageFile.path);

  Reference ref = FirebaseStorage.instance.ref().child(fileName);
  UploadTask uploadTask = ref.putFile(imageFile);
  TaskSnapshot snapshot = await uploadTask;
  return await snapshot.ref.getDownloadURL();
}

Future<void> firestoreAddReward(Reward reward) async {
  await FirebaseFirestore.instance.collection('rewards').add(
        reward.toJSON(),
      );
}
