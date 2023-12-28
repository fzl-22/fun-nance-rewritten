import 'package:flutter/material.dart';
import 'package:fun_nance_rewritten/core/models/parent.dart';
import 'package:fun_nance_rewritten/core/services/firebase_service.dart';
import 'package:fun_nance_rewritten/core/widgets/buttons/submit_button.dart';
import 'package:fun_nance_rewritten/core/widgets/fields/highlighted_text_form_field.dart';
import 'package:fun_nance_rewritten/features/parent/auth/widgets/auth_navigation_button.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';

class ParentRegisterPage extends StatelessWidget {
  ParentRegisterPage({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _emailHpController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: IconButton(
          onPressed: () {
            context.go("/welcome");
          },
          icon: const Icon(
            IconlyLight.arrow_left_2,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              "assets/images/auth/bird_wallpaper.png",
              width: MediaQuery.of(context).size.width,
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "Selamat Datang",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 12),
                  Text("Buat akunmu terlebih dahulu yuk!",
                      style: Theme.of(context).textTheme.labelMedium),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    HighlightedTextFormField(
                      hintText: "Nama lengkap",
                      controller: _fullNameController,
                      keyboardType: TextInputType.name,
                    ),
                    const SizedBox(height: 24),
                    HighlightedTextFormField(
                      hintText: "Email atau nomor HP",
                      controller: _emailHpController,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 24),
                    HighlightedTextFormField(
                      hintText: "Password",
                      controller: _passwordController,
                      obscureText: true,
                      keyboardType: TextInputType.visiblePassword,
                      isPassword: true,
                    ),
                    const SizedBox(height: 36),
                    SubmitButton(
                      onPressed: () {
                        registerUser(
                          context,
                          Parent(
                            fullName: _fullNameController.text,
                            email: _emailHpController.text,
                            password: _passwordController.text,
                          ),
                        );
                      },
                      label: "DAFTAR",
                      icon: IconlyBold.arrow_right_2,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AuthNavigationButton(
                    firstText: "Sudah mempunyai akun?",
                    secondText: "login",
                    onPressed: () {
                      context.go('/parent/login');
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
