import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fun_nance_rewritten/features/parent/home/parent_home_page.dart';
import 'package:fun_nance_rewritten/features/welcome/welcome_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.userChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const ParentHomePage();
        }
        if (snapshot.hasError) {
          // Handle any errors.
          return Text('Error: ${snapshot.error}');
        }
        return const WelcomePage();
      },
    );
  }
}
