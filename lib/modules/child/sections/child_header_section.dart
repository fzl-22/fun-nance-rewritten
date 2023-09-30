import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:fun_nance_rewritten/modules/parent/profile/parent_profile_page.dart';

class ChildHeaderSection extends StatelessWidget {
  final String childName;
  final String description;

  const ChildHeaderSection({
    super.key,
    required this.childName,
    required this.description,
  });

  String get _firstName {
    return childName.split(" ").toList()[0];
  }

  @override
  Widget build(BuildContext context) {
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
                child: ProfilePicture(
                  name: childName,
                  radius: 24,
                  fontsize: 16,
                  count: 2,
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
