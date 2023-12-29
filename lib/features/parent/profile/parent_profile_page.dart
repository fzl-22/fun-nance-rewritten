import 'package:flutter/material.dart';
import 'package:flutter_profile_picture/flutter_profile_picture.dart';
import 'package:fun_nance_rewritten/core/themes/color_theme.dart';
import 'package:fun_nance_rewritten/core/widgets/buttons/submit_button.dart';
import 'package:fun_nance_rewritten/core/widgets/fields/highlighted_text_form_field.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';

class ParentProfilePage extends StatelessWidget {
  const ParentProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController(text: "Andi Divangga");
    final emailController = TextEditingController(text: "andi.dvga@gmail.com");

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(IconlyLight.arrow_left_2),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: ColorTheme.warmGradient,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 64),
            const ProfilePicture(
              name: "Andi Divangga",
              radius: 64,
              fontsize: 36,
            ),
            const SizedBox(height: 12),
            Text(
              "Andi Divangga",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: Text(
                        "Data Diri",
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      "Nama Lengkap",
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    HighlightedTextFormField(
                      hintText: "Nama lengkap",
                      controller: nameController,
                    ),
                    const SizedBox(height: 24),
                    Text(
                      "Email atau nomor handphone",
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    HighlightedTextFormField(
                      hintText: "Email atau nomor handphone",
                      controller: emailController,
                    ),
                    Row(
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            padding: EdgeInsets.zero,
                          ),
                          onPressed: () {},
                          child: const Text("Ganti password?"),
                        ),
                        const Spacer(),
                      ],
                    ),
                    const Spacer(),
                    SubmitButton(
                      onPressed: () {
                        context.go("/welcome");
                      },
                      label: "LOGOUT",
                      icon: IconlyLight.logout,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
