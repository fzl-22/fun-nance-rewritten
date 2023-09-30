import 'package:flutter/material.dart';
import 'package:fun_nance_rewritten/global/widgets/buttons/google_button.dart';
import 'package:fun_nance_rewritten/global/widgets/buttons/submit_button.dart';
import 'package:fun_nance_rewritten/global/widgets/fields/highlighted_text_form_field.dart';
import 'package:fun_nance_rewritten/modules/parent/auth/widgets/auth_navigation_button.dart';
import 'package:fun_nance_rewritten/modules/parent/auth/widgets/forgot_password_button.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';

class ParentLoginPage extends StatefulWidget {
  const ParentLoginPage({super.key});

  @override
  State<ParentLoginPage> createState() => _ParentLoginPageState();
}

class _ParentLoginPageState extends State<ParentLoginPage> {
  final _formKey = GlobalKey<FormState>();

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
                  Text("Yuk masuk terlebih dahulu ke akunmu!",
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
                      hintText: "Email atau nomor hp",
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
                    const SizedBox(height: 12),
                    const ForgotPasswordButton(),
                    const SizedBox(height: 12),
                    SubmitButton(
                      onPressed: () {
                        context.go("/parent/home");
                      },
                      label: "MASUK",
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
                    firstText: "Belum mempunyai akun?",
                    secondText: "daftar",
                    onPressed: () {
                      context.go("/parent/register");
                    },
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "atau",
                    style: Theme.of(context).textTheme.bodyLarge,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  GoogleButton(
                    onPressed: () {},
                    label: "MASUK DENGAN GOOGLE",
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
