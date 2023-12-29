import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:fun_nance_rewritten/core/themes/color_theme.dart';
import 'package:fun_nance_rewritten/features/parent/profile/parent_profile_page.dart';
import 'package:go_router/go_router.dart';

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  ),
                ],
              ),
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Logout"),
                        content: const Text("Apakah yakin ingin logout?"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text("Batal"),
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorTheme.mainDarkerOrange,
                              foregroundColor: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();

                              context.go("/");
                            },
                            child: const Text("Logout"),
                          )
                        ],
                      );
                    },
                  );
                },
                icon: const Icon(Icons.logout),
              ),
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
