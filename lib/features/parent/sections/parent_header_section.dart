import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fun_nance_rewritten/core/providers/parent_provider.dart';
import 'package:fun_nance_rewritten/features/parent/profile/parent_profile_page.dart';
import 'package:go_router/go_router.dart';

class ParentHeaderSection extends ConsumerWidget {
  final String parentName;
  final String description;

  const ParentHeaderSection({
    super.key,
    required this.parentName,
    required this.description,
  });

  String get _firstName {
    return parentName.split(" ").toList()[0];
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const ParentProfilePage(),
                    ),
                  );
                },
                child: InkWell(
                  onTap: () {
                    ref.read(parentProvider.notifier).logoutParentUser();

                    context.go("/");
                  },
                  child: ProfilePicture(
                    name: parentName,
                    radius: 24,
                    fontsize: 16,
                    count: 2,
                  ),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              Text(
                "Hi, $_firstName",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF56475C),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            description,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w600,
              color: Color(0xFF3B333F),
            ),
          ),
        ],
      ),
    );
  }
}
