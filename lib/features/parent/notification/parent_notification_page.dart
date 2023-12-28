import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fun_nance_rewritten/core/services/firebase_service.dart';

class ParentNotificationPage extends ConsumerWidget {
  const ParentNotificationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                await signOutUser();
              },
              child: const Text("Sign Out"),
            ),
          ],
        ),
      ),
    );
  }
}
